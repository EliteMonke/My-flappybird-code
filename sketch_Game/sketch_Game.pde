int px1 = 1000;
float py1 = 50;
int px2 = 1500;
float py2 = 500;
int px3 = 2000;
float py3 = 300;
int shp = 2;
boolean cheat = false;

float psy1 = 400;
float g = 0.24;
float sh = 0;
int jumpSpeed = 0;
int teller1 = 0;
int teller2 = 0;
int pe = 1;
boolean pe1 = false;
boolean pe2 = false;
boolean pe3 = false;
int psx1 = 1600;
int score = 0;
int highscore = 0;
boolean levend =  true;
PImage bird;
PImage bowser;
int xb = 1600;
int sxb = 0;
int yb = 550;
int wt = 0;
PImage fireball;
int xf = 660;
int yf = 530;
int sxf = 0;
int syf = 0;
int bt = 0;
int bm = 60;
boolean fb = true;
boolean fs = true;
boolean started = false;
boolean endgame = false;
import processing.sound.*;
SoundFile Pling;
SoundFile Bowser;
boolean BowserP = false;






void setup() {
  size(800, 800);
  bird=loadImage("bird.png");
  bowser=loadImage("bowser.png");
  fireball=loadImage("fire-ball.png");
  imageMode(CENTER);
  Pling = new SoundFile(this, "ding.mp3");
  Bowser = new SoundFile(this, "Bowser.mp3");
}


void draw() {
  if(started == false){
    background(#08CFFF);
    fill(0);
    textAlign(CENTER,CENTER);
    textSize(40);
    text("Welcome",400,300);
    text("Choose A Difficulty",400,400);
    fill(#0092C9);
    rectMode(CENTER);
    strokeWeight(1);
    rect(400,510,170,66);
    rect(200,510,150,66);
    rect(600,510,150,66);
    rect(750,30,76,30);
    textSize(40);
    fill(0);
    text("Medium",400,500);
    fill(#27FA0D);
    text("Eazy",200,500);
    fill(255,0,0);
    text("Hard",600,500);
    textSize(15);
    text("Admin",750,25);
    if(mousePressed && mouseX > 325 && mouseX < 475 && mouseY > 477 && mouseY < 543){
      started = true;
      jumpSpeed = 7;
    }
    if(mousePressed && mouseX > 125 && mouseX < 275 && mouseY > 477 && mouseY < 543){
      started = true;
      jumpSpeed = 5;
    }
    if(mousePressed && mouseX > 525 && mouseX < 675 && mouseY > 477 && mouseY < 543){
      started = true;
      jumpSpeed = 10;
    }
    if(mousePressed && mouseX > 712 && mouseX < 788 && mouseY > 15 && mouseY < 45){
      pe = 1000;
      jumpSpeed = 5;
      started = true;
    }
  }
  if(started == true){
  background(#08CFFF);
  if (levend ==  true) {
    rectMode(CENTER);
    fill(255);
    image(bird, 200, psy1, 100, 100);
    sh += g;
    psy1 +=sh;
    teller1 +=1;
    if(px1 <= 200 && pe1 == false){
      score +=pe;
      pe1 = true;
      Pling.play();
    }
    if(px2 <= 200 && pe2 == false){
      score +=pe;
      pe2 = true;
      Pling.play();
    }
    if(px3 <= 200 && pe3 == false){
      score +=pe;
      pe3 = true;
      Pling.play();
    }
    textSize(40);
    textAlign(CENTER, CENTER);
    if(score > highscore){
      highscore = score;
    }
    if (psy1 > 800) {
      levend = false;
    }
  }
  strokeWeight(0);
  rectMode(CORNER);
  fill(0, 255, 0);
  rect(px1, 0, 150, py1);
  rect(px1, py1+250, 150, 1000);
  rect(px1, -10000, 150, 10000);
  px1 -=shp;
  rect(px2, 0, 150, py2);
  rect(px2, py2+250, 150, 1000);
  rect(px2, -10000, 150, 10000);
  px2 -=shp;
  rect(px3, 0, 150, py3);
  rect(px3, py3+250, 150, 1900);
  rect(px3, -10000, 150, 10000);
  px3 -=shp;
  if(bm > 0){
    fill(255,255,255);
    text("Score: "+score, 150, 50);
    text("HighScore: "+highscore,500,50);
  }
  if(cheat == false){
  if (get(160, (int)psy1-40)==color(0, 255, 0)) {
    levend = false;
  }
  if (get(160, (int)psy1+40)==color(0, 255, 0)) {
    levend = false;
  }
  if (get(240, (int)psy1-40)==color(0, 255, 0)) {
    levend = false;
  }
  if (get(240, (int)psy1+40)==color(0, 255, 0)) {
    levend = false;
  }
  }
  if(endgame == false){
  if (px1 < -500) {
    px1 = 1000;
    py1 = random(50, 500);
    pe1 = false;
  }
  if (px2 < -500) {
    px2 = 1000;
    py2 = random(50, 500);
    pe2 = false;
  }
  if (px3 < -500) {
    px3 = 1000;
    py3 = random(50, 500);
    pe3 = false;
  }
  }
}
if(score < 999){
  endgame = false;
}
if(score > 999){
  endgame = true;
}
if(endgame == true && px3 < 200){
  image(bowser,xb,yb,300,500);
  xb+=sxb;
  if(BowserP == false){
  Bowser.jump(0.0);
  Bowser.play();
  BowserP = true;
   }
  if(psy1 < 0){
    levend = false;
  }
  if(bm > 0){
    sxb = -2;
  }
  bt +=1;
  textAlign(CENTER,CENTER);
  text("Time Left: "+bm,500,50);
  if(bt == 60 && bm > 0){
    bm -=1;
    bt = 0;
  }
  if(dist(200,psy1,xf,yf) < 70){
    levend = false;
    Bowser.stop();
  }
  if(bm == 0){
    fill(0,255,0);
    textAlign(CENTER,CENTER);
    textSize(70);
    text("Winner",400,400);
    Bowser.stop();
    sxb = 2;
    g = 0;
    sh = 0;
    xb = 675;
  }
  if(xb == 676){
    sxb=0;
    wt +=1;
  }
  if(wt >= 180 && bm > 0){
    image(fireball,xf,yf,100,100);
    xf +=sxf;
    yf +=syf;
    if(fs == true){
      xf = 660;
      yf = 530;
      fs = false;
    }
    if(jumpSpeed == 5 && fb == true){
      sxf =-2;
      syf =2;
      fb = false;
    }
    if(jumpSpeed == 7 && fb == true){
      sxf =-4;
      syf =4;
      fb = false;
    }
    if(jumpSpeed == 10 && fb == true){
      sxf =-6;
      syf =6;
      fb =  false;
    }
    if(yf >=725){
      syf *=-1;
    }
    if(yf <= 75){
      syf *=-1;
    }
  }
    if(xf <= -100){
      wt=0;
      xf = 10000;
      fs = true;
    }
}
if (levend == false) {
    px1 = 1000;
    px2 = 1500;
    px3 = 2000;
    sh = 0;
    pe1 = false;
    pe2 = false;
    pe3 = false;
    Bowser.pause();
    score =0;
    fill(255);
    rectMode(CENTER);
    strokeWeight(1);
    rect(400, 455, 200, 50);
    fill(255, 0, 0);
    textSize(60);
    textAlign(CENTER, CENTER);
    text("Game Over", 400, 350);
    fill(0);
    textSize(40);
    text("Try Again", 400, 450);
    if (mousePressed && mouseX > 300 && mouseX < 500 && mouseY > 430 && mouseY < 480) {
      levend = true;
      psy1 = 400;
      sh = 0;
      teller1 = 0;
      BowserP = false;
    }
  }
}


void keyPressed() {
  if (key == ' ') {
    sh =-jumpSpeed;
  }
  if(keyCode == SHIFT && shp < 11){
    shp +=1;
  }
  if(keyCode == CONTROL && shp > 2){
    shp -=1;
  }
  if(key == '+'){
    cheat = true;
  }
  if(key == '-'){
    cheat = false;
  }
}
