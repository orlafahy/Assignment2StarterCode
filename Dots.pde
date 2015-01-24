class dot
{
  
  int dotx = 45;
  int doty = 45;
  int dotsize = 5;

/*  void update()
  {
    if(points % 162 == 0)
    {
      //reset players position
      
      //set all dots back to true
      
      //increase velocity variable
    }
  }*/
  
  void show()
  {
    for(int dotx = 45 ; dotx < width - 30 ; dotx+=30)
    {
      for(int doty = 45 ; doty < height - 30; doty+=30)
      {
        fill(255, 255, 0);
        ellipse(dotx, doty, dotsize, dotsize);
      }
    }
  }
}
   /* fill(128,128,0);
  for(int i=0; i<numEggs; i++) 
  {
    if(eggDraw[i])
    {
      ellipse(eggPos[i][0], eggPos[i][1],eggWidth, eggWidth);
    }
  }
  }
}

class dot
{
  color colour;
  boolean highlighted; 
  PVector position;
  int dotx = 45;
  int doty = 45;
  int dotsize = 5;
  
  dot()
  {
     this(0, 0, 0, 0); //constructure chaining 
  }
  
  ellipse(dotx, doty, dotsize, dotsize);
  Square(int x, int y, int size)
  {
    position=new PVector(x, y);
    this.size=size;
  }
  
  void update()
  {
    
  }
  
  void display(boolean highlighted)
  {
    float dim = 0;
    if(highlighted)
    {
      dim = 1;
    }
    else
    {
      dim = 0.5;
    }
    stroke(red(colour)* dim, green(colour)* dim, blue(colour)* dim);
    fill(red(colour)* dim, green(colour)* dim, blue(colour)* dim);
    
    rect(position.x, position.y, halfWidth, halfHeight);
  }
}*/
