class Player
{
  PVector pos;
  char up;
  char down;
  char left;
  char right;
  char start;
  char button1;
  char button2;
  int index;
  color colour;

  Player()
  {
    pos = new PVector(255, 465);
  }

  Player(int index, char up, char down, char left, char right, char start, char button1, char button2)
  {
    this();
    this.index = index;
    this.up = up;
    this.down = down;
    this.left = left;
    this.right = right;
    this.start = start;
    this.button1 = button1;
    this.button2 = button2;
  }
  
  Player(int index, XML xml)
  {
    this(index
      , buttonNameToKey(xml, "up")
      , buttonNameToKey(xml, "down")
      , buttonNameToKey(xml, "left")
      , buttonNameToKey(xml, "right")
      , buttonNameToKey(xml, "start")
      , buttonNameToKey(xml, "button1")
      , buttonNameToKey(xml, "button2")
      );
   }
   
  void update()
  {
    float velocity1 =1.5;
    float velocity2 =1.5;
    float velocity3 =1.5;
    float velocity4 =1.5;
 
    //check for the colour red under player
     color underPlayer = bg.get((int)pos.x,(int)pos.y-15);
     if(red(underPlayer) >= 250.0 && green(underPlayer) <= .5 && blue(underPlayer) <= .5)
     {
       velocity1=0;
     }

    //check for the colour green under player
    color underPlayer2 = bg.get((int)pos.x,(int)pos.y+15);
    if(red(underPlayer2) <= .5 && green(underPlayer2) >= 250.0 && blue(underPlayer2) <= .5)
    {
      velocity2=0;
    }
        
    //check for the colour cyan under player  
    color underPlayer3 = bg.get((int)pos.x-15,(int)pos.y);
    if(red(underPlayer3) <= .5 && green(underPlayer3) >= 250.0 && blue(underPlayer3) >= 250.0)
    {
      velocity3=0;
    }
    
    //check for the colour white under player
    color underPlayer4 = bg.get((int)pos.x+15,(int)pos.y);
    if(red(underPlayer4) >= 250.0 && green(underPlayer4) >= 250.0 && blue(underPlayer4) >= 250.0)
    {
      velocity4=0;
    }
    
    //transport to other side of the screen at tunnel 
    if(dist(pos.x, pos.y, 0, 315) <= 15 && checkKey(left))
    {
      pos.x=510;
    }
    if(dist(pos.x, pos.y, 510, 315) <= 15 && checkKey(right))
    {
      pos.x=0;
    }



    if (checkKey(up))
    {
      pos.y -= 1*velocity1;
    }
    if (checkKey(down))
    {
      pos.y += 1*velocity2;
    }
    if (checkKey(left))
    {
      pos.x -= 1*velocity3;
    }
    if (checkKey(right))
    {
      pos.x += 1*velocity4;
    }
    if (checkKey(start))
    {
      println("Player " + index + " start");
    }
    if (checkKey(button1))
    {
      println("Player " + index + " button 1");
    }
    if (checkKey(button2))
    {
      println("Player " + index + " butt2");
    }
  }

  void display()
  {
    fill(0);
    // arc(pos.x, pos.y, radius, radius, starts, stop);
    stroke(colour);
    fill(255, 255, 0);
    ellipse(pos.x, pos.y, 15, 15);
  }
}
