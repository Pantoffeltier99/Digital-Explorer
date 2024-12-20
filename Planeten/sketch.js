let stars =[];
let numStars = 400;
let planeta;
let planetb;
let planetc;
let komet;

//komet
  let xd = 0
  let yd = 0
  let speedk = 2
  let radk = 20
  
function setup() {
  createCanvas(800, 800);

  for(let i=0; i< numStars; i++){
    stars.push({
      x: random(width),
      y: random(height),
      size: random(1,5)
    })
  }
  
  planeta = {
    distance:  140,
    size:      25,
    angle:     0,
    speed:     0.01,
    color:     color(167, 28, 0)
    
  }
  
  planetb = {
    distance:  180,
    size:      30,
    angle:     0,
    speed:     0.02,
    color:     color(0, 134, 142)
  }
  
  planetc = {
    distance:  250,
    size:      40,
    angle:     0,
    speed:     0.005,
    color:     color(random(100,255), 40, 70)
  }
  
  komet = {
    color:     color(255, 253, 219)
    
    // Der Komet war sehr kompliziert und ich musste ein paar Sachen nachschauen, weil ich nicht genau wusste, wie die if-funktion verwendet wird. Jetz gehts aber. Aus irgendeinem Grund konnte ich die Daten des kometen hier nicht einfügen, sie stehen jetzt ganz oben.
  }
}

function draw(){
    background(0,0,10);
  
  for(let star of stars){
    fill(random(150,255),random(150,255),random(255));
    circle(star.x,star.y,star.size);
  }
  
  let sunx = mouseX;
  let suny = mouseY;
  
  fill(255, 231, 60)
  circle(sunx,suny,80)
  
  let xa = sunx + cos(planeta.angle) * planeta.distance * 1.3;
  let ya = suny + sin(planeta.angle) * planeta.distance;
  
  fill(planeta.color);
  circle(xa,ya,planeta.size);
  
  planeta.angle += planeta.speed;
  
  let xb = sunx + cos(planetb.angle) * planetb.distance * 1.2;
  let yb = suny + sin(planetb.angle) * planetb.distance;
  
  fill(planetb.color);
  circle(xb,yb,planetb.size);
  
  planetb.angle += planetb.speed;
  
  let xc = sunx + cos(planetc.angle) * planetc.distance * 1.1;
  let yc = suny + sin(planetc.angle) * planetc.distance;
  
  fill(planetc.color);
  stroke(255,0,0)
  circle(xc,yc,planetc.size);
  
  planetc.angle += planetc.speed;
  
  fill(komet.color);
  noStroke();
  circle(xd,yd,radk);
  
  xd += speedk;
  yd += speedk;
  
  if (xd + 10 > width || yd + 10 > height) {
    xd = -10;
    yd = -10;
  }
}