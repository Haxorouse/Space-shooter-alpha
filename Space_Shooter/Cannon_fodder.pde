class CannonFodder{
  int x;
  int y;
  int w;
  int h;
  int speed =2;
  ArrayList<Bullet> bullets = new ArrayList<Bullet>();
  boolean moveRight = true;
  int deathTimer;
  boolean dead = false;
  int deathX;
  int deathY;
  float boomSize;
  
  CannonFodder(int x, int y) {
    this.x=x;
    this.y=y;
    w=20;
    h=20;
  }
  
  void drawCannonFodder(){
    pushMatrix();
  translate(x-10,y-10);
  scale(1.0,1.0);
  
  //body
  noStroke();
  fill(48,175,97);
  ellipse(10,10,15,15);
  fill(114,216,154);
  stroke(114,216,154);
  strokeWeight(3);
  arc(10,10,10,10,0.50,2.67);
  line(14,10,5,10);
  strokeWeight(1);
  noStroke();
  fill(106,198,142);
  triangle(10,11,13,14,7,14);
  
  popMatrix();
  if(dead==false){
    if(y>-30) shoot();
    drawBullets();
    move();
  }else{
    destroy();
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
    y+=10;
    if (y>height+h/2) {
      y=-h;
      x=(int)random(width);
    }
    float rand = random(500);
    if (rand<5) {
      if (moveRight) {
        moveRight=false;
      } else {
        moveRight=true;
      }
    }
  }
  
  void destroy() {
    if(dead==false){
    deathX=x;
    deathY=y;
    hero.score+=10;
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
    cannonFodder.remove(this);
    }
  }
  
  
  void shoot() {
    float rand=random(100);
    if (rand<1 && y>h/2) {
      bullets.add(new Bullet(x, y+h, 20, color(255, 255, 0),0));
      fShoot.trigger();
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
    if(dist(t.left-2,t.top-10,x,y)<t.radius+10)return true;
    return false;
  }
  
}
