let targetColor;
let playerColor;

function setup() {
  createCanvas(800, 400);
  targetColor = new TargetColor();
  playerColor = new PlayerColor(100,100,100);
}

function draw() {
  background(200);
  targetColor.display();
  playerColor.display();
  if (playerColor.matches(targetColor)){
    fill(0)
    noStroke()
    text("Gut gemacht", 50, height-50);
    noLoop();
  }
}


class TargetColor{
  constructor(){
    this.r = int(random(0,255));
    this.g = int(random(0,255));
    this.b = int(random(0,255));
  }
  
  display(){
    fill(this.r, this.g, this.b);
    stroke(0)
    rect(50,50,300,100);
    fill(0);
    noStroke();
    textSize(20);
    text("Zielfarbe", 50, 40);
  }
}

class PlayerColor{
  constructor(r, g, b){
    this.r = r;
    this.g = g;
    this.b = b;
  }
  
  display(){
    fill(this.r, this.g, this.b);
    stroke(0);
    rect(450, 50, 300, 100);
    fill(0);
    noStroke();
    textSize(20);
    text("Deine Farbe", 450, 40)
  }
  
    changeRed(amount){
    this.r = constrain(this.r + amount, 0, 255);
  }
  
    changeGreen(amount){
    this.g = constrain(this.g + amount, 0, 255);
  }
  
    changeBlue(amount){
    this.b = constrain(this.b + amount, 0, 255);
  }
  
matches(target){
return abs(this.r-target.r) < 10 &&
abs(this.g - target.g) <10 &&
abs (this.b - target.b) <10;
}
}

  

  
function keyPressed() {
  if (keyCode === LEFT_ARROW) playerColor.changeRed(-5);
  if (keyCode === RIGHT_ARROW) playerColor.changeRed(5);
  if (keyCode === UP_ARROW) playerColor.changeGreen(5);
  if (keyCode === DOWN_ARROW) playerColor.changeGreen(-5);
  if (key === 'w') playerColor.changeBlue(5);
  if (key === 's') playerColor.changeBlue(-5);
}