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
  boolean show; 
  PVector position;
  int x = 45;
  int y = 45;
  int size = 5;
  
  dot()
  {
     this(0, 0, 0, 0); //constructure chaining 
  }
  
  dot(int x, int y, int size)
  {
    position=new PVector(x, y);
    this.size=size;
  }
  
  void update()
  {
    
  }
  
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
    
    ellipse(x, y, size, size);
    
  }
}*/
