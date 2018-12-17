class Hero {
  int x;
  int y;
  int w;
  int h;
  int speed = 8;
  boolean moveLeft = false;
  boolean moveRight = false;
  ArrayList<Bullet> bullets = new ArrayList<Bullet>();
  ArrayList<Torpedo> torpedos = new ArrayList<Torpedo>();
  int baseY = height-80;
  boolean regenerating = false;
  boolean canShoot=true;
  int lives=3;
  int score=0;
  int activePU = 0;
  float coolDown = 15;
  float shootTimer = coolDown;
  int shootTimerS = 180;
  int shootTimerT = 600;
  boolean boosters = false;
  float health;
  float defaultHealth = 1;
  float percentHealth;
  boolean shooting = false;
  int ammo = 9999;
  int ammoTripple = 10;
  int ammoMachine = 30;
  int ammoSniper = 2;
  int ammoTorpedo = 0;
  float currentCoolDown = coolDown;
  float coolDownPercent;
  float coolDownPercentS;
  float coolDownPercentT;
  int deathTimer;
  boolean dead = false;
  int deathX;
  int deathY;
  float boomSize;
  int sniperAim=0;
  boolean aimLeft = false;
  boolean aimRight = false;
  boolean sniping = false;
  int snipeTimer = 0;
  int snipeSize = 1;
  int snipeSpeed = 50;
  boolean torpedosExpload = false;
  int damage=1;
  int sheildTime = 0;

  Hero(int x, int y) {
    this.x=x;
    this.y=y;
    w=50;
    h=50;
  }

  void drawHero() {
    percentHealth = health/defaultHealth*100;
    if (percentHealth<0)percentHealth=0;
    if (dead==false) {
      if (y>baseY) {
        regenerating=true;
        health=defaultHealth;
        y--;
      } else {
        regenerating=false;
      }
      if (moveRight && x+w/2<width) x+=speed;
      if (moveLeft && x-w/2>0) x-=speed;
    }
    pushMatrix();
    translate(x-25, y-25);
    scale(1.0, 1.0);
    strokeWeight(1);

    //left gun
    noStroke();
    fill(0, 0, 0);
    rect(7, 25, 5, 12);
    fill(254, 0, 12);
    rect(8, 15, 3, 11);
    stroke(254, 239, 0);
    line(9, 24, 9, 40);
    noStroke();

    //right gun
    fill(0, 0, 0);
    rect(38, 25, 5, 12);
    fill(254, 0, 12);
    rect(39, 15, 3, 11);
    stroke(254, 239, 0);
    line(40, 24, 41, 40);
    noStroke();


    //body
    fill(163, 185, 217);
    triangle(10, 42, 40, 42, 25, 0);

    //cockpit
    fill(115, 244, 236);
    ellipse(25, 17, 5, 10);

    //left wing
    fill(163, 185, 217);
    triangle(0, 20, 4, 42, 15, 42);

    //right wing
    fill(163, 185, 217);
    triangle(50, 20, 46, 42, 35, 42);

    //thrusters
    fill(0, 0, 0);
    rect(15, 40, 6, 8);
    rect(29, 40, 6, 8);

    //exaust
    if (boosters) {
      fill(249, 164, 1);
      ellipse(18, 48, 10, 6);
      ellipse(32, 48, 10, 6);
      fill(255, 0, 0);
      ellipse(18, 47, 5, 3);
      ellipse(32, 47, 5, 3);
      fill(255, 0, 0);
      ellipse(18, 51, 8, 4);
      ellipse(32, 51, 8, 4);
      fill(249, 164, 1);
      ellipse(18, 53, 6, 4);
      ellipse(32, 53, 6, 4);
      fill(255, 0, 0);
      ellipse(18, 55, 4, 4);
      ellipse(32, 55, 4, 4);
      fill(249, 164, 1);
      ellipse(18, 58, 2, 6);
      ellipse(32, 58, 2, 6);
    } else {
      fill(249, 164, 1);
      ellipse(18, 48, 6, 4);
      ellipse(32, 48, 6, 4);
      fill(255, 0, 0);
      ellipse(18, 47, 3, 2);
      ellipse(32, 47, 3, 2);
    }

    //detailing
    fill(193, 0, 0);
    triangle(21, 41, 25, 25, 29, 41);

    //sheild
    if (sheildTime>0) {
      stroke(51, 219, 240);
      strokeWeight(8);
      noFill();
      ellipse(25, 25, 70, 70);
      strokeWeight(1);
    }

    popMatrix();
    if (shooting) shoot();
    drawBullets();
    if (lives<0) {
      setupEnd();
    }
    coolDownPercent=100-((100/currentCoolDown)*(currentCoolDown-(coolDown-shootTimer)));
    coolDownPercentS=100-(shootTimerS/1.8);
    coolDownPercentT=100-(shootTimerT/6);
    if (coolDownPercent<0) coolDownPercent=0;

    if (activePU==0) {
      ammo=9999;
    } else if (activePU==1) {
      ammo=ammoTripple;
    } else if (activePU==2) {
      ammo=ammoMachine;
    } else if (activePU==3) {
      ammo=ammoSniper;
    } else if (activePU==4) {
      ammo=ammoTorpedo;
    }
    if (dead) {
      destroy();
      shooting=false;
    }
    aim();
    if (sniping)snipe();
    powerUps();
    sheild();
  }

  void move(int code) {

    if (code==68) moveRight=true;
    if (code==65) moveLeft=true;
    if (code==32 && dead==false) shooting = true;
    if (code==9 && paused==false) { 
      startPause();
      shopping=false;
    } else {
      paused=false;
    }
    if (code==140) {
      enemies.clear();
      necrophites.clear();
      cryomorphs.clear();
      hemobibes.clear();
      cannonFodder.clear();
    }
    if (code==139)score+=100;
    if (code==10) {
      defaultHealth=1000;
      damage=1000;
      ammoTripple=10000;
      ammoMachine=10000;
      ammoSniper=10000;
      ammoTorpedo=10000;
      lives=12;
      health=1000;
      coolDown=5;
    }
    if (code==77) {
      activePU++;
      canShoot=false;
    }
    if (code==78) {
      activePU--;
      canShoot=false;
    }
    if (activePU>4) activePU=0;
    if (activePU<0) activePU=4;
    if (code==81) aimLeft=true;
    if (code==69) aimRight=true;
    if (code==67) torpedosExpload=true;
  }

  void stopHero(int code) {
    if (code==68) moveRight=false;
    if (code==65) moveLeft=false;
    if (code==32) shooting=false;
    if (code==81) aimLeft=false;
    if (code==69) aimRight=false;
    if (code==67) torpedosExpload=false;
  }

  void powerUps() {
    for (int p=0; p<powerUps.size(); p++) {
      powerUps.get(p).drawPowerUps();
    }
  }

  void shoot() {
    if (regenerating==false && canShoot==true && y==height-80) {    
      if (activePU==0) {
        //basic gun
        currentCoolDown=coolDown;
        bullets.add(new Bullet(x-2, y-h/2+1, -15, color(0, 0, 255), 0));
        canShoot=false;
        shootTimer=0;
      } else if (activePU==1 && ammoTripple>0) {
        //tripple shot
        currentCoolDown=coolDown;
        bullets.add(new Bullet(x-w/3-2, y-10, -14, color(0, 0, 255), -1));
        bullets.add(new Bullet(x+w/3-2, y-10, -14, color(0, 0, 255), 1));
        bullets.add(new Bullet(x-2, y-h/2+1, -15, color(0, 0, 255), 0));
        canShoot=false;
        shootTimer=0;
        ammoTripple--;
      } else if (activePU==2 && ammoMachine>0) {
        //machine gun
        currentCoolDown=4;
        bullets.add(new Bullet(x-2, y-h/2+1, -15, color(0, 0, 255), 0)); 
        canShoot=false;
        shootTimer=coolDown-4;
        ammoMachine--;
      } else if (activePU==3 && ammoSniper>0) {
        //sniper
        currentCoolDown=180;
        sniping=true;
        for (int b=0; b<200; b++) {
          bullets.add(new Bullet((x-2)+(4*b*sin(radians(sniperAim))), (y-h/2+1)-(3*b*cos(radians(sniperAim)))+1000, -1000, color(255, 0, 0), 0));
        }
        shootTimerS=0;
        ammoSniper--;
        canShoot=false;
      } else if (activePU==4 && ammoTorpedo>0) {
        //torpedo
        canShoot=false;
        currentCoolDown=600;
        torpedos.add(new Torpedo(x-5, y-h/2+1, -5, color(52, 229, 247), 0));
        shootTimerT=0;
        ammoTorpedo--;
      }
    }
  }

  void aim() {
    if (aimLeft)sniperAim-=1;
    if (aimRight)sniperAim+=1;
    if (sniperAim>90) sniperAim=90;
    if (sniperAim<-90) sniperAim=-90;
    snipeSpeed=50/abs((sniperAim/600)+1);
    if (activePU==3 && dead==false && regenerating==false) {
      stroke(0, 255, 0);
      strokeWeight(1);
      line(x, y-h/2, x+(800*sin(radians(sniperAim))), y-h/2-(600*cos(radians(sniperAim))));
    }
  }

  void snipe() {
    if (snipeTimer<20) {
      if (snipeTimer<10) {
        snipeSize++;
      } else {
        snipeSize--;
      }
      stroke(255, 0, 0);
      strokeWeight(snipeSize);
      line(x, y-h/2, x+(800*sin(radians(sniperAim))), y-h/2-(600*cos(radians(sniperAim))));
      snipeTimer++;
    } else {
      snipeTimer=0;
      sniping=false;
    }
  }

  void blastOff() {
    y-=8;
    fill(255);
    textSize(40);
    text("Level Cleared", width/2, height/2);
    boosters=true;
  }

  void drawBullets() {
    if (canShoot==false) {
      if (activePU==0 || activePU==1 || activePU==2) {
        if (shootTimer>coolDown) canShoot=true;
        shootTimer++;
      } else if (activePU==3) {
        if (shootTimerS>=180) canShoot=true;
        else shootTimerS++;
      } else if (activePU==4) {
        if (shootTimerT>=600) canShoot=true;
        shootTimerT++;
      }
    }
    for (int b=0; b<bullets.size(); b++) {
      bullets.get(b).move();
      if (enemies.size()>0) {
        for (int e =0; e<enemies.size(); e++) {
          Enemy enemy = enemies.get(e);
          if (bullets.get(b).top<-15) {
            bullets.remove(b);
            break;
          } else if (enemy.isCollision(bullets.get(b))) {
            background(0, 0, 255);
            enemy.destroy();
            bullets.remove(b);
            break;
          }
        }
      }
      if (necrophites.size()>0) {
        for (int n =0; n<necrophites.size(); n++) {
          Enemy2 necrophite = necrophites.get(n);
          if (b<bullets.size() && bullets.get(b)!=null && bullets.get(b).top<-15) {
            bullets.remove(b);
            break;
          } else if (b<bullets.size() && bullets.get(b)!=null && necrophite.isCollision(bullets.get(b))) {
            background(0, 0, 255);
            necrophite.damage(damage);
            bullets.remove(b);
            break;
          }
        }
      }
      if (cryomorphs.size()>0) {
        for (int c =0; c<cryomorphs.size(); c++) {
          Cryomorph cryomorph = cryomorphs.get(c);
          if (b<bullets.size() && bullets.get(b)!=null && bullets.get(b).top<-15) {
            bullets.remove(b);
            break;
          } else if (b<bullets.size() && bullets.get(b)!=null && cryomorph.isCollision(bullets.get(b))) {
            background(0, 0, 255);
            cryomorph.damage(damage);
            bullets.remove(b);
            break;
          }
        }
      }
      if (hemobibes.size()>0) {
        for (int h =0; h<hemobibes.size(); h++) {
          Hemobibe hemobibe = hemobibes.get(h);
          if (b<bullets.size() && bullets.get(b)!=null && bullets.get(b).top<-15) {
            bullets.remove(b);
            break;
          } else if (b<bullets.size() && bullets.get(b)!=null && hemobibe.isCollision(bullets.get(b))) {
            background(0, 0, 255);
            hemobibe.damage(damage);
            bullets.remove(b);
            break;
          }
        }
      }
      if (cannonFodder.size()>0) {
        for (int f =0; f<cannonFodder.size(); f++) {
          CannonFodder fodder = cannonFodder.get(f);
          if (b<bullets.size() && bullets.get(b)!=null && bullets.get(b).top<-15) {
            bullets.remove(b);
            break;
          } else if (b<bullets.size() && bullets.get(b)!=null && fodder.isCollision(bullets.get(b))) {
            background(0, 0, 255);
            fodder.destroy();
            bullets.remove(b);
            break;
          }
        }
      }
      if (asteroids.size()>0) {
        for (int a=0; a<asteroids.size(); a++) {
          Asteroid asteroid = asteroids.get(a);
          if (b<bullets.size() && bullets.get(b)!=null && asteroid.isCollision(bullets.get(b)) && asteroid.isSmall) {
            bullets.remove(b);
            asteroid.heat+=(10*damage);
            break;
          }else if(b<bullets.size() && bullets.get(b)!=null && asteroid.isCollision(bullets.get(b))){
            bullets.remove(b);
            break;
          }
        }
      }
      if (stage==20) {
        if (b<bullets.size() && bullets.get(b)!=null && boss.isCollisionCam1(bullets.get(b))) {
          boss.cam1Dead=true;
          bullets.remove(b);
        }
        if (b<bullets.size() && bullets.get(b)!=null && boss.isCollisionCam2(bullets.get(b))) {
          boss.cam2Dead=true;
          bullets.remove(b);
        }
        if (b<bullets.size() && bullets.get(b)!=null && boss.isCollisionCam3(bullets.get(b))) {
          boss.cam3Dead=true;
          bullets.remove(b);
        }
        if (b<bullets.size() && bullets.get(b)!=null && boss.isCollisionCam4(bullets.get(b))) {
          boss.cam4Dead=true;
          bullets.remove(b);
        }
        if (b<bullets.size() && bullets.get(b)!=null && boss.isCollisionCockpit(bullets.get(b)) && boss.health>0) {
          boss.damage(damage);
          bullets.remove(b);
        }
      }
    }
    for (int t=0; t<torpedos.size(); t++) {
      if (torpedos.get(t).exploading==false)torpedos.get(t).move();
      if (torpedos.get(t).exploading)torpedos.get(t).expload();
      if (torpedosExpload) {
        torpedos.get(t).expload();
      }
      if (torpedos.get(t).top<-20)torpedos.remove(this);
      if (enemies.size()>0) {
        for (int e =0; e<enemies.size(); e++) {
          Enemy enemy = enemies.get(e);
          if (enemy.isExploaded(torpedos.get(t))) {
            enemy.destroy();
            break;
          }
        }
      }
      if (necrophites.size()>0) {
        for (int n =0; n<necrophites.size(); n++) {
          Enemy2 necrophite = necrophites.get(n);
          if (t<torpedos.size() && torpedos.get(t)!=null && necrophite.isExploaded(torpedos.get(t))) {
            necrophite.damage(1);
            break;
          }
        }
      }
      if (cryomorphs.size()>0) {
        for (int c =0; c<cryomorphs.size(); c++) {
          Cryomorph cryomorph = cryomorphs.get(c);
          if (t<torpedos.size() && torpedos.get(t)!=null && cryomorph.isExploaded(torpedos.get(t))) {
            cryomorph.damage(1);
            break;
          }
        }
      }
      if (hemobibes.size()>0) {
        for (int h =0; h<hemobibes.size(); h++) {
          Hemobibe hemobibe = hemobibes.get(h);
          if (t<torpedos.size() && torpedos.get(t)!=null && hemobibe.isExploaded(torpedos.get(t))) {
            hemobibe.damage(1);
            break;
          }
        }
      }
      if (cannonFodder.size()>0) {
        for (int f =0; f<cannonFodder.size(); f++) {
          CannonFodder fodder = cannonFodder.get(f);
          if (t<torpedos.size() && torpedos.get(t)!=null && fodder.isExploaded(torpedos.get(t))) {
            background(0, 0, 255);
            fodder.destroy();
            break;
          }
        }
      }
      if (asteroids.size()>0) {
        for (int a=0; a<asteroids.size(); a++) {
          Asteroid asteroid = asteroids.get(a);
          if (t<torpedos.size() && torpedos.get(t)!=null && asteroid.isExploaded(torpedos.get(t))) {
            if(asteroid.isSmall==false){
              asteroid.shatter();
            }
            asteroids.remove(asteroid);
          }
        }
      }
      if (stage==20) {
        if (t<torpedos.size() && torpedos.get(t)!=null && boss.isExploadedCockpit(torpedos.get(t))) {
          boss.damage(3);
        } 
        if (t<torpedos.size() && torpedos.get(t)!=null && boss.isExploadedCam1(torpedos.get(t))) {
          boss.cam1Dead=true;
        }
        if (t<torpedos.size() && torpedos.get(t)!=null && boss.isExploadedCam2(torpedos.get(t))) {
          boss.cam2Dead=true;
        }
        if (t<torpedos.size() && torpedos.get(t)!=null && boss.isExploadedCam3(torpedos.get(t))) {
          boss.cam3Dead=true;
        }
        if (t<torpedos.size() && torpedos.get(t)!=null && boss.isExploadedCam4(torpedos.get(t))) {
          boss.cam4Dead=true;
        }
      }
      if (torpedos.get(t).done)torpedos.remove(t);
    }
  }

  void damage(int damage) {
    if (sheildTime<=0 && health>0) {
      health-=damage;
      if (health<1) {
        destroy();
        deathX=x;
        deathY=y;
      }
    }
  }

  void destroy() {
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
      lives--;
    }
  }


  void sheild() {
    if (sheildTime>0) {
      sheildTime--;
    }
  }

  boolean isCollision(Bullet b) {
    if (regenerating==false && b.right>x-w/2 && b.left<x+w/2 && b.bottom>y-h/2 && b.top<y+h/2) {
      return true;
    }
    return false;
  }
}
