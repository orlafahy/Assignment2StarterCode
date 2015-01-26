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
  color colour = color(255, 255, 0);
  float rotation = 0;
  float antiRotate = 0.1;
  float starts, stop;
  int radius = 15;

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
    
    float velocity1 =speed;
    float velocity2 =speed;
    float velocity3 =speed;
    float velocity4 =speed;
    starts = rotation;
    stop =  (PI*2) - rotation;
 
    //check for the colour red under player
     color undertop1 = bg.get((int)pos.x-12,(int)pos.y-15);
     color undertop2 = bg.get((int)pos.x+12,(int)pos.y-15);
     if(red(undertop1) >= 250.0 && green(undertop1) <= .5 && blue(undertop1) <= .5 || red(undertop2) >= 250.0 && green(undertop2) <= .5 && blue(undertop2) <= .5)
     {
       velocity1=0;
     }

      
    //check for the colour green under player
    color underbottom1 = bg.get((int)pos.x+13,(int)pos.y+15);
    color underbottom2 = bg.get((int)pos.x-13,(int)pos.y+15);
    if(red(underbottom1) <= .5 && green(underbottom1) >= 250.0 && blue(underbottom1) <= .5 || red(underbottom2) <= .5 && green(underbottom2) >= 250.0 && blue(underbottom2) <= .5)
    {
      velocity2=0;
      
    }
        
    //check for the colour cyan under player  
    color underleft1 = bg.get((int)pos.x-12,(int)pos.y+15);
    color underleft2 = bg.get((int)pos.x-12,(int)pos.y-15);
    if(red(underleft1) <= .5 && green(underleft1) >= 250.0 && blue(underleft1) >= 250.0 || red(underleft2) <= .5 && green(underleft2) >= 250.0 && blue(underleft2) >= 250.0)
    {
      velocity3=0;
    }
    
    //check for the colour white under player
    color underright1 = bg.get((int)pos.x+15,(int)pos.y+13);
    color underright2 = bg.get((int)pos.x+15,(int)pos.y-13);
    if(red(underright1) >= 250.0 && green(underright1) >= 250.0 && blue(underright1) >= 250.0 || red(underright2) >= 250.0 && green(underright2) >= 250.0 && blue(underright2) >= 250.0)
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

    //check if player 2 has touched player 1
    if(dist(players.get(0).pos.x, players.get(0).pos.y, players.get(1).pos.x, players.get(1).pos.y) <= 30)
    {
      death.play(1);
      players.get(0).pos.x = 255;
      players.get(0).pos.y = 465;
      players.get(1).pos.x = 255;
      players.get(1).pos.y = 165;
      lives--;
    }

    //moves player and stops them form moving diaginally 
    if (checkKey(up))
    {
      starts = -rotation - 0.95;
      stop =  3*PI/3 + rotation + 0.95;
      pos.y -= 1*velocity1;
      velocity2=0;
      velocity3=0;
      velocity4=0;
    }
    if (checkKey(down))
    {
      starts =  rotation + PI/2;
      stop = PI*2 - rotation + PI/2;
      pos.y += 1*velocity2;
      velocity1=0;
      velocity3=0;
      velocity4=0;
    }
    if (checkKey(left))
    {
      starts =  rotation - PI;
      stop = - rotation + PI;
      pos.x -= 1*velocity3;
      velocity1=0;
      velocity2=0;
      velocity4=0;
    }
    if (checkKey(right))
    {
      starts = rotation;
      stop =  PI*2 - rotation;
      pos.x += 1*velocity4;
      velocity1=0;
      velocity2=0;
      velocity3=0;
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
    if (rotation > 0.55)
    {
      antiRotate = -0.03;
    }
    else if (rotation <= 0)
    {
      antiRotate = 0.03;
    }
    rotation = rotation + antiRotate;
    //fill(0);
    fill(colour);
    arc(pos.x, pos.y, radius, radius, starts, stop);
   // fill(colour);
    //ellipse(pos.x, pos.y, 15, 15);
  }
}
