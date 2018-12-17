void explosion(float x,float y,float size){
    pushMatrix();
  translate(x-(50*size),y-(50*size));
  scale(size,size);
  
 fill(255,0,0);
  stroke(148,2,2);
  strokeWeight(7);
  ellipse(50,50,100,100);
  
  
  fill(246,174,3);
  stroke(252,113,0);
  ellipse(50,50,60,60);
  
  
  fill(254,254,254);
  stroke(246,250,137);
  strokeWeight(2);
  ellipse(50,50,20,20);

  popMatrix();
}
