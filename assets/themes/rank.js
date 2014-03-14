$.getJSON('https://itunes.apple.com/us/rss/toppaidapplications/limit=100/genre=7014/json', function(data) {
  var rank = "< 100 T_T";

  for(var i = 0; i < data.feed.entry.length; i++) {
    console.log(data.feed.entry[i].title.label);
    if(data.feed.entry[i].title.label == "A Dark Room - Amirali Rajan") {
      rank = "#" + (i + 1).toString();
      break;
    }
  }

  $("#exactrank").html("App Store RPG Ranking: " + rank);
});
