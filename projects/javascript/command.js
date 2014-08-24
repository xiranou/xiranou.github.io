var main = function(){
  $("#start").click(function(){
    commandSelector();
  });
};

var commandSelector = function(){
  var command = prompt("enter a command.");
  switch (command){
    case 'move':
      player.moveTo(); //add prompt to function
      break;
    case 'pick up':
      play.pickUpAll();
      break;
    case 'equip':
      player.equipAll();
      break;
    case 'attack':
      player.attackTarget(); //add prompt to function
      break;
    default:
      alert("no such command");
      break;
  }
};

var display = function(param1, param2){
  block;
};

$(document).ready(main);