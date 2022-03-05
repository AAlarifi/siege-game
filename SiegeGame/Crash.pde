class Crash { // crash class that contains the explosion animation.
float x, y; // x and y position 
int animationCounter; // animation counter

Crash(float x, float y){// crash animation constructor
this.x = x;
this.y = y;
}
void CrashCheck(){//checks if objects have collided with eachother and draws an explosion animation at defender position.
for (int i = 0; i < attackers.length; i++)
{
  if(defenderEden.collision(attackers[i])){
    draw(defenderEden.x, defenderEden.y);}
  }
}

void draw(float x, float y){ //float x and y are used here to draw the circles in the position of the objects.
  // colours are defined here then used to fill the colour of the cricles.
  color red = color(255,0,0);
  color orange = color(255,171,0);
  color yellow = color (255,239,0);
  noStroke(); // removes the outline of circles.
  if (animationCounter >0 & animationCounter <= 5){
    fill(yellow);
  circle(x, y,100);}
  else if (animationCounter >5 & animationCounter <= 10){
    fill(orange);
  circle(x, y,120);}
  else if (animationCounter >10 & animationCounter <= 15){
    fill(red);
  circle(x, y,160);}
  
animationCounter++;

if (animationCounter >15){
animationCounter = 0;}
}
}
