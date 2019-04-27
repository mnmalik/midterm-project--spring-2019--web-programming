/* @pjs preload="turtle3.png","trash2.png","ocean2.png","menu2.jpg"; */

PImage trash;
PImage turtle;
PImage ocean;
PImage menu;
boolean menupage = true;
boolean gameplaypage = false;
int cooldown = 0;
Trash trashbag;
Trash2 trashbag2;




int lives = 3;
float x = 250;
float y = 250;
float a = 255;
float b = 255;
float c = 255;
float z = 255;
int score;


void setup(){
	turtle = loadImage("turtle3.png");
 ocean = loadImage("ocean2.png");
 menu = loadImage("menu2.jpg");

trash = loadImage("trash2.png");
 
 
	
 
 size(500,500);
   
 

  noStroke();
  // background(menu);
  //fill(random(0, 255), random(0, 255), random(0, 255));
  //image(turtle,x, y, 50, 50);
  
  trashbag = new Trash();
  trashbag2 = new Trash2();

};


 void draw() {
 if (menupage == true){Menu();}
 if ((gameplaypage==true)&&(lives > 0)){
 
 GamePlay();
 
 }
 if(lives <= 0){
   
   GameOver();
 
 
 }
  
}
;

void GamePlay(){
	// PImage turtle = loadImage("turtle3.png");
	// PImage ocean = loadImage("ocean2.png");

if (z == 255) { 
    z = random(0, 255);
  }; 
  //if ((x % 30 == 0)||(y % 30 == 0)) { 
  //  a = random(0, 255); 
  //  b = random(0, 255); 
  //  c = random(0, 255);
  //  background(a, b, c);
  //} else {
    background(ocean);
  //}
  if (keyPressed) {


    if (key == ' ' ) {
      x = 250;
      y = 250;
    } else if (keyCode == UP) {
      y= y-10;
    } else if (keyCode == DOWN) {
      y=y+10;
    } else if (keyCode == RIGHT) {
      x=x+10;
    } else if (keyCode == LEFT) {
      x=x-10;
    }
  }
  if (dist(mouseX, mouseY, x, y)<25) {
    z = 255; 
    fill(z);
  };
  fill(z);
  if (x > 483) {
    x = x - 15;
  };
  if (x < 7) {
    x = x + 15;
  };
  if (y > 483) {
    y = y - 15;
  };
  if (y< 7) { 
    y = y + 15;
  };

  image(turtle,x, y, 50, 50);
  
  trashbag.getTrash();
  trashbag2.getTrash2();
  fill(255,255,255);
  textSize(32);
  text(lives,110,50);
  text("Lives:",10,50);
  text("Score:",10,100);
  text(score,110,100);


}
void Menu(){
// PImage menu = loadImage("menu2.jpg");
background(menu);
if(keyPressed){

if(key == ENTER){
menupage = false;
gameplaypage = true;
}

}







}
class Trash{
float trashx;
float trashy;
float trashsize;
int trashspeed;

// PImage trash;

Trash(){

trashx = random(0,500);
trashspeed = 1;
trashy = 0;
trashsize = random(50,100);
// trash = loadImage("trash2.png");


}

 void getTrash(){
if (cooldown != 0){
cooldown--;
}
if ((abs(trashx-x)<(trashsize/2)-3)&&(abs(trashy-y)<(trashsize/2)-3)){

if(cooldown == 0){lives= lives - 1 ; cooldown = 100;}

}
if (trashy > 500){
trashy = 0; score++;
if(trashspeed < 12){
trashspeed+=1;}
trashx = random(0,500);

}
else {trashy += trashspeed;}
image(trash, trashx, trashy,trashsize,trashsize);


}


}

class Trash2{
float trashx;
float trashy;
float trashsize;
int trashspeed;
// PImage trash;

Trash2(){

trashx = random(0,500);
trashspeed = 1;
trashy = 0;
trashsize = random(50,100);
// trash = loadImage("trash2.png");


}

 void getTrash2(){
if (cooldown != 0){
cooldown--;
}
if ((abs(trashx-x)< (trashsize/2)-3)&&(abs(trashy-y)< (trashsize/2)-3)){

if(cooldown == 0){lives= lives - 1 ; cooldown = 30;}

}
if (trashx > 500){
trashx = 0;
score++;
if(trashspeed < 12){
trashspeed+=1;}
trashy = random(0,500);
}

else {trashx += trashspeed;}
image(trash, trashx, trashy,trashsize,trashsize);


}


}
 void GameOver(){


background(0,0,0);

 fill(255,0,0);
  textSize(50);
  text("Game Over",100,250);
  fill(255,255,255);
  text(score,230,310);
	 fill(255,0,0);
textSize(14);
text("Real Sea Turtles don't have extra lives.",40,360);
	  fill(255,255,255);
text(" Every year hundreds of thousands of marine creatures die ",40,380);
	 text(" They ingest and become entangled by plastic and other marine debris ",40,400);
	 text(" Help us stop ocean pollution",40,420);
   


}