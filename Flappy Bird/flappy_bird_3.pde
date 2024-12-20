import java.util.ArrayList;

Bird bird;
ArrayList<PipeSet> pipes = new ArrayList();

PImage groundImage;
PImage backgroundImage;

int lastSpawn = 0;
int lastScoreUpdate = 1750;
int interval = 2000;

float groundPos = 0;
int score = 0;
int highscore = 0;
int level = 1;

boolean hasStarted = false;

void setup() {
  size(500, 800);

  textAlign(CENTER, CENTER);
  textSize(32);

  groundImage = loadImage("ground.jpg");
  setupGame();
}

void setupGame() {
  bird = new Bird("bird.png");
  pipes.clear();

  lastSpawn = millis();
  lastScoreUpdate = millis() + 1750;
  interval = 2000;
  level = 1;

  groundPos = 0;
  score = 0;

  hasStarted = false;
}

void draw() {
  background(200, 200, 238);
  
  // noch nicht gestartet -> Text anzeigen, Spiel stoppen
  if(!hasStarted) {
    image(groundImage, 0, height - 50, 1000, 50);
    bird.draw();
    textSize(50);
    fill(255,0,0);
    text("Press space to play!", 0, 100);
    
    return;
  }

  if (bird.isAlive()) {
    if (millis() - interval > lastSpawn) {
      lastSpawn = millis();
    }
    
    if (millis() - interval > lastScoreUpdate) {
      lastScoreUpdate = millis();
      score++;
      
      if(score >= 0 && score < 5) {
        level = 1;
        interval = 2500;
        pipes.add(new PipeSet(250));
      }
      if(score >= 5 && score < 10) {
        level = 2;
        interval = 2000;
        bird.setJumpForce(-6);
        pipes.add(new PipeSet(200));
      }
        if(score >= 10 && score < 20) {
        level = 3;
        interval = 2000;
        bird.setJumpForce(-6);
        pipes.add(new PipeSet(180));
      }
        if(score >= 20 && score < 30) {
        level = 4;
        interval = 1500;
        bird.setJumpForce(-8);
        pipes.add(new PipeSet(200));
      }
    }
    }
  
  for (int i = pipes.size()-1; i >= 0; i--) {
    PipeSet pipeSet = pipes.get(i);
    
    if (isColliding(bird.getBounds(), pipeSet.getTopBounds()) || isColliding(bird.getBounds(), pipeSet.getBottomBounds())) {
      bird.die(); 
    }
    if (bird.isAlive()) {
      pipeSet.update();
    }
    if(!pipeSet.isVisible()) {
      pipes.remove(pipeSet);
    }
     pipeSet.draw();
  }
  
  textSize(32);
  if (bird.isAlive()) {
    text("Score: " + score, width/2, 30);
    text("Level: " + level, width/2, 60);
  }
  
  bird.update();
  bird.draw();
}

void keyPressed() {
  if (keyCode == 32) {
    // Start if space bar is pressed and the game hasn't stared yet
    if (!hasStarted) {
      hasStarted = true;
    }

    if (hasStarted && bird.isAlive()) {
      bird.jump();
    }

    // Restart if space is pressed and the bird is dead
    if (!bird.isAlive()) {
      setupGame();
    }
  }
}

boolean isColliding(Bounds obj1, Bounds obj2) {
  return obj1.getX() < obj2.getX() + obj2.getWidth() &&
         obj1.getX() + obj1.getWidth() > obj2.getX() &&
         obj1.getY() < obj2.getY() + obj2.getHeight() &&
         obj1.getY() + obj1.getHeight() > obj2.getY();
}
