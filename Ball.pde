class Ball
{
  PVector location, direction;
  final int diameter = height/40;      //diameter and x-speed of ball relative to size
  int x_speed=width/500;
  Ball()
  {
    location = new PVector(width/2, height/2);
    direction = new PVector(int(random(1)>0.5 ? -x_speed:x_speed), int(random(1)>0.5 ? -1:1));  //random 1/4 at start
  }
  void animateBall()  //movement to balls and checking if hitting walls
  {
    background(0);
    fill(255);
    circle(location.x, location.y, diameter);    //creates circle
    location.add(direction);
    if (location.y+diameter/2>= height|| location.y<=diameter/2)
      direction.y*=-1;   //bounce off walls
  }
  void outOfBounds()     //if ball goes past paddles
  {
    if (location.x>width)
    {
      ball = new Ball();
      ball.direction.x=-x_speed;
      secondary_score++;
    }
    if (location.x<0)
    {
      ball = new Ball();
      ball.direction.x=x_speed;
      primary_score++;
    }
  }
}
