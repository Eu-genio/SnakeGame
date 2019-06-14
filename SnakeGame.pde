int [] headx = new int[1000];//x location of snake
int [] heady = new int[1000];//y location of snake
int scl  = 10; //Turning the whole thing into a scl  so exact positioning can be measured
int w,a,s,d; // Controls 
int ax = floor(600/scl ), ay = floor(600/scl );//maths used to round the random location of food to an int
int axpos = scl *floor(random(ax)), aypos = scl *floor(random(ay)); //Position of food put on a scl 
int len = 1; //Counter that measures amount of food eaten and size of snake
int col1 = 100,col2 = 100,col3 = 100;//Fancy html thing except in processing xd
String op1 = ("Select difficulty"),op2 = ("Easy mode"),op3 = ("Hard mode");
boolean clicked,snake1,snake2,option; //Activation of code segments

void setup()
{
  size(600,600);
  frameRate(15);
  headx [0] = width/2;
  heady [0] = height/2;
}

void draw()
{
  background(0);
  //Mouse controls for fancy hover color changes on the 2 options
  if(mouseX >= 172 && mouseX <= 272 && mouseY > 325 && mouseY < 350)
  {
    col2 = 255; 
    if(clicked == true)
    {
      option = true; 
      snake1 = true; 
    }
  }
  else
  {
    col2 = 100;
  }
  
  if(mouseX >= 173 && mouseX <= 273 && mouseY > 350 && mouseY < 370)
  {
     col3 = 255; 
     if(clicked == true)
     {
       option = true; 
       snake2 = true; 
     }
  }
  else
  {
    col3 = 100;
  }
  
  if(option == false)
  {
    //Option window text
    textSize(13);
    textAlign(CENTER);
    fill(col1);
    text(op1,86,300,300,20);
  
    fill(col2);
    text(op2,172,325,100, 20);
  
    fill(col3);
    text(op3,173,350,100, 20);
  }
 
  if(option == true)
  {
    fill(255,0,0);
    rect(axpos,aypos, scl, scl);
    //Basic loop to check the snake body
    for(int i = 0; i < len;i++)
    {
      //Food spawning to a certain scale, to perfectly align the snake and the food
       if(headx[0] == axpos && heady[0] == aypos)
       {
         axpos = scl *floor(random(ax));
         aypos = scl *floor(random(ay));
         len++;
       }
       //Code to ensure that the food would not spawn at the head or body of the snake
        else if(headx[i] == axpos && heady[i] == aypos)
        {
          axpos = scl *floor(random(ax));
          aypos = scl *floor(random(ay));
        }
     }
    //Code for growth, each array is given a value and creates a new rect at the old position of the rect after it.
    for(int i = len; i >= 0;i--)
    {
      //This is to ensure that the head of the snake is never affected
      if(i != 0)
      {
        headx[i] = headx[i-1]; 
        heady[i] = heady[i-1];
        fill(0,255,0);
        rect(headx[i],heady[i],scl,scl);
      }
    }
    //When the head of the snake touches any part of its body
    for(int i = 2; i < len ;i++)
    {
      if(headx[0] == headx[i] && heady[0] == heady[i])
      {
        len = 1;                                      
        headx[0] = width/2;
        heady[0] = height/2; 
      }
    }
  }
//Easy mode, you can now pass through borders to go out the opposite side
if(snake1 == true)
{
    if(headx[0] > width)
    {
      headx[0] += - width - scl*2;  //not fully understood why I need to multiply by 2 
    }                               
    if(headx[0] < -scl){
      headx[0] += width + scl*2;
    }
    if(heady[0] > height){
      heady[0] = heady[0] - height - scl*2;
    }
    if(heady[0] < -scl){
      heady[0] += height + scl*2;
    }
}
//Hard mode, borders now also include the window border
  if(snake2 == true)
  {
      if(headx[0] >= width+scl ^ headx[0] <= -scl ^ heady[0] >= height+scl ^ heady[0] <= -scl)
      {
        len = 1;
        headx[0] = width/2;
        heady[0] = height/2;
      }
   }
   //Move commands
  if(w == 1)
  {
    heady[0] -= scl ;  //Direction and speed NORTH
  }
  if(a == 1)
  {
    headx[0] -= scl ;  //Direction and speed WEST
  }
  if(s == 1)
  {
    heady[0] += scl ;  //Direction and speed SOUTH
  }
  if(d == 1)
  {
    headx[0] += scl ;  //Direction and speed EAST
  }
}
//Key initialisation
void keyPressed()
{
  if(key == 'd')
  {
    if(a == 1)
    {
      w=0;
      a=1;
      s=0;
      d=0;
    }
    else{
    d=1;
    s=0;
    a=0;
    w=0;
    }
  }
  if(key == 's')
  {
    if(w == 1)
    {
      w=1;
      a=0;
      s=0;
      d=0;
    }
    else
    {
      w=0;
      a=0;
      s=1;
      d=0;
    }
  }
  
   if(key == 'a')
   {
    if(d == 1)
    {
      w=0;
      a=0;
      s=0;
      d=1;
    }
    else
    {
      w=0;
      a=1;
      s=0;
      d=0;
    }
  }
  
  if(key == 'w')
  {
    if(s == 1)
    {
      w=0;
      a=0;
      s=1;
      d=0;
    }
    else
    {
    w=1;
    a=0;
    s=0;
    d=0;
    }
  }
}

void mouseClicked()
{
  clicked = true;
}
