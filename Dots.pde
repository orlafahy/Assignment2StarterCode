class Dots
{
  color colour;
  int size;
  boolean show; 
  PVector position;
  
  Dots()
  {
     this(0, 0, 0, false); //constructure chaining 
  }
  
  Dots(int x, int y, int size, boolean show)
  {
    position=new PVector(x, y);
    this.size=size;
    this.show=show;
  }
  
void update()
{
   
    for(int i = 0; i < dot.size(); i++)
    {
      if(dist(players.get(0).pos.x, players.get(0).pos.y, dot.get(i).position.x, dot.get(i).position.y) <= 5 && dot.get(i).show == true) 
      {
        dot.get(i).show = false;
        println(points);
        points = points+1;
        chomp.loop(1/2);
      }
    }

    if(points % 162 == 0)
    {
      //reset players position
      players.get(0).pos.x = 255;
      players.get(0).pos.y = 465;
      
      players.get(1).pos.x = 255;
      players.get(1).pos.y = 165;
      
      //set all dots back to true
      for(int i = 0; i < dot.size(); i++)
      {
        dot.get(i).show = true;
      }
      //increase velocity variable
      speed +=.5;
    }
}
  
void display()
  {
    
    if(show == true)
    {
      fill(255, 255, 0);
    }
    
    if(show == false)
    {
      fill(0);
    }
    
    ellipse(position.x, position.y, size, size);
    
  }
}


