class Bounds {
  
  PVector position; 
  PVector size; 
  
  Bounds(float x, float y, float sizeW, float sizeH){
    this.position = new PVector(x, y); 
    this.size = new PVector(sizeW, sizeH);  
  }
  
  float getX(){
    return this.position.x; 
  }
  
  float getY(){
    return this.position.y; 
  }
  
  float getWidth(){
    return this.size.x; 
  }
  
  float getHeight(){
    return this.size.y; 
  }
}
