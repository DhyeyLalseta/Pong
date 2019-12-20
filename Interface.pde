class Button {         //button at start
  int x, y, w, h;
  String t;

  Button(int x, int y, int w, int h, String t) {
    this.x = x;
    this.y = y;
    this.w = w;
    this.h = h;
    this.t = t;
  }

  boolean isInBounds(int x1, int y1) {            //if mousex and y are in bounds of button
    return x1 > x - w/2 && y1 > y - h/2 && x1 < x + w/2 && y1 < y + h/2;
  }

  void display() {                      //display buttons and update if mouse hovering
    textAlign(CENTER, CENTER);
    stroke(255);
    textSize(height/10);
    if (isInBounds(mouseX, mouseY))
    {
      fill(0);
      rect(x, y, w, h);
      fill(255);
      text(t.toUpperCase(), x, y);
    } else
    {
      fill(255);
      rect(x, y, w, h);
      fill(0);
      text(t.toUpperCase(), x, y);
    }
  }
}

void buttons()     //creates buttons
{
  Button oneplayer = new Button(width/4, height/2, width/2, height, "single" + "\n" + "player");
  oneplayer.display();
  Button twoplayer = new Button(width*3/4, height/2, width/2, height, "double" + "\n" + "player");
  twoplayer.display();
}


void mouseClicked()         //beginning if single player or double player
{
  if (start==false)
  {
    if (mouseX<width/2)
    {
      one_player=true;
      start=true;
    } else
    {
      one_player=false;
      start=true;
    }
  }
}

void score()   //display score
{
  text(primary_score, width*3/4, height*4/7);
  text(secondary_score, width/6, height*4/7);
}
