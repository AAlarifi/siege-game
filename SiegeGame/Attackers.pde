abstract class Attackers {
  float x, y; //position of attacker
  float speedX; // speed of attacker

Attackers (float x,float y, float speedX){ //The constructor
this.x = x;
this.y = y;
this.speedX = speedX;}

void update(){
move(); // attackers movement
render();} // renders attackers

  
void move(){ // attackers movement
y -= speedX;
if (y < 50){ // when attacker reaches top of wall, -1 life and respawn somewhere at the bottom of the wall to rise again.
lives -= 1;
respawn();}}

void respawn(){
  y = random(height/1.02, height*1.1); // random number between 50 and 750.
  x = random(width/16, width/1.066); // random number betwen 490 and 550.
}

abstract void render();}
