class PipeSet {
    PImage topPipeImage, bottomPipeImage;
    PVector position;
    
    float imageWidth = 60;
    float imageHeight = 500;
    
    float space, spacePos;
    
    float topPipePosition, bottomPipePosition;
    
    PipeSet(float space) {
      this.space = space;
      this.spacePos = random(400) - 200;
      
      topPipeImage = loadImage("pipeTop.png");
      bottomPipeImage = loadImage("pipeBottom.png");
      
      position = new PVector(width, height/2);
      
      topPipePosition = position.y - imageHeight + spacePos - space/2;
      bottomPipePosition = position.y + spacePos + space/2;
    }
    
    void draw() {
      image(topPipeImage, position.x, topPipePosition, imageWidth, imageHeight); 
      image(bottomPipeImage, position.x, bottomPipePosition, imageWidth, imageHeight); 
    }
    
    void update() {
       position.x -= 3;
    }
    
    Bounds getTopBounds() {
      return new Bounds(position.x, topPipePosition, imageWidth, imageHeight); 
    }
    
    Bounds getBottomBounds() {
      return new Bounds(position.x, bottomPipePosition, imageWidth, imageHeight); 
    }
    
    boolean isVisible() {
      return position.x > -imageWidth;
    }
}
