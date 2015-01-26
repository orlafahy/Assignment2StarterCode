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
    //check for dots collision with player
    for(int i = 0; i < dot.size(); i++)
    {
      if(dist(players.get(0).pos.x, players.get(0).pos.y, dot.get(i).position.x, dot.get(i).position.y) <= 10 && dot.get(i).show == true) 
      {
        //set value to false and increase score by 1
        dot.get(i).show = false;
        points = points+1;
        chomp.loop(1/2);
      }
    }

    //divide score by largest possible dots to collect
    if(points % 162 == 0)
    {
      //reset players positions
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
    //colour true dots yello
    if(show == true)
    {
      fill(255, 255, 0);
    }
    
    //colour false dots black
    if(show == false)
    {
      fill(0);
    }
    
    //draw dots
    ellipse(position.x, position.y, size, size);
    
  }
}


