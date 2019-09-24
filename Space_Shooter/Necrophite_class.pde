class Enemy2 {
  int x;
  int y;
  int w;
  int h;
  int speed;
  ArrayList<Bullet> bullets = new ArrayList<Bullet>();
  int pattern;
  int direction;
  int changeTimer=0;
  int health = 2;
  boolean moveRight = true;
  int fireCoolDown = (int)random(151);
  boolean first = true;
  int deathTimer;
  boolean dead = false;
  int deathX;
  int deathY;
  float boomSize;
  int startDir;
  boolean dropPU = false;
  int dropChance;

  Enemy2(int x, int y, int pattern, int speed, int startDir) {
    this.x=x;
    this.y=y;
    this.pattern=pattern;
    this.speed=speed;
    this.startDir=startDir;
    w=40;
    h=60;
    if(startDir==-1)moveRight=false;
  }

  void drawEnemy2() {
    pushMatrix();
    translate(x-20, y-30);
    scale(1.0, 1.0);

    //windows
    if (health<2) {
      fill(248, 4, 4);
    } else {
      fill(3, 234, 248);
    }
    noStroke();
    ellipse(20, 55, 10, 10);
    ellipse(8, 15, 10, 10);
    ellipse(6, 30, 10, 10);
    ellipse(8, 45, 10, 10);
    ellipse(32, 15, 10, 10);
    ellipse(34, 30, 10, 10);
    ellipse(32, 45, 10, 10);

    //thrusters
    fill(0, 15, 126);
    rect(10, 2, 6, 20);
    rect(24, 2, 6, 20);

    //exaust
    fill(82, 255, 6);
    ellipse(13, 2, 6, 4);
    ellipse(27, 2, 6, 4);
    fill(6, 142, 18);
    ellipse(13, 3, 4, 2);
    ellipse(27, 3, 4, 2);

    //body
    fill(42, 3, 101);
    noStroke();
    rect(10, 10, 20, 40);
    ellipse(10, 30, 10, 40);
    ellipse(30, 30, 10, 40);
    ellipse(20, 10, 20, 10);
    ellipse(20, 50, 20, 10);

    //cannon
    fill(238, 7, 235);
    rect(19, 52, 2, 8);

    //needles
    //stroke(106,5,231);
    if(fireCoolDown<110){
    stroke(238, 7, 235);
    }else{
    stroke(106, 5, 231);
    }
    strokeWeight(3);
    line(16, 44, 10, 37);
    line(24, 44, 30, 37);
    if(fireCoolDown<70){
    stroke(238, 7, 235);
    }else{
    stroke(106, 5, 231);
    }
    line(16, 34, 10, 27);
    line(24, 34, 30, 27);
    if(fireCoolDown<30){
    stroke(238, 7, 235);
    }else{
    stroke(106, 5, 231);
    }
    line(16, 24, 10, 17);
    line(24, 24, 30, 17);


    popMatrix();
    if(dead==false){
      move();
      drawBullets();
      shoot();
    }else{
      destroy();
    }
    dropChance();
  }

  void move() {
    if (pattern==1) {
      changeTimer--;
      if (changeTimer<0) {
        direction=(int)random(1, 6);
        changeTimer=300;
      }
      if (direction==1) {
        //left fast
        y+=speed;
        x-=speed;
      } else if (direction==2) {
        //left slow
        y+=speed;
        x-=speed/2;
      } else if (direction==3) {
        //forward
        y+=speed;
      } else if (direction==4) {
        //right slow
        y+=speed;
        x+=speed/2;
      } else if (direction==5) {
        //right fast
        y+=speed;
        x+=speed;
      }
      if (x-20<0) direction = 5;
      if (x+20>width) direction = 1;
      if (y-30>height) y=-80;
    } else if (pattern==2) {
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
      y+=speed;
      if (y>height+h/2) {
        y=-h;
      }
    } else if (pattern==3) {
      changeTimer--;
      if(first){
        direction=0;
        first=false;
      }else{
        if (changeTimer<0){
          if(direction==6){
            direction=1;
          }else{
            direction++;
          }
          changeTimer=90;
        }
          
          y+=speed*2/3;
          
          if(direction==1){
            //down right
            y+=speed/3;
            x+=speed/3;
          }else if(direction==2){
            //down left
            y+=speed/3;
            x-=speed/3;
          }else if(direction==3){
            //left
            x-=speed/3;
          }else if(direction==4){
            //up left
            y-=speed/3;
            x-=speed/3;
          }else if(direction==5){
            //up right
            y-=speed/3;
            x+=speed/3;
          }else if(direction==6){
            //right
            x+=speed/3;
          }
          
        }
        if (y>height+h/2) {
        y=-h;
      }
      }
      
      
    }
  

  void damage(int damage) {
    int temp=health;
    health-=damage;
    if(dead==false && damage<=temp){
      hero.score+=10*damage;
    }else hero.score+=temp*10;
    if (health<1) {
      destroy();
    }
  }
  
  void destroy() {
    if(dead==false){
    deathX=x;
    deathY=y;
    if(dropPU){
        powerUps.add(new PowerUp(deathX,deathY,(int)random(0,6)));
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
    necrophites.remove(this);
    }
  }
  
  void dropChance(){
    dropChance=(int)random(1,9);
    if(dropChance==1){
      dropPU=true;
    }else{
      dropPU=false;
    }
  }
  
  void shoot(){
    if(y>0-h){
      fireCoolDown--;
      if(fireCoolDown==30)nShoot.trigger();
        if(fireCoolDown<0){
          fireCoolDown=150;
          bullets.add(new Bullet(x, y+h, 20, color(238, 7, 235),0));
        }
    }
  }
  
   void drawBullets() {
     noStroke();
    for (int b=0; b<bullets.size(); b++) {
      bullets.get(b).move();
      if (bullets.get(b).top>height) {
        bullets.remove(b);
      } else if (hero.isCollision(bullets.get(b))) {
        if(hero.dead==false)hero.damage(3);
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
