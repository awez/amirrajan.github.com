require 'pp'
require 'httparty'

def extract_from dir
  Dir[dir].map do |filename|
    month_token = filename.split('_')[1]
    contents = File.open(filename, 'rb') { |f| f.read }
    contents.each_line
      .reject { |l| l =~ /Start Date/ }
      .reject { |l| l =~ /Total_/ }
      .map do |l|
      extract_line(l, month_token)
    end
  end.flatten
end

def token_map
  {
    0 =>  { label: :start_date, conversion: lambda { |v| v } },
    1 =>  { label: :end_date, conversion: lambda { |v| v } },
    2 =>  { label: :ups, conversion: lambda { |v| v } },
    3 =>  { label: :isrc, conversion: lambda { |v| v } },
    4 =>  { label: :vendor_id, conversion: lambda { |v| v } },
    5 =>  { label: :quantity, conversion: lambda { |v| v.to_i } },
    6 =>  { label: :partner_share, conversion: lambda { |v| v.to_f } },
    7 =>  { label: :extended_partner_share, conversion: lambda { |v| v.to_f } },
    8 =>  { label: :partner_share_currency, conversion: lambda { |v| v.to_f } },
    9 =>  { label: :sale_or_return, conversion: lambda { |v| v == "S" ? 1 : -1 } },
    10 => { label: :apple_id, conversion: lambda { |v| v } },
    11 => { label: :developer, conversion: lambda { |v| v } },
    12 => { label: :title, conversion: lambda { |v| v } },
    13 => { label: :publisher, conversion: lambda { |v| v } },
    14 => { label: :grid, conversion: lambda { |v| v } },
    15 => { label: :product_type_id, conversion: lambda { |v| v } },
    16 => { label: :isan, conversion: lambda { |v| v } },
    17 => { label: :country, conversion: lambda { |v| v } },
    18 => { label: :pre_order, conversion: lambda { |v| v } },
    19 => { label: :promo_code, conversion: lambda { |v| v } },
    20 => { label: :customer_price, conversion: lambda { |v| v.to_f } },
    21 => { label: :customer_currency, conversion: lambda { |v| v } }
  }
end

def extract_line l, month_token
  line_hash = Hash[
    l.strip
     .split("\t")
     .each_with_index
     .map { |v, i| [token_map[i][:label], token_map[i][:conversion].call(v)] }
  ]

  line_hash[:month] = month_token
  line_hash
end

sales = extract_from "./*_*_*.txt"

exchange_rates = HTTParty.get("http://api.fixer.io/latest?base=USD")["rates"]

less_apples_commission = 0.7

converted = sales
  .sort_by { |s| [s[:vendor_id], s[:currency]] }
  .map do |s|
    exchange_rate = exchange_rates[s[:customer_currency]]
    exchange_rate = 1 if s[:customer_currency] == "USD"
    hash = {
        :app => s[:vendor_id],
        :price => s[:customer_price],
        :currency => s[:customer_currency],
        :quantity => s[:quantity] * s[:sale_or_return],
        :exchange_rate => exchange_rate,
        :share => s[:partner_share]
    }
  end
  .reject { |s| s[:exchange_rate].nil? }
  .map do |s|
    net_usd = s[:share]
    net_usd = net_usd.to_f / s[:exchange_rate].to_f
    net_usd = net_usd * s[:quantity]
    s[:net_usd] = net_usd.round(2)
    s
  end

converted.each { |s| puts s }

puts ""
puts "Here is the net sales. It should be pretty close to the amount Apple wired to you."
puts converted.map { |s| s[:net_usd] }.inject(:+).round(2)


def total_usd_for app, sales
  sales.find_all { |s| s[:app] == app }
    .map { |s| s[:net_usd] }
    .inject(:+)
    .round(2)
end

def total_count_for app, sales
  sales.find_all { |s| s[:app] == app }
    .map { |s| s[:quantity] }
    .inject(:+)
end

def average_for app, sales
  count = total_count_for(app, sales)
  return 0 if count == 0
  (total_usd_for(app, sales) / count.to_f).round(2)
end

puts ""
puts "Here is the breakdown by app."
totals =  Hash[converted.map { |s| s[:app] }
              .uniq
              .map do |app|
                [app, { :total => total_usd_for(app, converted),
                        :count => total_count_for(app, converted),
                        :avg => average_for(app, converted) }]
               end]

pp totals

amirs_share = {
  "BeautifulGo" => 1.0,
  "a-dark-room" => 0.5,
  "theensign" => 1.0,
  "adr-bundle" => 0.75,
  "amirs-app" => 0.75,
  "flatland" => 1
}

puts ""
puts "Here is Amir's share."
amirs_totals = Hash[totals.map { |k, v| [k, v[:total] * amirs_share[k]] }]
pp amirs_totals

puts ""
puts "Here is Michael's share."
amirs_totals = Hash[totals.map { |k, v| [k, v[:total] * (1 - amirs_share[k])] }]
pp amirs_totals
