void splashscreen()
{ 
  background(0);
  textFont(pacman);
  fill(0, 0, 255);
  text("PacMan", 90+1, height/4+2);
  fill(255, 0, 0);
  text("PacMan", 90+3, height/4+4);
  fill(255, 255, 0);
  text("PacMan", 90, height/4);
  textFont(arcade);
  text("Press to start", 170, height/2+150);
  
  fill(255, 255, 0);
  ellipse(150, height/2, 50, 50);
  ellipse(250, height/2, 10, 10);
  ellipse(300, height/2, 10, 10);
  ellipse(350, height/2, 10, 10);
 
  fill(0);
  triangle(150, height/2, 200, height/2+40, 200, height/2-40);
  
  
  if(key == ' ')
  {
    state = 2;
  }
  
  
}
