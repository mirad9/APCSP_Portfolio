//Zelda Breath of the Wild 2.0
boolean movedown1=true;
boolean movedown2=true;
boolean movedown3=true;
boolean movedown4=true;
boolean movedown5=true;
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
int horizen=0;
int verten=0;
int ex1=600;
int ey1=100;
int ex2=300;
int ey2=200;
int ex3=450;
int ey3=350;
int ex4=750;
float ey4=400;
int ex5=900;
float ey5=500;

void setup() {
  size(1370, 700);
  background(250);
  noStroke();
}
void draw(){
  background(255);
  enemyhit(ex1, ey1);
  enemyhit(ex2, ey2);
  enemyhit(ex3, ey3);
  enemyhit(ex4, ey4);
  enemyhit(ex5, ey5);
  
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
enemy(ex1, ey1);
enemy(ex2, ey2);
enemy(ex3, ey3);
enemy(ex4, ey4);
enemy(ex5, ey5);
restart1();
restart2();
restart3();
restart4();
restart5();
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

void enemy(float position1, float position2) {
  fill(20, 40, 100);
  rect(position1, position2, 40, 40);
  fill(0);
  ellipse(position1+10, position2+15, 10, 10);
  ellipse(position1+30, position2+15, 10, 10);
  ellipse(position1+20, position2+30, 30, 10);
}

void restart1(){ 
   if(ey1==650) {  
   movedown1=false;}
   if(ey1==0) {
   movedown1=true;}
   if(movedown1){
     ey1=ey1+5;}
   else{
   ey1=ey1-5;}
 }  
 
 void restart2(){ 
   if(ey2==650) {  
   movedown2=false;}
   if(ey2==0) {
   movedown2=true;}
   if(movedown2){
     ey2=ey2+10;}
   else{
   ey2=ey2-10;}
 }  
 
 void restart3(){  
   if(ey3==650) {
   movedown3=false;}
   if(ey3==0) {
   movedown3=true;}
   if(movedown3){
     ey3=ey3+5;}
   else{
   ey3=ey3-5;}
 }
 
 void restart4(){
   if(ey4==650) {
   movedown4=false;}
   if(ey4==0) {
   movedown4=true;}
   if(movedown4){
     ey4=ey4+2.5;}
   else{
   ey4=ey4-2.5;}
 }
 
 void restart5(){
   if(ey5==650) {
   movedown5=false;}
   if(ey5==0) {
   movedown5=true;}
   if(movedown5){
     ey5=ey5+10;}
   else{
   ey5=ey5-10;}
 }
 
 void enemyhit(float myx, float myy) {
   if (zeldaX>myx-11&&zeldaX<myx+40) {
    if(zeldaY>myy&&zeldaY<myy+40){
    stop=true;}}}
