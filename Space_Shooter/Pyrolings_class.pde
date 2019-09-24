class Enemy {
  int x;
  int y;
  int w;
  int h;
  int speed =5;
  ArrayList<Bullet> bullets = new ArrayList<Bullet>();
  boolean moveRight = true;
  int deathTimer;
  boolean dead = false;
  int deathX;
  int deathY;
  float boomSize;
  boolean dropPU = false;
  int dropChance;

  Enemy(int x, int y) {
    this.x=x;
    this.y=y;
    w=50;
    h=50;
  }

  void drawEnemy() {
     pushMatrix();
  translate(x-25,y-25);
  scale(1.0,1.0);
  
  //YOUR CODE HERE
  
  //body
  noStroke();
  fill(250,0,0);
  rect(20,10,10,30);
  
  //gun
  fill(225,238,11);
  rect(23,40,4,5);
  fill(255,0,0);
  rect(24,45,2,5);
  
  //right wing
  fill(164,18,18);
  quad(20,25,20,10,0,35,0,50);
  fill(246,204,6);
  quad(7,26,7,32,14,23,14,17);
  
  //left wing
  fill(164,18,18);
  quad(30,25,30,10,50,35,50,50);
  fill(246,204,6);
  quad(43,26,43,32,36,23,36,17);
  
  //thruster
  fill(230,143,5);
  rect(21,3,8,7);
  
  //exaust
  fill(239,8,242);
  ellipse(25,3,8,6);
  fill(172,4,235);
  ellipse(25,4,6,4);
  
  //cockpit
  fill(7,245,24);
  ellipse(25,34,7,11);
  
  //top wing
  fill(164,18,18);
  ellipse(25,20,3,40);
  
  popMatrix();
  if(dead==false){
    if(y>-30) shoot();
    drawBullets();
    move();
  }else{
    destroy();
  }
  dropChance();
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
    y++;
    if (y>height+h/2) {
      y=-h;
      x=(int)random(width);
    }
    float rand = random(300);
    if (rand<5) {
      if (moveRight) {
        moveRight=false;
      } else {
        moveRight=true;
      }
    }
  }
  
  void dropChance(){
    dropChance=(int)random(1,10);
    if(dropChance==1){
      dropPU=true;
    }else{
      dropPU=false;
    }
  }

  
  void destroy() {
    if(dead==false){
    deathX=x;
    deathY=y;
    hero.score+=10;
      if(dropPU){
        powerUps.add(new PowerUp(deathX,deathY,(int)random(0,5)));
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
    enemies.remove(this);
    }
  }
  
  
  void shoot() {
    float rand=random(75);
    if (rand<1 && y>h/2) {
      bullets.add(new Bullet(x, y+h, 20, color(255, 255, 0),0));
      pShoot.trigger();
    }
  }

  void drawBullets() {
    for (int b=0; b<bullets.size(); b++) {
      bullets.get(b).move();
      if (bullets.get(b).top>height) {
        bullets.remove(b);
      } else if (hero.isCollision(bullets.get(b))) {
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
    if(dist(t.left-2,t.top-10,x,y)<t.radius+25)return true;
    return false;
  }
}
