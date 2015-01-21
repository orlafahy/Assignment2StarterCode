void Map()
{
    
    for(int i = 0 ; i < height ; i+=30)
    {
      stroke(0, 255, 0);
      line(0, i, 510, i);
    }
    for(int i = 0 ; i < width ; i+=30)
    {
      stroke(0, 255, 0);
      line(i, 0, i, 600);
    }
    
    noStroke();
    fill(0, 0, 255);
    rect(0,0,510,30);
    rect(0,0,30,600);
    rect(480,30,510,600);
    rect(0,570,510,600);
   
    //1. squares
    for(int i = 60 ; i < 391 ; i+=90)
    {
      if(i == 240)
      {
        i+=60;
      }
      rect(i, 60, 60, 60);
    }
    
    //2.rect
    rect(240, 30, 30, 90);
    rect(240, 450, 30, 90);
    
    //3.rect
    for(int i = 150 ; i < 451 ; i+=90)
    {
      if(i == 240)
      {
        rect(180, i, 150, 30);
        i+=30;
      }
      rect(180, i, 150, 30);
    }
    
    //if y = 510 
    rect(60, 510, 150, 30);
    rect(300, 510, 150, 30);
    
    //4. rect
    for(int i = 90; i < 480; i+=270)
    {
      rect(i, 180, 60, 120);
      rect(i, 360, 60, 120);
    }
    
    //5. rext
    for(int i = 150; i < 480; i+=30)
    {
      if(i == 270)
      {
        fill(0);
        rect(00, i, 30, 30);
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
