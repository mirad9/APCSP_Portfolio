boolean cat=false;
boolean dog=false;
boolean bunny=false;
boolean chose=false;
int catheadX=600;
int catbodyX=600;
int catheadY=350;
int catbodyY=470;

void setup(){
  size(1200,700);
}
void draw(){
  noStroke();
  background(255);
  pick();
  if(cat){
   cat(catheadX,catheadY,catbodyX,catbodyY); 
  }
}
void pick(){
  if(!chose&&mousePressed&&mouseX>225&&mouseX<275&&mouseY>325&&mouseY<375){
   cat=true; 
   chose=true;
  }if(!chose&&mousePressed&&mouseX>525&&mouseX<575&&mouseY>325&&mouseY<375){
   bunny=true; 
   chose=true;
  }if(!chose&&mousePressed&&mouseX>825&&mouseX<875&&mouseY>325&&mouseY<375){
   cat=true; 
   chose=true;
  }if(!chose){
  fill(255,0,0);
 rect(225,325,50,50);//cat
 fill(0,255,0);
 rect(525,325,50,50);//bunny
 fill(0,0,255);
 rect(825,325,50,50);//dog
  }
}
void cat(int hx,int hy,int bx,int by){
  fill(#EB9900);
  ellipse(hx,hy,130,100);
  ellipse(bx,by,220,180);
  triangle(hx-55,hy-25,hx-55,hy-65,hx-35,hy-40);
  triangle(hx+55,hy-25,hx+55,hy-65,hx+35,hy-40);
}
