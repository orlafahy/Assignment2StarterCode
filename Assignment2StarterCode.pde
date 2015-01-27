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
int points = 1;
float speed = 1.5;

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
  state = 1;
  size(510, 630);
  setUpPlayerControllers();
  ellipseMode(RADIUS);
  pacman = createFont("Pacman.ttf", 60);
  arcade = createFont("ArcadeClassic.ttf", 25);
  
  for(int dotx = 45 ; dotx < width - 30 ; dotx+=30)
  {
    for(int doty = 75 ; doty < height - 30; doty+=30)
    {
      if(dotx == 255 && doty == 465)
      {
        dot.add(new Dots(dotx, doty, 5, false));
      }
      else
      {
        dot.add(new Dots(dotx, doty, 5, true));
      }
    }
  }
  
  //load background image and sounds
  bg = loadImage("Pacmanbg.jpg");
  minim = new Minim(this);
  chomp = minim.loadFile("chomp.wav", 2048);
  death = minim.loadFile("death.wav", 2048);
  beginning = minim.loadFile("beginning.wav", 2048);
  //play start music
  beginning.loop(1/2);
  
}

void draw()
{
  if(state == 1)
  {
    //display splash screen
    splashscreen();
    if(checkKey(players.get(0).start))
    {
      state = 2;
    }
  }
  
  if(state == 2)
  {
    //background image loaded
    image(bg, 0, 0);
  
    //lives and scoreboard displayed
    fill(255);
    text("Points", 10, 22);
    text(points, 100, 22);
    text("Lives", 290, 22);
  
    //display pacman for lives equal to number of lives player 1 has
    fill(255, 255, 0);
    if (lives == 0)
    {
      state = 3;
    }
    int c = 375;
    for(int j = 0 ; j < lives ; j++)
    {
      ellipse(c, 15, 10, 10);
      c += 30;
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
    //display game over screen
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
