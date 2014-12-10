var currentClass = "black";

$(function() {
  changeCurrentTurn();

  $(".liberty").click(function() {
    if($(this).attr("id") == "currentTurn") {
      changeCurrentTurn();
    } else {
      if($(this).hasClass("white")) {
        $(this).removeClass("white", 150);
      } else if ($(this).hasClass("black")) {
        $(this).removeClass("black", 150);
      } else {

        $(this).addClass(currentClass, 150);

        changeCurrentTurn()
      }
    }
  });
});


function changeCurrentTurn() {
  $("#currentTurn").removeClass("white");
  $("#currentTurn").removeClass("black");

  if(currentClass == "white") currentClass = "black";
  else currentClass = "white";

  $("#currentTurn").addClass(currentClass, 150);
}
