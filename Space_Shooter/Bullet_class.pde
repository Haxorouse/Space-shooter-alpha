class Bullet{
  float left,top,w,h,direction,bottom,right,leftRight;
  color c;
  Bullet(float x,float y, float direction,color c,float leftRight){
    this.left=x;
    this.top=y;
    this.leftRight=leftRight;
    this.direction=direction;
    h=15;
    w=4;
    this.c=c;
  }
  
  void move(){
    top+=direction;
    left+=leftRight;
    drawBullet();
  }
  
  void drawBullet(){
    noStroke();
    right = left+w;
    bottom = top+h;
    fill(c);
    rect(left,top,w,h);
  }
}
