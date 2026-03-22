  var img;
  var flowerXPos = [];
  var flowerYPos = [];
  var flower = "🌺";
  var flowerTotal = 450;

  var ladybugXPos = [];
  var ladybugYPos = [];
  var ladybug = "🐞";
  var ladybugTotal = 5;
  var ladybugFound = 0;

  //load the background
  setup = function() {
    size(600, 450); 

    img = loadImage("grass.jpg"); 
    reset();
  }

  draw = function(){   

    if(keyPressed){
      if(key == 'r'){
        reset();
      }
    }

    display();
  }


  mouseClicked = function(){
    check(mouseX, mouseY);
  }

  //check if ladybug is clicked
  var check = function(xClick, yClick){
    for(var i = 0; i < ladybugXPos.length; i++){
      if(dist(xClick - 5, yClick - 5, ladybugXPos[i], ladybugYPos[i])<15){
        ladybugXPos.splice(i, 1);
        ladybugYPos.splice(i, 1);
        ladybugFound++;
      }
    }
  }

  var display = function(){
    image(img, 0, 0, 600, 400);


    textSize(20);

    for(var i = 0; i < flowerXPos.length; i ++){
      text(flower, flowerXPos[i], flowerYPos[i]);
    }

    for(var i = 0; i < ladybugXPos.length; i ++){
      text(ladybug, ladybugXPos[i], ladybugYPos[i]);
    }

    fill(0,0,0);
    rect(0,400,600,50);
    fill(255,255,255);
    text("Find The " + ladybug + "s   |   " + ladybug + " " + ladybugFound + "/" + ladybugTotal, 10, 425);

    if(ladybugFound == ladybugTotal){
      fill(0, 0, 0);
      textSize(30);
      text("You found all the ladybugs! \nPress 'r' to restart", 100, 200);
    }
  }

  //reset game
  var reset = function(){
    flowerXPos = [];
    flowerYPos = [];
    ladybugXPos = [];
    ladybugYPos = [];
    ladybugFound = 0;


    var i = 0; 
    while(i < flowerTotal){
      flowerXPos.push(random(0,600));
      flowerYPos.push(random(0,400));
      i++;
    }

    for(var i = 0; i < ladybugTotal; i++){
      ladybugXPos.push(random(20,570));
      ladybugYPos.push(random(20,370));
    }
  }