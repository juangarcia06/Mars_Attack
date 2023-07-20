import processing.sound.*;
SoundFile laserfire; SoundFile track1; SoundFile track2;
PImage player; PImage player1; PImage player2; PImage enemy; PImage background; PImage name; PImage paused; PImage gameover; PImage boss; PImage shop; PImage shop1; PImage shop2; PImage arrow;

//general:
int i;
float speed = 1;     //general speed of game
float entitySize;
float entityHitboxSize;
//GUI:
int status = 1;    //0=inGame 1=startingScreen 2=gameoverScreen 3=pause 4=shop
boolean pause = false;
boolean spacePressed = false;
boolean ePressed = false;
int coins = 0;
int shopSelection = 0;
int arrowX = width/5*2;
boolean rightMousePressed = false;
int aliencount = 2;
int time = 0;
int IGT = 0;
00
//movement:
float y;          //y value of player
float d = 0;                //movement speed
boolean wall = true;     //movement barrier
boolean wallup = true;  //movement barrier
float playerx = 150;     //x value of player

//skins
int skin = 0;
int skin_state = 0;
boolean s1u = false;
boolean s2u = false;

//laser:
float ly;
float lx = 160;
boolean shot;
float laserspeed = width/50*11;

//alien:
float[] alienx = new float [100];
float[] alieny = new float [100];
boolean[] alienreset = new boolean [100];
boolean alive = true;

//alienBOSS:
float alienx3 = width*6;
float alieny3 = 300;
boolean alienreset3 = false;
int bosslifes = 0;

void setup() {
  for (int i =0; i <=aliencount; i++)
  {
    alienx[i] = width*2;
    alieny[i] = int(random(80, 320));
    alienreset[i] = false;
  }
//  size (1920, 1080, P3D); //custom resolution
  fullScreen (P3D);
  player = loadImage("player.png");
  player1 = loadImage("player1.png");
  player2 = loadImage("player2.png");
  shop1 = loadImage("skin_unlock.png");
  shop2 = loadImage("laser_speed_add.png");
  gameover = loadImage("gameover.png");
  background = loadImage("background.png");
  enemy = loadImage("enemy.png");
  name = loadImage("name.png");
  paused = loadImage("pause.png");
  boss = loadImage("boss.png");
  shop = loadImage ("shop.png");
  arrow = loadImage ("arrow.png");
  laserfire = new SoundFile(this, "laserfire.mp3");
  track1 = new SoundFile(this, "track1.mp3");
  track2 = new SoundFile(this, "track2.mp3");
  frameRate (60);
  noStroke();
  alienreset3 = true;
  y = height/2;
}
void draw() {
  background(0); //resets image with blue background
  wall = true;
  wallup = true;
  textSize(30);
  entitySize = width/25*2;
  entityHitboxSize = width/25*2;
  //background
  image(background, 0, 0, width, height);
  fill (#D19628);  //mars
  rect (0, height/5*4+5, width, height);    //mars

  Laser();
  Movement();
  //skin selection
  if (skin_state == 0){
  image(player, 150, y, width/25*2, width/25*2);
  }
  if (s1u == false && skin_state == 1){
    image (player, 150, y, width/25*2, width/25*2);
  }
  if (s2u == false && skin_state == 2){
    image (player, 150, y, width/25*2, width/25*2);
  }
  if (s1u == true && skin_state == 1){
    image (player1, 150, y, width/25*2, width/25*2);
  }
  if (s2u == true && skin_state == 2){
    image (player2, 150, y, width/25*2, width/25*2);
  }
  
  Enemy();
  EnemyBoss();
  GUI();
  timeInGame();
  //music
 if (status == 1 && !track1.isPlaying()) {
    track2.stop();
    track1.play();
  }
  if (status == 0 && !track2.isPlaying()) {
    track1.stop();
    track2.play();
  }
  
  
}
void keyPressed () {
  if ((key == ' ')) {
    spacePressed = true;
  }
  if ((key == 'e')) {
    ePressed = true;
  }
}

void mousePressed () {
  if (mousePressed && (mouseButton == RIGHT)){
    rightMousePressed = true;
  }
}
