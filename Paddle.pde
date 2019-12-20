class Paddle  //class for paddles
{
  PVector location;
  PVector direction = new PVector(0, 0);
  final int paddleLength = height/5;
  final int paddleWidth = width/150;
  final int paddle_speed = height/250;

  void movement()     //basic ai for secondary paddle
  {
    if (ball.location.x<width/2 && ball.direction.x<0)
    {
      if (ball.location.y>location.y)
        direction.y=paddle_speed;
      else if (ball.location.y<location.y)
        direction.y=-paddle_speed;
    }
    else
      direction.y=0;
  }
}
