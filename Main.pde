Ball ball;
Paddle primary, secondary;
PFont font;             //arcade style font credits to Vic Fieger @ http://www.vicfieger.com/
int primary_score = 0;  //score counters
int secondary_score=0;
boolean one_player;   //if one player or not
boolean start=false;  //signals starting for animation

void setup()
{
  rectMode(CENTER);
  size(1000, 500);
  background(0);
  smooth(8);
  frameRate(200);
  font = createFont("ka1.ttf", height/5);
  textFont(font);  //initalizing font
  ball = new Ball();    //create ball object
  initializePaddles();// enters x values into primary and secondary paddles
}
void draw()
{
  if (start==false)
  {
    buttons();   //single player and double player button
  }
  else
  {
    ball.animateBall();  //uses vectors to add movements to ball, also checks if hitting walls
    animatePaddles();  //adds movements to paddles
    ball.outOfBounds();   //if ball goes out of bounds and update score
    score();       //draws score
  }
}
