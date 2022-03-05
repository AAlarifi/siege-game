class MeleeAttacker extends Attackers{ // this class extends the functionality of the parent class using inheritance
int animationCounter, imgCount; // counters used in loop and if statement
PImage meleeAttackersImgs []; // images array

MeleeAttacker (float x,float y, float speedX){ //the constructor
super (x, y, speedX); // refers to immediate parent class object
imgCount = 6; // The number of images that are going to be loaded.
meleeAttackersImgs = new PImage[imgCount];
for (int i = 0; i<imgCount; i++) { // each enemy image is loaded one by one
  meleeAttackersImgs[i]=loadImage("meleeAttacker"+ i +".png");
  meleeAttackersImgs[i].resize(50,50);
}
}

void render(){ // movement animation for white coloured enemy.
  if (animationCounter >0 & animationCounter <= 10){
    image(meleeAttackersImgs[0], x, y);
  }
  else if (animationCounter >10 & animationCounter <= 20){
    image(meleeAttackersImgs[1], x, y);
  }
  else if (animationCounter >20 & animationCounter <= 30){
    image(meleeAttackersImgs[2], x, y);
  }
  else if (animationCounter >30 & animationCounter <= 40){
    image(meleeAttackersImgs[3], x, y);
  }
  else if (animationCounter >40 & animationCounter <= 50){
    image(meleeAttackersImgs[4], x, y);
  }
  else if (animationCounter >50 & animationCounter <= 60){
    image(meleeAttackersImgs[5], x, y);
  }
animationCounter++;

if (animationCounter >60){
  animationCounter = 0;}
}
}
