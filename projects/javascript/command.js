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
    default:
      alert("no such command");
      break;
  }
};

$(document).ready(main);