class Projectile {
  float x, y, w, h;
  float speed, maxSpeed;
  boolean firing;

  Projectile() {
    x = defenderEden.x;
    y = defenderEden.y;
    w = 20; // width of projectile
    h = 10; // height of projectile
    speed = 0; //initial speed of projectile
    maxSpeed = 20; // spead of projectile
    firing = false;
  }
  void setStartLocation(float startX, float startY) {
    if (firing == false) {
      x = startX;
      y = startY;
      firing = true;
      speed = 20;}}
      
void update() {
      if (space) {
    projectile.setStartLocation(defenderEden.x, defenderEden.y); // starts each projectile at defender position.
  }
    if (firing == true) { // when Space is pressed, projectile moves on Y-axis.
      y += maxSpeed; 

      if (y > height) { // when projectile out of bounds, resets its position back to defender
        reset();
      }
    }
    for (int i = 0; i < attackers.length; i++){
      if(projectileHit(projectile, attackers[i])){
        score++;
        attackers[i].respawn();
      projectile.reset();}}}

void reset() {
    speed = 0;
    firing = false;
    y = -100;} // makes projectile go back to defender position.

void display() {
    // projectile is displayed behind the defender position.
    pushMatrix(); 
    translate(x, y);
    noStroke();
    fill(127, 207, 250);
    circle(25,20,30);
    popMatrix();
  }
  boolean projectileHit(Projectile p1, Attackers a1) { //checks if the projectile overlaps with enemy.
  float distanceX = (p1.x) - (a1.x);
  float distanceY = (p1.y) - (a1.y);
  float combinedHalfW = p1.w/2 + 50/2;
  float combinedHalfH = p1.h/2 + 50/2;
  
  if (abs(distanceX) < combinedHalfW) { // checks for overlap on X-axis
  if (abs(distanceY) < combinedHalfH) { //checks for overlap on Y-axis
  return true;}}
  return false;}}
