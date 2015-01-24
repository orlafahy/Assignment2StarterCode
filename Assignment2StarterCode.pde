/*
  DIT OOP Assignment 2 Starter Code
  =================================
  Loads player properties from an xml file
  See: https://github.com/skooter500/DT228-OOP
*/

ArrayList<Player> players = new ArrayList<Player>();
ArrayList<Dots> dot = new ArrayList<Dots>();
boolean[] keys = new boolean[526];
int[] positionsx = {255, 255}; 
int[] positionsy = {465, 165};

int state;
int lives = 3;
int points = 0;

PImage bg;
PFont pacman;
PFont arcade;
import ddf.minim.*;
Minim minim;
AudioPlayer chomp;
AudioPlayer death;
AudioPlayer beginning;

void setup()
{
  state = 2;
  size(510, 630);
  setUpPlayerControllers();
  ellipseMode(RADIUS);
  pacman = createFont("Pacman.ttf", 60);
  arcade = createFont("ArcadeClassic.ttf", 25);
  
  for(int dotx = 45 ; dotx < width - 30 ; dotx+=30)
  {
    for(int doty = 75 ; doty < height - 30; doty+=30)
    {
      dot.add(new Dots(dotx, doty, 5, true));
    }
  }
  
  bg = loadImage("Pacmanbg.jpg");
  
  minim = new Minim(this);
  chomp = minim.loadFile("chomp.wav", 2048);
  death = minim.loadFile("death.wav", 2048);
  
}

void draw()
{
  if(state == 1)
  {
    splashscreen();
  }
  if(state == 2)
  {
    image(bg, 0, 0);
  
    fill(255);
    text("Points:", 10, 20);
    text(points, 70, 20);
    text("Lives:", 315, 20);
  
    fill(255, 255, 0);
    if (lives == 0)
    {
      state = 3;
    }
    if (lives == 1)
    {
      ellipse(375, 15, 10, 10);
    }
    if(lives == 2)
    {
      ellipse(375, 15, 10, 10);
      ellipse(405, 15, 10, 10);
    }
    if(lives == 3)
    {
      ellipse(375, 15, 10, 10);
      ellipse(405, 15, 10, 10);
      ellipse(435, 15, 10, 10);
    }
  
   for(int j = 0; j < 90; j+=30)
   {
     fill(0);
     triangle(375+j, 15, 390+j, 10, 390+j, 20);
   } 
   
   for(int i = 0; i < dot.size(); i++)
  {
    dot.get(i).update();
    dot.get(i).display();
   }
    Map();

    for(Player player:players)
    {
      player.update();
      player.display();
    }
  }
     
      
  if(state == 3)
  {
    Gameover();
  }
}

void keyPressed()
{
  keys[keyCode] = true;
}

void keyReleased()
{
  keys[keyCode] = false;
}

boolean checkKey(char theKey)
{
  return keys[Character.toUpperCase(theKey)];
}

char buttonNameToKey(XML xml, String buttonName)
{
  String value = xml.getChild(buttonName).getContent();
  if ("LEFT".equalsIgnoreCase(value))
  {
    return LEFT;
  }
  if ("RIGHT".equalsIgnoreCase(value))
  {
    return RIGHT;
  }
  if ("UP".equalsIgnoreCase(value))
  {
    return UP;
  }
  if ("DOWN".equalsIgnoreCase(value))
  {
    return DOWN;
  }
    //.. Others to follow
    return value.charAt(0);
}

void setUpPlayerControllers()
{
  XML xml = loadXML("arcade.xml");
  XML[] children = xml.getChildren("player");
  int gap = width / (children.length + 1);
  
  for(int i = 0 ; i < children.length ; i ++)
  {
    XML playerXML = children[i];
    Player p = new Player(i, playerXML);
    int x = (i + 1) * gap;
    p.pos.x = positionsx[i];
    p.pos.y = positionsy[i];
    players.add(p);
  }
}
