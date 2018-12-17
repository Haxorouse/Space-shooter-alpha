ArrayList<Star> stars = new ArrayList<Star>();

void newBackground(){
  stars.clear();
  for(int s=0;s<50;s++){
    stars.add(new Star((int)random(width),random(height)));
  }
}

void drawBackground(){
  background(0,0,20);
 for(int s=0;s<50;s++){
    stars.get(s).drawStar();
  }
  fill(0,0,20,70);
  rect(-1,-1,width+2,height+2);
}
