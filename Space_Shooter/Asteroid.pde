class Asteroid{
  int w,h,size,immune;
  float speed,lr,x,y,scale;
  boolean isSmall;
  boolean isVaporizing;
  int heat,vaporTimer;
  int shape=(int)random(0,4);
  
  Asteroid(int x, int y, boolean small,int immune){
    this.x=x;
    this.y=y;
    this.isSmall=small;
    this.speed=random(.9,1.1);
    this.immune=immune;
    if(isSmall){
      this.w=25;
      this.h=25;
      this.size=25;
      this.scale=.5;
      this.speed=random(-2,2);
      this.lr=random(-2,2);
    }else{
      this.w=50;
      this.h=50;
      this.size=50;
      this.scale=1;
    }
  }
  
    void drawAsteroid(){
      pushMatrix();
    translate(x-(scale*25),y-(scale*25));
    scale(scale,scale);
    
    if(shape==1){
      //main body
      strokeWeight(3);
      stroke(142,68,31);
      fill(175+(.2*heat),101+(.6*heat),64-(.1*heat));
      ellipse(25,25,48,48);
      //craters
      strokeWeight(2);
      stroke(80+(.2*heat),39+(.6*heat),19-(.1*heat));
      fill(121+(.2*heat),62+(.6*heat),32-(.1*heat));
      ellipse(15,15,7,7);
      ellipse(30,25,15,15);
      ellipse(10,35,9,9);
    }else if(shape==2){
      //main body
      strokeWeight(3);
      stroke(142,68,31);
      fill(175+(.2*heat),101+(.6*heat),64-(.1*heat));
      ellipse(25,25,39,39);
      ellipse(12,25,25,25);
      ellipse(25,12,25,25);
      ellipse(38,25,25,25);
      ellipse(25,38,25,25);
      noStroke();
      ellipse(25,25,35,35);
      //craters
      strokeWeight(2);
      stroke(80+(.2*heat),39+(.6*heat),19-(.1*heat));
      fill(121+(.2*heat),62+(.6*heat),32-(.1*heat));
      ellipse(19,13,7,7);
      ellipse(27,35,12,12);
      ellipse(37,19,9,9);
    }else if(shape==3){
      //main body
      strokeWeight(3);
      stroke(142,68,31);
      fill(175+(.2*heat),101+(.6*heat),64-(.1*heat));
      beginShape();
        vertex(0,25);
        vertex(3.5,37.5);
        vertex(7.5,42.5);
        vertex(12.5,46.5);
        vertex(25,50);
        vertex(37.5,46.5);
        vertex(42.5,42.5);
        vertex(46.5,37.5);
        vertex(50,25);
        vertex(46.5, 12.5);
        vertex(42.5, 7.5);
        vertex(37.5, 3.5);
        vertex(25, 0);
        vertex(21.5,12.5);
        vertex(17.5,17.5);
        vertex(12.5,21.5);
        vertex(0,25);
      endShape();
      //craters
      strokeWeight(2);
      stroke(80+(.2*heat),39+(.6*heat),19-(.1*heat));
      fill(121+(.2*heat),62+(.6*heat),32-(.1*heat));
      ellipse(25,17,7,7);
      ellipse(15,27,13,13);
      ellipse(37,37,9,9);
    }else{
      //main body
      strokeWeight(2);
      stroke(142,68,31);
      fill(175+(.2*heat),101+(.6*heat),64-(.1*heat));
      for (int e=0;e<12;e++){
        ellipse(25+(20*cos(e*PI/6)),25+(20*sin(e*PI/6)),9,9);
      }
      noStroke();
      ellipse(25,25,40,40);
      //craters
      strokeWeight(2);
      stroke(80+(.2*heat),39+(.6*heat),19-(.1*heat));
      fill(121+(.2*heat),62+(.6*heat),32-(.1*heat));
      ellipse(15,37,9,9);
      ellipse(37,20,12,12);
      ellipse(27,10,7,7);
    }
    popMatrix();
    if(immune>0)immune--;
    if(!isVaporizing){
      move();
      collide();
    }else{
      vaporize();
    }
    
    if(heat>=150){
      isVaporizing=true;
      heat=150;
    }else if(heat>0){
      heat--;
    }
  }
  
  void collide(){
      if(dist(hero.x,hero.y,x,y)<(scale*53) && hero.y==height-80){
        hero.sheildTime=0;
        hero.damage(30);
      }
    }
  
  
  void move(){
    if(isSmall){
      y+=speed;
      x+=lr;
      if(x<12 || x>(width-12)){
        lr=-lr;
      }
      if(y<12 || y>(height-12)){
        speed=-speed;
      }
    }else{
      y+=speed;
      if(y>height+h/2){
        speed=random(.9,1.1);
        y=(int)random(-100,-h);
        x=(int)random(w/2,width-(w/2));
        shape=(int)random(0,4);
      }
    }
  }
  
  void vaporize(){
    vaporTimer++;
    noStroke();
    fill(201,161,124,150-(vaporTimer*1.5));
    ellipse(x,y,vaporTimer*2,vaporTimer*2);
    scale-=size*.0002;
    if(vaporTimer>100) asteroids.remove(this);
  }
  
  void shatter(){
    for(int f=0;f<3;f++){
      asteroids.add(new Asteroid((int)x,(int)y,true,200));
    }
  }
  
   boolean isCollision(Bullet b) {
    if (dist(b.right,b.top,x,y)<(scale*25) && !isVaporizing) return true;
    return false;
  }
  boolean isExploaded(Torpedo t) {
    if(dist(t.left-2,t.top-10,x,y)<t.radius+(scale*25) && immune<=0 && t.exploading)return true;
    return false;
  }
}
