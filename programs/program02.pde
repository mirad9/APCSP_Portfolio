int gunX;
int gunY;
boolean shotcooling=false;
int hunterX=570;
int hunterY=260;
float elephantX;
float elephantY;
boolean spawns1=true;
boolean shoots=false;
boolean elephantdead=false;
boolean hunterdead=false;
int animalskilled=24;
boolean eshootable=false;
float speedY=100;
float speedX=100;
int speed=5;
boolean speedcooldown=false;
int range=150;
float rangeX=200;
float rangeY=400;
boolean rangecooldown=false;
float pantherX;
float pantherY;
boolean pantherdead=false;
boolean pshootable=false;
boolean spawns2=true;
boolean shot=false;
int shotcooldown;
int shotcooldownvalue=50;
void setup(){
 size(1200,600);
 noStroke();
 
}
void draw(){
  background(#41DE00);
  speedboost(speedX,speedY);
  rangeboost(rangeX,rangeY);
  fill(0);
  textSize(20);
  text("Killed:",50,50);
 text(animalskilled,130,50);
 text("Speed:",50,100);
 text((speed-5)/5,130,100);
 text("Range:",50,150);
 text((range-150)/50,130,150);
 text("Gun cooldown:",50,200);
 text(shotcooldown,200,200);
  hunter(hunterX,hunterY);
  gun(gunX,gunY);
  elephant(elephantX,elephantY);
  //spawning
  if(animalskilled>25){
  panther(pantherX,pantherY);
  }
  if(spawns2&&animalskilled>25){
    
    pantherdead=false;
    pantherX=random(hunterX+100+random(700));
    pantherY=random(hunterY+100+random(400));
    spawns2=false;
    
  }if(pantherdead){
    spawns2=true;
  }
  if(spawns1){
    elephantdead=false;
    elephantX=random(hunterX+100+random(700));
    elephantY=random(hunterY+100+random(400));
    spawns1=false;
  }if(shoots){
     shoots=false;
  }if(elephantdead){
    spawns1=true;
  }
  }
void rangeboost(float x,float y){
  if(!rangecooldown){
  fill(#070FD8);
  ellipse(x,y,75,75);
  fill(#41DE00);
  ellipse(x,y,65,65);
  fill(#070FD8);
  rect(x-42.5,y-2.5,85,5);
  rect(x-2.5,y-42.5,5,85);
   }if(range>450){
    range=300; 
   }
  }
void speedboost(float x,float y){
  if(!speedcooldown){
  fill(#FF0000);
  rect(x,y+10,20,20);
  rect(x,y+30,60,25);
  fill(#FFC800);
  triangle(x+5,y+30,x+15,y+30,x+20,y+55);
  }
}
void hunter(int x,int y){
if(shotcooling){
  shotcooldown=shotcooldown-1;
}
  if(shot&&shotcooldown<1){
    shotcooldown=shotcooldownvalue;
  }if(shotcooldown==shotcooldownvalue){
    shotcooling=true;
  }if(shotcooldown<0){
    shotcooldown=0;
    shotcooling=false;
  }
  if(!hunterdead){
  fill(#18641B);
  rect(x,y,30,40);
  fill(#FAE08B);
  rect(x,y,30,10);
  }else{
   fill(#FF0011);
   rect(x-250,y-250,500,500);
  }if(!speedcooldown&&hunterX<speedX+60&&hunterX>speedX&&hunterY<speedY+40&&hunterY>speedY){
speed=speed+5;
speedcooldown=true;
  }if(animalskilled>5&&speedcooldown&&!(hunterX<speedX+60&&hunterX>speedX&&hunterY<speedY+40&&hunterY>speedY)){
   speedcooldown=false;
   speedX=random(1000);
   speedY=random(450);
  }if(!rangecooldown&&hunterX<rangeX+35&&hunterX>rangeX-35&&hunterY<rangeY+35&&hunterY>rangeY-35){
range=range+50;
rangecooldown=true;
  }if(animalskilled>20&&rangecooldown&&!(hunterX<rangeX+60&&hunterX>rangeX&&hunterY<rangeY+40&&hunterY>rangeY)){
   rangecooldown=false;
   rangeX=random(1000);
   rangeY=random(450);
  }
}
void gun(int x,int y){
  if(!hunterdead){
 gunX=hunterX+15;
 gunY=hunterY+20;
 fill(#7C5706);
 rect(x,y,15,5); 
 fill(0);
 rect(x+15,y,20,2);
  }
}
void elephant(float x,float y){
  if(elephantX+range+100>gunX&&elephantX-range<gunX&&!shot&&shotcooldown==0){
    eshootable=true;
  }if(elephantdead){
    eshootable=false;
}
  if(!elephantdead){
    if(hunterX-elephantX>0){
      elephantX=elephantX+1;
    }else{
      elephantX=elephantX-1;
    }if(hunterY-elephantY>0){
      elephantY=elephantY+1;
    }else{
      elephantY=elephantY-1;
    }
    if(elephantX-30<hunterX&&elephantX+130>hunterX&&elephantY-40<hunterY&&elephantY+100>hunterY){
     hunterdead=true; 
    }
  fill(150);
  rect(x,y,100,60);
  rect(x+80,y-30,55,40);
  rect(x,y+60,20,40);
  rect(x+80,y+60,20,40);
  rect(x+135,y-20,20,10);
  rect(x+145,y-20,10,80);
  fill(190);
  quad(x+100,y-15,x+75,y-5,x+60,y-40,x+100,y-20);
  if(eshootable&&shoots&&gunY>elephantY-range&&gunY<elephantY+range){
    elephantdead=true;
    animalskilled=animalskilled+1;
  }
  }
}
void panther(float x,float y){
  if(!pantherdead){
  fill(0);
  rect(x,y,60,30);
  rect(x+50,y-13,25,20);
  rect(x,y+30,5,15);
  rect(x+50,y+30,5,15);
   if(pantherX+range+55>gunX&&pantherX-range<gunX&&!shot){
    pshootable=true;
  }if(pantherdead){
    pshootable=false;
    spawns2=true;
}
  
    if(hunterX-pantherX>0){
      pantherX=pantherX+4;
    }else{
      pantherX=pantherX-4;
    }if(hunterY-pantherY>0){
      pantherY=pantherY+4;
    }else{
      pantherY=pantherY-4;
    }
    if(pantherX-15<hunterX&&pantherX+65>hunterX&&pantherY-15<hunterY&&pantherY+65>hunterY){
     hunterdead=true; 
    }
     if(pshootable&&shoots&&gunY>pantherY-range&&gunY<pantherY+range){
    pantherdead=true;
    animalskilled=animalskilled+1;
  }
  }
}
void keyPressed() {
  if (key==CODED){
    if(!hunterdead){
      if(keyCode==SHIFT)
  shoots=true;
  shot=true;
    if (keyCode==UP)//up screen
    hunterY=hunterY-speed;
    
   if (keyCode==DOWN)//down screen
    hunterY=hunterY+speed;
    
  if (keyCode==LEFT)//left ward
    hunterX=hunterX-speed;
   
  if (keyCode==RIGHT)//right ward
    hunterX=hunterX+speed;
      
  
    }
  }
}void keyReleased(){
 shoots=false; 
 shot=false;
}
