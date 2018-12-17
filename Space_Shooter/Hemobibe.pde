class Hemobibe{
  int x;
  int y;
  int w;
  int h;
  int speed =5;
  int health = 7;
  ArrayList<Bullet> bullets = new ArrayList<Bullet>();
  boolean moveRight = true;
  int deathTimer;
  boolean dead = false;
  int deathX;
  int deathY;
  float boomSize;
  boolean dropPU = false;
  int dropChance;
  int shootingTime = 0;
  boolean shooting=false;
  
  Hemobibe(int x,int y){
    this.x=x;
    this.y=y;
    this.w=50;
    this.h=50;
  }
  
  void drawHemobibe(){
    pushMatrix();
  translate(x-25,y-25);
  scale(1.0,1.0);
  
  //gun
  noStroke();
  strokeWeight(1);
  fill(147,50,52);
  rect(23,44,4,6);
  
  //thrusters
  fill(50);
  rect(0,10,6,15);
  rect(44,10,6,15);
  fill(255,0,0);
  ellipse(3,10,6,3);
  ellipse(47,10,6,3);
  fill(150,0,0);
  ellipse(3,11,4,2);
  ellipse(47,11,4,2);
  
  //body
  fill(50);
  stroke(100);
  beginShape();
    vertex(0,25);
    vertex(14,5);
    vertex(36,5);
    vertex(50,25);
    vertex(36,45);
    vertex(14,45);
  endShape();
  stroke(100);
  if(health<7)stroke(255,0,0);
  line(0,25,25,25);
  stroke(100);
  if(health<6)stroke(255,0,0);
  line(50,25,25,25);
  stroke(100);
  if(health<5)stroke(255,0,0);
  line(14,5,25,25);
  stroke(100);
  if(health<4)stroke(255,0,0);
  line(36,45,25,25);
  stroke(100);
  if(health<3)stroke(255,0,0);
  line(36,5,25,25);
  stroke(100);
  if(health<2)stroke(255,0,0);
  line(14,45,25,25);
  
  //cockpit
  fill(10,234,252);
  noStroke();
  ellipse(25,25,10,10);
  
  popMatrix();
  if(dead==false){
    if(y>-30) shootChance();
    if(shooting)shoot();
    drawBullets();
    move();
  }else{
    destroy();
  }
  dropChance();
  }
  
  void dropChance(){
    dropChance=(int)random(1,7);
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
        powerUps.add(new PowerUp(deathX,deathY,(int)random(0,8)));
      }
    }
    dead=true;
    if (deathTimer<160) {
      deathTimer++;
      if (deathTimer<81) {
        boomSize=deathTimer*.0125;
      } else if (deathTimer>80 && deathTimer<161) {
        boomSize=1-(deathTimer-80)*.0125;
        y=height+35;
      }
      explosion(deathX, deathY, boomSize);
    } else {
      dead=false;
      deathTimer=0;
    hemobibes.remove(this);
    }
  }
  
  void shootChance() {
    float rand=random(90);
    if (rand<1 && y>h/2) {
      shooting=true;
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
    y+=3;
    if (y>height+h/2) {
      y=-h;
      x=(int)random(width);
    }
    float rand = random(70);
    if (rand<5) {
      if (moveRight) {
        moveRight=false;
      } else {
        moveRight=true;
      }
    }
  }
  
  void shoot(){
    if(shootingTime<10){
      shootingTime++;
      if(shootingTime==1)bullets.add(new Bullet(x, y+h, 20, color(255,0, 0),random(-1,2)));
      if(shootingTime==5)bullets.add(new Bullet(x, y+h, 20, color(255,0, 0),random(-1,2)));
      if(shootingTime==9)bullets.add(new Bullet(x, y+h, 20, color(255,0, 0),random(-1,2)));
    }else{
      shooting=false;
      shootingTime=0;
    }
  }

  void drawBullets() {
    for (int b=0; b<bullets.size(); b++) {
      bullets.get(b).move();
      if (bullets.get(b).top>height) {
        bullets.remove(b);
      } else if (hero.isCollision(bullets.get(b))) {
        background(255, 0, 0);
        if(hero.dead==false)hero.damage(1);
        bullets.remove(b);
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
