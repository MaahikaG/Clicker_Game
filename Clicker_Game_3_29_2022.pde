//Maahika Gupta
//Mode Framework
//2-4
//March 29, 2022

import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;
import ddf.minim.signals.*;
import ddf.minim.spi.*;
import ddf.minim.ugens.*;

// sound variables
Minim minim;
AudioPlayer theme, coin, bump, gameover;

// color pallete
color burgundy = #780000;
color red      = #c1121f;
color cream    = #fdf0d5;
color indigo   = #003049;
color blue     = #669bbc;
//color purple   = #b392ac;
color yellow   = #ffcb77;
color green    = #adc178;
color teal     = #c2dfe3; 

// mode variables
int mode;
final int INTRO = 0;
final int GAME = 1;
final int PAUSE = 2;
final int GAMEOVER = 3;
final int OPTIONS = 4;

//intro variables
int wave;
int surfboard;

// options variables
int chosenlandscape;
float sliderX;

// game variables 
float x, y, d;
float vx, vy;
int score, lives;
int chosenscore;
boolean other_game_area;

//gameoever variables 
int highscore;
int redfire;
int yellowfire;
boolean redfiredown;
boolean yellowfireup;

void setup () {
  size (800, 800);
  mode = INTRO;
  textAlign (CENTER, CENTER);
  
  //initialize intro
  wave = 100;
  surfboard = 300;
  
  //initialize game
  x = width / 2;
  y = height / 2;
  d = 100;
  vx = random (-5, 5);
  vy = random (-5, 5);
  score = 0;
  lives = 3;
  chosenscore = 0;
  other_game_area = false;
  
  //initialize options
  chosenlandscape = 1;
  sliderX = 200;
  
  //initialize gameover; 
  highscore = 0;
  redfire = 500;
  yellowfire = 500;
  redfiredown = false;
  yellowfireup = false;
  
  //initialize minim
  minim = new Minim(this);
  theme = minim.loadFile("mario bros theme.mp3");
  coin = minim.loadFile("coin.wav");
  bump = minim.loadFile("bump.wav");
  gameover = minim.loadFile("gameover.wav");
  
}

void draw () {
  //mode change 
  if (mode == INTRO) {
    intro ();
  } else if (mode == GAME) {
    game ();
  } else if (mode == PAUSE) {
    pause ();
  } else if (mode == GAMEOVER) {
    gameover ();
  } else if (mode == OPTIONS) {
    options ();
  } else {
    println ("Error: Mode = " + mode);
  }
}

void tactileRect (int x, int y, int w, int l) {
  strokeWeight (5);
  if (mouseX >= x && mouseX <= x+w && mouseY >= y && mouseY <= y+l) {
    stroke (255);
  } else {
    stroke (0);
  }
}
