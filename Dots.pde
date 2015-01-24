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
