class Torpedo{
  int left,top,w,h,direction,bottom,right;
  float leftRight;
  color c;
  boolean exploading=false;
  float radius;
  float boomSize;
  int boomTime=0;
  boolean done = false;
  
  Torpedo(int x,int y, int direction,color c,float leftRight){
    this.left=x;
    this.top=y;
    this.leftRight=leftRight;
    this.direction=direction;
    h=20;
    w=10;
    this.c=c;
  }
  
  void move(){
    top+=direction;
    left+=leftRight;
  }
  
  void drawTorpedo(){
    right = left+w;
    bottom = top+h;
    if(!exploading)move();
    fill(c);
    stroke(255,255,0);
    strokeWeight(2);
    ellipse(left+5,top+5,10,10);
    noStroke();
    beginShape();
      vertex(left,top+5);
      vertex(left+10,top+5);
      vertex(left+7,top+12);
      vertex(left+5,top+20);
      vertex(left+3,top+12);
    endShape();
    if(exploading)expload();
    if(top<0)expload();
  }
  
  void expload(){
    if(boomTime==0){
      tBoom.cue(.8);
      tBoom.play();
      tShock.play();
    }else if(boomTime==100)tShock.play();
    exploading=true;
    boomTime++;
      if (boomTime<200) {
      boomTime++;
      if (boomTime<101) {
        boomSize=boomTime*.01;
      } else if (boomTime>100 && boomTime<201) {
        boomSize=1-(boomTime-100)*.01;
      } 
      radius=boomSize*150;
    torpedoExplosion(left+2,top+10,boomSize*3);
  }else{
    done=true;
    print("done");
  }
  }
}
