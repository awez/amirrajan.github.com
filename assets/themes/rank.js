$.getJSON('https://itunes.apple.com/us/rss/toppaidapplications/limit=100/genre=7014/json', function(data) {
  var rpgRank = "> #100 T_T";
  var overrallRank = "> #200 T_T";

  for(var i = 0; i < data.feed.entry.length; i++) {
    console.log(data.feed.entry[i].title.label);
    if(data.feed.entry[i].title.label == "A Dark Room - Amirali Rajan") {
      rpgRank = "#" + (i + 1).toString();
      break;
    }
  }

  $.getJSON('https://itunes.apple.com/us/rss/toppaidapplications/limit=200/genre=6014/json', function(moreData) {
    for(var i = 0; i < moreData.feed.entry.length; i++) {
      console.log(moreData.feed.entry[i].title.label);
      if(moreData.feed.entry[i].title.label == "A Dark Room - Amirali Rajan") {
        overrallRank = "#" + (i + 1).toString();
        break;
      }
    }

    $("#exactrank").html("App Store Ranking<br/> RPGs: " + rpgRank + "<br/>Games Overall: " + overrallRank);
  });
});
