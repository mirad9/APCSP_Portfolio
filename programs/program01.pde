void setup(){
  size (500,500);
  background(255);
}
void draw(){
  background(255);
 if(mouseX>10&&mouseX<490&&mouseY>50&&mouseY<350&&mousePressed){
   sheep();
 }else{
  box(); 
 }
}
void box(){
  fill(#AD7909);
  rect(10,50,480,300);//box
  fill(#503700);
  ellipse(250,200,30,30);//middle hole
  ellipse(375,200,30,30);
  ellipse(125,200,30,30);
}
void sheep(){
  noStroke();
  fill(#EAE7DF);
  quad(100,150,350,125,370,275,90,260);//body
  //leg 1
  quad(270,200,320,330,335,340,285,200);
  quad(320,330,335,340,290,390,275,390);
  fill(0);
  rect(275,390,15,5);
  //leg 2
  fill(#EAE7DF);
  quad(110,260,150,260,125,390,110,390);
  fill(0);
  rect(110,390,15,5);
  //head
  fill(#EAE7DF);
  quad(120,150,110,80,45,110,50,130);
  triangle(110,80,95,90,103.5,70);
  fill(255);
  ellipse(90,100,10,10);
  fill(0);
  ellipse(87,100,3,3);

}
