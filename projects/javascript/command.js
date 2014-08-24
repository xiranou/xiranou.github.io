var main = function(){
  $("#start").click(function(){
    var texToAppend = commandSelector();
    display(texToAppend);
  });
};

var commandSelector = function(){
  var command = prompt("enter a command.");
  switch (command){
    case 'move':
      return player.moveTo(); //add prompt to function
      break;
    case 'pick up':
      return player.pickUpAll();
      break;
    case 'equip':
      return player.equipAll();
      break;
    case 'attack':
      return player.attackTarget(); //add prompt to function
      break;
    default:
      alert("no such command");
      break;
  }
};

var display = function(texToAppend){
  $("#text-area>p").append(texToAppend);
};

$(document).ready(main);