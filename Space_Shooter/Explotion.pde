void explotion(int x,int y,float size){
  
    pushMatrix();
  translate(x,y);
  scale(size,size);
  
  fill(255,0,0);
  stroke(148,2,2);
  strokeWeight(7);
  for(int a=0;a<70;a++){
  ellipse(random(100),random(100),random(20,35),random(20,35));
  }
  
  fill(246,174,3);
  stroke(252,113,0);
  for(int b=0;b<40;b++){
  ellipse(random(10,90),random(10,90),random(15,30),random(15,30));
  }

  fill(248,234,5);
  stroke(243,200,0);
  strokeWeight(4);
  for(int c=0;c<20;c++){
  ellipse(random(30,70),random(30,70),random(10,25),random(10,25));
  }
  
  fill(254,254,254);
  stroke(246,250,137);
  strokeWeight(2);
  for(int d=0;d<10;d++){
    ellipse(random(40,60),random(40,60),random(5,10),random(5,10));
  }

  popMatrix();
  
}
