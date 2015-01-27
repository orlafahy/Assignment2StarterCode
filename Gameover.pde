void Gameover()
{ 
  background(0);
  fill(255, 255, 0);
  
  textFont(arcade);
  text("Game Over", width/2-60, height/4);
  text("Your score is", width/2-80, height/4 + 60);
  text(points, 245, height/4 + 90);
  text("Press start to play again!", width/2-150, height/4 + 200);
  
  
  if(checkKey(players.get(0).start))
  {
    newgame();
  }
}
