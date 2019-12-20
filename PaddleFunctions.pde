void initializePaddles()  //enters x values into paddles relative screen size
{
  primary = new Paddle();
  primary.location= new PVector(width*.988, height/2);
  secondary = new Paddle();
  secondary.location = new PVector(width*.007, height/2);
  rectMode(CENTER);
}

void animatePaddles()  //creates the paddles and adds movement
{
  fill(255);
  rect(primary.location.x, primary.location.y, primary.paddleWidth, primary.paddleLength, 30);
  rect(secondary.location.x, secondary.location.y, secondary.paddleWidth, secondary.paddleLength, 30);
  primary.location.add(primary.direction);
  if (one_player == true)
    secondary.movement();
  secondary.location.add(secondary.direction);
  if (ball.location.x+ball.diameter/2>=primary.location.x-primary.paddleWidth/2 && ball.location.x+ball.diameter/2<=primary.location.x)
    collide(primary, -ball.x_speed);
  if (ball.location.x-ball.diameter/2<=secondary.location.x+secondary.paddleWidth/2 && ball.location.x-ball.diameter/2>=secondary.location.x)
    collide(secondary, ball.x_speed);
  paddleBoundaries(primary);
  paddleBoundaries(secondary);
}

void paddleBoundaries(Paddle paddle)  //paddle cant go past screen
{
  if (paddle.location.y+paddle.paddleLength/2>=height)
    paddle.location.y=height-paddle.paddleLength/2;
  if (paddle.location.y-paddle.paddleLength/2<=0)
    paddle.location.y=paddle.paddleLength/2;
}

void collide(Paddle paddle, int t)  //if ball collides paddle
{
  if (ball.location.y>=paddle.location.y-paddle.paddleLength/2 && ball.location.y<=paddle.location.y+paddle.paddleLength/2)
  {
    ball.direction.x=t;
    ball.direction.y+=paddle.direction.y/3;
  }
}

void keyPressed()  //controls primary & secondary paddle
{
  if (keyCode == UP)
    primary.direction.y=-primary.paddle_speed;
  if (keyCode == DOWN)
    primary.direction.y=primary.paddle_speed;
  if (keyCode=='W')
    secondary.direction.y=-secondary.paddle_speed;
  if (keyCode=='S')
    secondary.direction.y=secondary.paddle_speed;
}

void keyReleased()   //updates direction after releasing key
{
  if (keyCode == UP || keyCode == DOWN)
    primary.direction.y=0;
  if (keyCode=='W' || keyCode=='S')
    secondary.direction.y=0;
}
