function addFight(name, data) {
  var fights = localStorage.getItem("fights");
  if (fights) {
    fights = fights.split(":");
  } else {
    fights = [];
  }

  if ($.inArray(name, fights) < 0) {
    fights.push(name);
    localStorage.setItem("fights", fights.join(":"));
  }

  localStorage.setItem(name, data.join(":"));

  $("#debug").append("<br>Fights: "+localStorage.getItem("fights").split(":"));
  $.each(fights, function(i, e) {
    $("#debug").append("<br>"+e+": "+localStorage.getItem(e).split(":").join(", "));
  });
};

function getFight(name) {
  [ localStorage.getItem(name+".1").split(":"),
    localStorage.getItem(name+".2").split(":") ]
};