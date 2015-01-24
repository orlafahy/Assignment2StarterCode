class Dots
{
  color colour;
  int size;
  boolean show; 
  PVector position;
  
  Dots()
  {
     this(0, 0, 0); //constructure chaining 
  }
  
  Dots(int x, int y, int size)
  {
    position=new PVector(x, y);
    this.size=size;
  }
  
/*void update()
  {
    if(points % 162 == 0)
    {
      //reset players position
      
      //set all dots back to true
      
      //increase velocity variable
    }
  }*/
  
  void display(boolean show)
  {
    
    if(show)
    {
      fill(255, 255, 0);
    }
    else
    {
      fill(0);
    }
    
    ellipse(position.x, position.y, size, size);
    
  }
}*/
