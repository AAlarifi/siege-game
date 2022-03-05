PImage backgroundSky, backgroundWall;
int siegeGameScreen = 0; 
int lives = 6; // lives displayed top left above score.
int score; // score displayed top left.
PFont font; 
boolean right, left, space;
String[] highscores;
Attackers[] attackers = new Attackers[6]; // array of attackers
Projectile projectile; // calling projectile
Defender defenderEden; //calling defender
Crash Crash1; //crash animation

void setup(){
  size(800,500); // size of canvas 800 width, 500 height.
  font = createFont("Dungeons.otf", 20); // loads font from file.
  backgroundSky = loadImage("backgroundSky.png"); // sky background is loaded
  backgroundSky.resize(width,height); //set sky image to be same size as the canvas
  defenderEden = new Defender(width/2,20); // defender positioned in middle top of wall.
  projectile = new Projectile(); // projectile loaded for use.
  space = false;
  left = false;
  right = false;
  highscores = loadStrings("highscores.txt"); // load text highscore textfile.
  
  for (int i = 0; i < attackers.length; i++ ) { // loops through till number of attackers in array is reached (Attackers[6]).
  float x = random(width/16, width/1.066); // random number between 50 and 750.
  float y = random(height/1.02, height*1.1); // random number betwen 490 and 550.
  float speedX = random(height/height, height/250); // speedX is either 1 or 2.
  float randomNumber = (int)random(1,3);
  
  if (randomNumber == 1) // if random number is 1 then white enemy is loaded.
  { 
  attackers[i] = new MeleeAttacker(x, y, speedX);}
  else  { // if the random number is anything but 1 then black enemy is loaded.
attackers[i] = new BrutalAttacker(x, y, speedX);}}

backgroundWall = loadImage("backgroundWall.png"); // load wall background infront of sky background for a layered effect.
backgroundWall.resize(width,height); //set image to be same size as the canvas
}

void draw (){
  if (siegeGameScreen == 0) { // The initial first screen. "Click to start game"
  initScreen();}
  else if (siegeGameScreen == 1) { // The game screen.
  siegeGameScreen();
} else if (siegeGameScreen == 2) { // Game over screen.
gameOverScreen();}}

void initScreen() {
  background(0);
  textFont(font);
  textAlign(CENTER);
  textSize(50);
  text("Click to start game!", width/2, height/2);
}

void siegeGameScreen() { // The siege game 
  image(backgroundSky, 0, 0); // sky loaded in background
  defenderEden.render(); // defender rendered 
  image(backgroundWall, 0, 0); // wall loaded in background
  projectile.update(); // projectile movement
  projectile.display(); // porjectile displayed
  for (Attackers a : attackers){ // each enemy is displayed moving towards the top of wall.
  a.update();}
  fill(255,255,255); // colour white
  textSize(20); 
  text("Lives: "+ lives + "\nScore: "+ score, 50, 25);
  String[] highscores = split(str(score), ' ');  // score is converted into string to be stored 
  saveStrings("highscores.txt", highscores); //stores score into highscores text file.
  noLives(); // checks if lives = 0
}

void gameOverScreen() { 
  background(0);
  textAlign(CENTER);
  fill(255);
  textSize(100);
  text("Game Over!", width/2, height/2 - 25);
  textSize(50);
  text("Click to Restart", width/2, height/2 + 25);
}

void noLives(){
  if (lives <= 0){ // when lives = 0. Game over screen is shown.
    siegeGameScreen = 2;}}

void keyPressed() { 
  if (keyCode == RIGHT){
    right = true;}
  if(keyCode == LEFT){
    left = true;}
  if(keyCode == ' '){
     space = true;}}

void keyReleased(){
  if(keyCode == ' '){
    space = false;}
  if(keyCode == RIGHT){
    right = false;}
  if(keyCode == LEFT){
    left = false;}}

public void mousePressed() {
  if (siegeGameScreen==0) { //if on the initial first screen. Click to start the game.
    startSiegeGame();}
  if (siegeGameScreen==2){ // game over screen. Click to restart.
    restart();}}

void startSiegeGame() { 
  siegeGameScreen=1;}

void restart() { // game is restared from the begining.
    for (int i = 0; i < attackers.length; i++ ) {
    float x = random(width/16, width/1.066); // random number between 50 and 750.
    float y = random(height/1.02, height*1.1); // random number betwen 490 and 550.
    float speedX = random(height/height, height/250); // speedX is either 1 or 2.
    attackers[i] = new MeleeAttacker(x,y,speedX);}
  lives += 6; // lives are reset to original amount.
  score = 0; // score is reset to zero
  siegeGameScreen = 0;
}
