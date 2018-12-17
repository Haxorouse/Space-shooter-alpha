class Cryomorph{
  int x;
  int y;
  int w;
  int h;
  int speed =7;
  boolean moveRight = true;
  int health = 4;
  int deathTimer;
  boolean dead = false;
  int deathX;
  int deathY;
  float boomSize;
  boolean dropPU = false;
  int dropChance;
  
  Cryomorph(int x, int y){
    this.x=x;
    this.y=y;
    this.w=50;
    this.h=50;
  }
  
  void drawCryomorph(){
     pushMatrix();
  translate(x-25,y-25);
  scale(1.0,1.0);
  
  //death aura
  noStroke();
  fill(8,182,203,70);
  ellipse(25,25,100,100);
  
  //thrusters
  noStroke();
  fill(32,180,198);
  rect(10,25,6,10);
  rect(34,25,6,10);
  fill(255);
  ellipse(13,25,6,4);
  ellipse(37,25,6,4);
  fill(201,249,255);
  ellipse(37,26,3,2);
  ellipse(13,26,3,2);
  
  //body
  noFill();
  stroke(126,247,250);
  strokeWeight(5);
  arc(25,25,47,47,0.3,2.9);
  arc(0,0,50,100,0.12,1.03);
  arc(50,0,50,100,2.10,3.05);
  arc(10.7,26,18,20,0.37,2.66);
  arc(39.3,26,18,20,0.37,2.66);
  fill(126,247,250);
  noStroke();
  triangle(37,46, 13,46, 25,0);
  ellipse(10,37,8,8);
  ellipse(40,37,8,8);
  
  //cockpit
  fill(0,255,0);
  ellipse(25,40,7,12);
  
  //helth indicators
  fill(0,255,0);
  if(health<4)fill(255,0,0);
  ellipse(6,35,5,5);
  ellipse(44,35,5,5);
  fill(0,255,0);
  if(health<3)fill(255,0,0);
  ellipse(11,41,5,5);
  ellipse(39,41,5,5);
  fill(0,255,0);
  if(health<2)fill(255,0,0);
  ellipse(18,44,5,5);
  ellipse(32,44,5,5);
  
  popMatrix();
  if(!dead){
      move();
      deathAura();
    }else{
      destroy();
    }
  dropChance();
  }
  
  void deathAura(){
    if(dist(hero.x,hero.y,x,y)<50 && hero.y==height-80){
      hero.sheildTime=0;
      hero.damage(30);
    }
  }
  
  void dropChance(){
    dropChance=(int)random(1,8);;
    if(dropChance==1){
      dropPU=true;
    }else{
      dropPU=false;
    }
  }
  
  void damage(int damage) {
    health-=damage;
    if(dead==false)hero.score+=15*damage;
    if (health<1) {
      destroy();
    }
  }
  
  void destroy() {
    if(dead==false){
    deathX=x;
    deathY=y;
    if(dropPU){
        powerUps.add(new PowerUp(deathX,deathY,(int)random(0,7)));
      }
    }
    dead=true;
    if (deathTimer<160) {
      deathTimer++;
      if (deathTimer<81) {
        boomSize=deathTimer*.0125;
      } else if (deathTimer>80 && deathTimer<161) {
        boomSize=1-(deathTimer-80)*.0125;
        y=height+50;
      }
      explosion(deathX, deathY, boomSize);
    } else {
      deathTimer=0;
    cryomorphs.remove(this);
    }
  }
  
  void move() {
    if (moveRight) {
      x+=speed;
      if (x+w/2>width) {
        x-=speed;
        moveRight = false;
      }
    } else {
      x-=speed;
      if (x-w/2<0) {
        x+=speed;
        moveRight=true;
      }
    }
    y+=4;
    if (y>height+h/2) {
      y=-h;
      x=(int)random(width);
    }
    float rand = random(200);
    if (rand<5) {
      if (moveRight) {
        moveRight=false;
      } else {
        moveRight=true;
      }
    }
  }
  
  boolean isCollision(Bullet b) {
    if (b.right>x-w/2 && b.left<x+w/2 && b.bottom>y-h/2 && b.top<y+h/2 && !dead) return true;
    return false;
  }
   boolean isExploaded(Torpedo t) {
    if(dist(t.left-2,t.top-10,x,y)<t.radius)return true;
    return false;
  }
}
