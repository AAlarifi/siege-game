class BrutalAttacker extends Attackers{ // this class extends the functionality of the parent class using inheritance.
int animationCounter, imgCounter; // counter used for loop and if statments.
PImage brutalAttackersImgs []; // an image array.

BrutalAttacker (float x,float y, float speedX){ // the constructor
super (x, y, speedX); // refers to immediate parent class object
imgCounter = 6; // The number of images that are going to be loaded.
brutalAttackersImgs = new PImage[imgCounter];
for (int i = 0; i<imgCounter; i++) { // each enemy image is loaded one by one
  brutalAttackersImgs[i]=loadImage("brutalAttacker"+ i +".png");
  brutalAttackersImgs[i].resize(50,50);
}
}

void render(){ // movement animation for black coloured enemy.
  if (animationCounter >0 & animationCounter <= 10){
    image(brutalAttackersImgs[0], x, y);
  }
  else if (animationCounter >10 & animationCounter <= 20){
    image(brutalAttackersImgs[1], x, y);
  }
  else if (animationCounter >20 & animationCounter <= 30){
    image(brutalAttackersImgs[2], x, y);
  }
  else if (animationCounter >30 & animationCounter <= 40){
    image(brutalAttackersImgs[3], x, y);
  }
  else if (animationCounter >40 & animationCounter <= 50){
    image(brutalAttackersImgs[4], x, y);
  }
  else if (animationCounter >50 & animationCounter <= 60){
    image(brutalAttackersImgs[5], x, y);
  }
animationCounter++;

if (animationCounter >60){
  animationCounter = 0;}
}
}
