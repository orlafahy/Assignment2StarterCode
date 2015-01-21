class dot
{
  int numEggs = 270;
  float[][] eggPos;
  float eggWidth=5;
  boolean[] eggDraw;
  int dotx = 45;
  int doty = 45;
  int dotsize = 5;
  
  void show() 
  {
    eggPos = new float[numEggs][2];

    for(int i=0; i<numEggs; i++) 
    {
      eggPos[i][0] = dotx;
      eggPos[i][1] = doty;
    
      dotx+=30;
    
      if(dotx >= width - 30)
      {
         doty+=30;
         dotx=45;
      }
    }
      eggDraw = new boolean[numEggs];
      for(int i=0; i<numEggs; i++)
      {
          eggDraw[i] = true;
      }
    
    fill(255, 255, 0);
    for(int i=0; i<numEggs; i++) 
    {
      if(eggDraw[i])
      {
        ellipse(eggPos[i][0], eggPos[i][1], eggWidth, eggWidth);
      }
    }
    
  }
}
