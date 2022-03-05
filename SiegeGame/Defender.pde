class Defender { 
  int x, y, speedX; // position amd speed of the defender
  boolean moving; 
  PImage defender; // defender image
  
  Defender (int x,int y){ //defenders constructor
  Crash1 = new Crash(x,y); // crash is defined
  defender = loadImage("defender.png"); // defender image loaded
  defender.resize(50, 75);
  this.x = x;
  this.y = y;
  speedX = 0;
  moving = false;
  }
  
void render(){ // renders and checks for crash/collision.
Crash1.CrashCheck(); // checks for crash here
fill(217, 35, 83);
image(defender, x, y);
if(left){
  moving = true;
  speedX = -7;}
if(right){
  moving = true;
  speedX =7;}
if (!left&&!right) {
  speedX=0;} 
else if (left&&right) {
  speedX=0;}   
if (x < 0){ // restricting out of bounds left side.
  speedX = 0;
  x = 0;}
if (x > 750){ // restricting out of bounds right side.
  speedX = 0;
  x = 750;}
  x += speedX;}
  
boolean collision(Attackers other) // checks if two object are touching and returns true if they're.
   {
     return (abs(this.x-other.x) < 35  &&  abs(this.y-other.y) < 35);
   }
    
}
