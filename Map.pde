void Map()
{
    noStroke();
    fill(0, 0, 255);
    rect(0,30,510,30);
    rect(0,30,30,600);
    rect(480,30,510,630);
    rect(0,600,510,630);
   
    //draw first set of squares 
    for(int i = 60 ; i < 391 ; i+=90)
    {
      if(i == 240)
      {
        i+=60;
      }
      rect(i, 90, 60, 60);
    }
    
    //draw first set of rectangles 
    rect(240, 60, 30, 90);
    rect(240, 480, 30, 90);
    
    //draw second set of rectangles 
    for(int i = 180 ; i < 481 ; i+=90)
    {
      if(i == 270)
      {
        rect(180, i, 150, 30);
        i+=30;
      }
      rect(180, i, 150, 30);
    }
    
    //if y = 510 
    rect(60, 540, 150, 30);
    rect(300, 540, 150, 30);
    
    //draw third set of rectangles
    for(int i = 90; i < 480; i+=270)
    {
      rect(i, 210, 60, 120);
      rect(i, 390, 60, 120);
    }
    
    //draw forth set of rectangles
    for(int i = 180; i < 510; i+=30)
    {
      if(i == 300)
      {
        fill(0);
        rect(0, i, 30, 30);
        rect(480, i, 30, 30);
      }
      else
      {
        fill(0, 0, 255);
        rect(30, i, 30, 30);
        rect(450, i, 30, 30);
      }
    }
}
