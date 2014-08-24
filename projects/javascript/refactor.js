//constructor function
var locationCreator = function(name, description){
  this.name = name;
  this.description = description;
  this.items = [];
  this.enemies = [];
  locationList.push(this);
};
var playerCreator = function(name, description){
  this.name=name;
  this.description=description;
  this.health=150;
  this.items=[];
  this.spells=[];
  this.currentLocation=tinyCave;
  this.attack=0;
  this.blockCharge=0;
};
var itemCreator = function(name, description, type, stat, location){
  this.name = name;
  this.description = description;
  this.type = type;
  switch (this.type){
    case 'weapon':
      this.attack = stat;
      break;
    case 'shield':
      this.blockCharge = stat;
      break;
    default:
      return('error type');
      break;
  }
  location.items.push(this);
};
var spellBookCreator = function(name, description, spellName, spellCharge, spellDamage, location){
  this.name = name;
  this.description = description;
  this.spellName = spellName;
  this.spellCharge = spellCharge;
  this.spellDamage = spellDamage;
  this.type = 'spellbook';
  location.items.push(this);
};
var badGuyCreator = function(name, description, health, attack, type, location){
  this.name = name;
  this.description = description;
  this.health = health;
  this.attack = attack;
  this.type = type;
  location.enemies.push(this);
  enemiesAtLarge.push(this);
};

//creation
var locationList = [];
var enemiesAtLarge = [];
var player = new playerCreator("Red Knight", 'Tall, kinda handsome with wavy blond hair, sort of arrogant and simpleminded. Wears heavy armor painted in red.');

var tinyCave = new locationCreator("Tiny Cave", "Tiny Cave, wet, and full of tiny spiders. Entry point of a larger cave.");
var treasureRoom = new locationCreator("Treasure Room","A big chest sits in the middle of the room");
var secretLibrary = new locationCreator("Secret Library", "A well-lit library...in a cave...");
var bossRoom = new locationCreator("Boss Room", "Welcome! This is the BOSS ROOM! It's big and has a boss in it!");

var bigBadSword = new itemCreator("Big Bad Sword","Heavy. Not well crafted but sharp enough to kill a man.", 'weapon', 15, treasureRoom);
var horribleRedShield = new itemCreator("Horrible Red Shield","Painted in red with a sigil of a boar. Sturdy, but ugly looking round metal shield.", 'shield', 5, treasureRoom);
var uglyRedBook = new spellBookCreator("Ugly Red Book", 'An ugly looking red book, with some gibberish in it.', "Red Fireball", 1, 10, secretLibrary);

var darkPriest = new badGuyCreator("Dark Priest", "Dark Priest of Total Darkness.", 25, 1000, 'boss', bossRoom);
var goblin1 = new badGuyCreator("Goblin", "Green, tiny, annoying", 1, 5, 'minon', secretLibrary);
var goblin2 = new badGuyCreator("Goblin", "Green, tiny, annoying", 1, 5, 'minon', secretLibrary);

//action functions
var encounter = function(location){
  var currentEmemies = location.enemies;
  if (currentEmemies.length>0) {
    for (idx in currentEmemies){
      return('You encounter '+currentEmemies[idx].name+".");
    }
  }
  else {
    return('No enemies here.');
  }
};
var find = function(location){
  var currentItems = location.items;
  if (currentItems.length>0) {
    for (idx in currentItems){
      return('There is a '+currentItems[idx].name+' in this room.');
    }
  }
  else{return('Nothing left in this room.');}
};
var locationMatcher = function(locationPrompt){
  locationPrompt = locationPrompt.toLowerCase();
  switch (locationPrompt){
    case 'tiny cave':
      return(tinyCave);
      break;
    case 'treasure room':
      return(treasureRoom);
      break;
    case 'secret library':
      return(secretLibrary);
      break;
    case 'boss room':
      return(bossRoom);
      break;
    default:
      alert('No such location.');
      break;
  }
};
player.moveTo = function(){
  var locationPrompt = prompt("Enter location.");
  var selection = locationMatcher(locationPrompt);
  this.currentLocation = selection;
  var encountered = encounter(selection);
  var found = find(selection);
  return('You move to '+selection.name+'\n'+encountered+'\n'+found);
};
player.pickUpAll = function(){
  var itemsInLocation = this.currentLocation.items;
  if (itemsInLocation.length>0) {
    for (idx in itemsInLocation){
      this.items.push(itemsInLocation[idx]);
      return('You pick up '+itemsInLocation[idx].name);}
      this.currentLocation.items.splice(idx, 1);
  } else{return('There\'s nothing to pick up.');}
  this.currentLocation.items = [];
};
player.equipAll = function(){
  var itemsGained = this.items;
  for (idx in itemsGained){
    var item = itemsGained[idx];
    switch (item.type){
      case 'weapon':
      this.attack = item.attack;
      break;
      case 'shield':
      this.blockCharge = item.blockCharge;
      break;
      case 'spellbook':
      this.spells.push(item);
      break;
      default:
      return('You have nothing to equip.');
      break;
    }
  }
};
player.attackTarget = function(enemy,selectAttack){
  var enemiesInSight = this.currentLocation.enemies;
  if (enemiesInSight.indexOf(enemy)>=0) {
    if (isNaN(selectAttack)) {weaponSwing(enemy);} else{spellCast(enemy, selectAttack);}
  }
  else{return('No enemies here.');}
  enemyStatus(enemy, this.currentLocation);
  turnSwitch(enemiesInSight);
  levelCheck();
};
var enemyStatus = function(enemyObject,location){
  var eIdx = location.enemies.indexOf(enemyObject);
  if (enemyObject.health <= 0) {
    if (enemyObject.type === 'boss') {return("You slain the boss!");}
    else{return('You defeted '+enemyObject.name);}
    location.enemies.splice(eIdx,1);
    enemiesAtLarge.splice(eIdx,1);
  } else{return('It still lives with '+enemyObject.health+' health left.');}
};
var turnSwitch = function(enemiesInSight){
  if (enemiesInSight.length>0) {
    return('There are enemies still living:\n');
    for (idx in enemiesInSight){
      return(enemiesInSight[idx].name+'\n');
      enemyAttack(enemiesInSight[idx]);
    }
  } else{return('This room is clear.');}
};
var enemyAttack = function(enemyObject){
  var currentDamage = enemyObject.attack;
  var currentBlock = player.blockCharge;
  return(enemyObject.name+" start to attack you!");
  if (currentBlock === 0) {
    player.health -= currentDamage;
    return('You are hit for '+currentDamage+' damage!');}
  else if (currentDamage <= currentBlock) {
    currentBlock -= 1;
    return('You block the attack!');}
  else{
    currentBlock = 0;
    return('You block the attack, but it breaks your shield!');}
  player.blockCharge = currentBlock;
  player.status();
};
player.status = function(){
  if (player.health <= 0) {
    return('You died!');
  }
};
var weaponSwing = function(enemy){
  enemy.health -= player.attack;
  return("You attacked "+enemy.name+" for "+player.attack+" damage.");
};
var spellCast = function(enemy, spellIdx){
  var selectedSpell = player.spells[spellIdx];
  var currentSpellCharge = selectedSpell.spellCharge;
  if (isNaN(selectedSpell)&&currentSpellCharge>0) {
    enemy.health -= selectedSpell.spellDamage;
    currentSpellCharge -= 1;
    return('You casted '+selectedSpell.spellName+" for "+selectedSpell.spellDamage+" damage.");
  } else{return("You don't know that spell!");}
  player.spells[spellIdx].spellCharge = currentSpellCharge;
};
var levelCheck = function(){
  if (enemiesAtLarge.length==0) {return('You complete this level!');}
};

// //script run
// player.moveTo(treasureRoom);
// player.pickUpAll();
// player.equipAll();
// player.equipAll();
// player.moveTo(secretLibrary);
// player.attackTarget(goblin1);
// player.attackTarget(goblin2);
// player.pickUpAll();
// player.equipAll();
// player.moveTo(bossRoom);
// player.attackTarget(darkPriest, 0);
// player.attackTarget(darkPriest);