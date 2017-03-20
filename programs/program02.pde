
//Zelda Breath of the Wild 2.0
boolean stop=false;
boolean win=false;
int zeldaX=1100;
int zeldaY=50;
int horseX=1200;
int horseY=150;
int oldmanX=100;
int oldmanY=50;
boolean attack=false;
int zeldasspeed=1;
boolean rideing=false;
boolean catched=false;
int swardX=1200;
int swardY=65;
boolean swardget=false;
boolean oldup=false;
int ballX;
int ballY;
boolean fires=false;
int timer=30;
boolean fires1=false;
boolean cooldown=false;
boolean kill=false;
int enemylives=1;
boolean oldmandead=false;

void setup() {
  size(1370, 700);
  background(250);
  noStroke();
}
void draw(){
  background(255);
  if(win){
    fill(random(255));
    textSize(100);
    text("Congrats You just wasted Your Time",100,400);
     text("Your Time",400,600);
  }
  if(stop){
   exit(); 
  }

oldman(oldmanX,oldmanY);
zelda(zeldaX,zeldaY);
sward(swardX,swardY);
toodanger();
if(rideing){//horse follows you
 horseX=zeldaX-25;
 horseY=zeldaY+10;
}
if(zeldaX<horseX+50&&zeldaY<horseY+50&&zeldaY>horseY-50&&zeldaX>horseX-50&&catched){//if near horse
  rideing=true;
  zeldasspeed=10;
}

 horse(horseX,horseY);
  if(ballX+30>zeldaX&&ballX-30<zeldaX+30&&ballY+30>zeldaY&&ballY-30<zeldaY+40){
    stop=true;
    }
    if(zeldaX>1340){
     zeldaX=1340; 
    }if(zeldaX<0){
     zeldaX=0; 
    }if(zeldaY>640){
     zeldaY=640;
    }if(zeldaY<0){
     zeldaY=0;
    }
}

//Mirads section
void mousePressed(){
  if(attack&&!cooldown){
    kill=true;
    cooldown=true;
  }
}void mouseReleased(){
  cooldown=false;
}
void sward(int x, int y){//master sward
  fill(#C4C2C2);//silver
  triangle(x,y,x+10,y,x+5,y-50);//blade
  fill(#9D159D);//purple
  rect(x,y,10,15);
}
void horse(int x, int y){//Epona!!
fill(#6F4609);//brown
rect(x-10,y-7,30,14);//head
rect(x+15,y+7,5,8);//neck
rect(x+15,y+15,60,40);//body
rect(x+15,y+55,5,40);//leg front
rect(x+70,y+55,5,40);//leg back

}
void oldman(int x,int y){//dirty old man
if(oldmandead){
  win=true;
}
if(kill&&zeldaX>oldmanX-10&&zeldaX<oldmanX+40&&zeldaY>oldmanY-10&&zeldaY<oldmanY+40){
  oldmandead=true;
  enemylives=enemylives-1;
}if(!oldmandead){
fill(#EA6B09);//orange
rect(x,y,30,30);//body/robe
fill(#DEB762);//pale
rect(x,y,30,15);//head/face
fill(255);//white
triangle(x,y+15,x+30,y+15,x+15,y+30);//beard
if(oldmanY>660){
  oldup=true;
}if(oldmanY<0){
  oldup=false;
}if(oldup){
  oldmanY=oldmanY-10;
}else{
  oldmanY=oldmanY+10;
}
if(zeldaX<500){
fires=true;
}if(fires){
    timer=timer-1;
    ballX=ballX+10;
  }if(timer==0){
    timer=60;
    ballY=oldmanY;
    ballX=oldmanX;
    fires1=true;
  }
  if (fires1){
   fill(#F76E19);
  ellipse(ballX,ballY,20,20);  
  }
}
}

void zelda(int x, int y){
  
  fill(#19F007);//green
  rect(x,y,30,40);//body
  triangle(x,y,x+30,y,x+20,y-25);//hat
  fill(#EAD768);//pale
  rect(x,y,30,15);//face
}
void toodanger(){//attacks
  if(zeldaX<=swardX+40&&zeldaY<=swardY+40&&zeldaY>=swardY-40&&zeldaX>=swardX-40){//if near dirty old man
    attack=true;//can fight for honor
    swardget=true;}
     if (swardget){
    swardX=zeldaX-5;
    swardY=zeldaY+20;
 }
  
}
//Look at zelda go!!!
void keyPressed() {
  
  
  if (key==CODED){
    if (keyCode==UP)//up screen
    zeldaY=zeldaY-zeldasspeed;
  
   if (keyCode==DOWN)//down screen
    zeldaY=zeldaY+zeldasspeed;
  
  if (keyCode==LEFT)//left ward
    zeldaX=zeldaX-zeldasspeed;
  
  if (keyCode==RIGHT)//right ward
    zeldaX=zeldaX+zeldasspeed;
  
  if(keyCode==CONTROL)//press control
  catched=true;
  }
}


//joeys section

