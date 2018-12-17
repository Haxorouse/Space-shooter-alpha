class Boss {
  int health =10000;
  int camTimer = 0;
  int patternTimer = 0;
  int attackPattern = 14;
  int attackTimer;
  int openCam = 7;
  int rand;
  int rand0;
  boolean cam1Open;
  boolean cam1Dead;
  boolean cam2Open;
  boolean cam2Dead;
  boolean cam3Open;
  boolean cam3Dead;
  boolean cam4Open;
  boolean cam4Dead;
  boolean cockPitOpen;
  boolean dead;
  boolean dieing;
  ArrayList<Bullet> bullets = new ArrayList<Bullet>();

  Boss() {
    this.attackPattern=(int)random(1, 16);
  }

  void drawBoss() {
    pushMatrix();
    translate(0, 0);
    scale(1.0, 1.0);

    //cockpit
    noStroke();
    fill(71, 236, 250);
    ellipse(400, 150, 200, 200);
    fill(165, 114, 47);
    if (cockPitOpen==false)ellipse(400, 150, 215, 215);

    //cameras
    //cam1
    if (cam1Dead) {
      stroke(50);
      strokeWeight(5);
      fill(70);
      ellipse(100, 124, 40, 40);
    } else if (cam1Open) {
      fill(0);
      noStroke();
      rect(94, 120, 13, 20);
      fill(7, 216, 222);
      stroke(0);
      strokeWeight(2);
      ellipse(100, 140, 10, 5);
    } else {
      stroke(129, 77, 8);
      strokeWeight(5);
      fill(165, 114, 47);
      ellipse(100, 124, 40, 40);
    }

    //cam 2
    if (cam2Dead) {
      stroke(50);
      strokeWeight(5);
      fill(70);
      ellipse(270, 151, 40, 40);
    } else if (cam2Open) {
      fill(0);
      noStroke();
      rect(264, 147, 13, 20);
      fill(7, 216, 222);
      stroke(0);
      strokeWeight(2);
      ellipse(270, 167, 10, 5);
    } else {
      stroke(129, 77, 8);
      strokeWeight(5);
      fill(165, 114, 47);
      ellipse(270, 151, 40, 40);
    }

    //cam 3
    if (cam3Dead) {
      stroke(50);
      strokeWeight(5);
      fill(70);
      ellipse(530, 151, 40, 40);
    } else if (cam3Open) {
      fill(0);
      noStroke();
      rect(524, 147, 13, 20);
      fill(7, 216, 222);
      stroke(0);
      strokeWeight(2);
      ellipse(530, 167, 10, 5);
    } else {
      stroke(129, 77, 8);
      strokeWeight(5);
      fill(165, 114, 47);
      ellipse(530, 151, 40, 40);
    }

    //cam 4
    if (cam4Dead) {
      stroke(50);
      strokeWeight(5);
      fill(70);
      ellipse(700, 124, 40, 40);
    } else if (cam4Open) {
      fill(0);
      noStroke();
      rect(694, 120, 13, 20);
      fill(7, 216, 222);
      stroke(0);
      strokeWeight(2);
      ellipse(700, 140, 10, 5);
    } else {
      stroke(129, 77, 8);
      strokeWeight(5);
      fill(165, 114, 47);
      ellipse(700, 124, 40, 40);
    }

    //main body
    stroke(129, 77, 8);
    strokeWeight(10);
    fill(165, 114, 47);
    ellipse(400, 0, 1000, 300);

    //turrets
    strokeWeight(1);
    noStroke();
    fill(125, 69, 10);
    ellipse(25, 0, 50, 50);
    ellipse(125, 23, 50, 50);
    ellipse(225, 33, 50, 50);
    ellipse(325, 39, 50, 50);
    ellipse(475, 39, 50, 50);
    ellipse(575, 33, 50, 50);
    ellipse(675, 23, 50, 50);
    ellipse(776, 0, 50, 50);
    rectMode(CENTER);
    fill(80);
    rect(25, 0, 30, 30, 5);
    rect(125, 23, 30, 30, 5);
    rect(225, 33, 30, 30, 5);
    rect(325, 39, 30, 30, 5);
    rect(475, 39, 30, 30, 5);
    rect(575, 33, 30, 30, 5);
    rect(675, 23, 30, 30, 5);
    rect(775, 0, 30, 30, 5);
    rectMode(CORNER);
    fill(30);
    rect(2, 0, 8, 30);
    rect(40, 0, 8, 30);
    rect(102, 23, 8, 30);
    rect(140, 23, 8, 30);
    rect(202, 33, 8, 30);
    rect(240, 33, 8, 30);
    rect(302, 39, 8, 30);
    rect(340, 39, 8, 30);
    rect(452, 39, 8, 30);
    rect(490, 39, 8, 30);
    rect(552, 33, 8, 30);
    rect(590, 33, 8, 30);
    rect(652, 23, 8, 30);
    rect(690, 23, 8, 30);
    rect(752, 0, 8, 30);
    rect(790, 0, 8, 30);

    //damage indicators
    noStroke();
    fill(500-health/20, health/20, 0);
    ellipse(400, 100, 20, 50);
    ellipse(25, 0, 10, 10);
    ellipse(125, 23, 10, 10);
    ellipse(225, 33, 10, 10);
    ellipse(325, 39, 10, 10);
    ellipse(475, 39, 10, 10);
    ellipse(575, 33, 10, 10);
    ellipse(675, 23, 10, 10);
    ellipse(775, 0, 10, 10);

    popMatrix();
    if(cam1Dead && cam2Dead && cam3Dead && cam4Dead)cockPitOpen=true;
    if (health>0) {
      cameras();
      attack();
      drawBullets();
      spawnFodder();
    }
  }

  void cameras() {
    camTimer++;
    if (camTimer>=300) {
      camTimer=0;
      openCam=(int)random(8);
      if (openCam==0) {
        cam1Open=true;
      } else {
        cam1Open=false;
      }
      if (openCam==1) {
        cam2Open=true;
      } else {
        cam2Open=false;
      }
      if (openCam==2) {
        cam3Open=true;
      } else {
        cam3Open=false;
      }
      if (openCam==3) {
        cam4Open=true;
      } else {
        cam4Open=false;
      }
    }
  }

  void attack() {
    patternTimer++;
    if (patternTimer>=600) {
      patternTimer=0;
      attackTimer=0;
      if (cockPitOpen) {
        attackPattern=(int)random(1, 11);
      } else
        attackPattern=(int)random(1, 16);
    }
    if (attackPattern==1) {
      //spawn advanced enemies
      rand=(int)random(120);
      if (rand==25)hemobibes.add(new Hemobibe(400, 200));
      if (rand==50)cryomorphs.add(new Cryomorph(400, 200));
    } else if (attackPattern==2||attackPattern==3) {
      //spawn basic eneimes
      rand=(int)random(70);
      if (rand==25)enemies.add(new Enemy(400, 200));
      if (rand==50)necrophites.add(new Enemy2(400, 200, 1, 3, 0));
    } else if (attackPattern==4||attackPattern==5||attackPattern==6) {
      //funnel shot
      attackTimer++;
      if (attackTimer==1) {
        bullets.add(new Bullet(2, 30, 15, color(255, 128, 0), 0));
        bullets.add(new Bullet(42, 30, 15, color(255, 128, 0), 0));
        bullets.add(new Bullet(792, 30, 15, color(255, 128, 0), 0));
        bullets.add(new Bullet(754, 30, 15, color(255, 128, 0), 0));
        bShoot.play();
      }
      if (attackTimer==6) {
        bullets.add(new Bullet(102, 53, 15, color(255, 128, 0), 0));
        bullets.add(new Bullet(142, 53, 15, color(255, 128, 0), 0));
        bullets.add(new Bullet(692, 53, 15, color(255, 128, 0), 0));
        bullets.add(new Bullet(654, 53, 15, color(255, 128, 0), 0));
        bShoot.play();
      }
      if (attackTimer==11) {
        bullets.add(new Bullet(202, 63, 15, color(255, 128, 0), 0));
        bullets.add(new Bullet(242, 63, 15, color(255, 128, 0), 0));
        bullets.add(new Bullet(592, 63, 15, color(255, 128, 0), 0));
        bullets.add(new Bullet(554, 63, 15, color(255, 128, 0), 0));
        bShoot.play();
        bShoot.play();
      }
      if (attackTimer==16) {
        bullets.add(new Bullet(302, 69, 15, color(255, 128, 0), 0));
        bullets.add(new Bullet(342, 69, 15, color(255, 128, 0), 0));
        bullets.add(new Bullet(492, 69, 15, color(255, 128, 0), 0));
        bullets.add(new Bullet(454, 69, 15, color(255, 128, 0), 0));
        bShoot.play();
      }
      if (attackTimer>=20) attackTimer=0;
    } else if (attackPattern==7||attackPattern==8||attackPattern==9||attackPattern==10) {
      //aggresive fire pattern
      attackTimer++;
      if (attackTimer==1 || attackTimer==5 || attackTimer==9) {
        bullets.add(new Bullet(2, 30, 15, color(255, 128, 0), 0));
        bullets.add(new Bullet(42, 30, 15, color(255, 128, 0), 0));
        bullets.add(new Bullet(202, 63, 15, color(255, 128, 0), 0));
        bullets.add(new Bullet(242, 63, 15, color(255, 128, 0), 0));
        bullets.add(new Bullet(492, 69, 15, color(255, 128, 0), 0));
        bullets.add(new Bullet(454, 69, 15, color(255, 128, 0), 0));
        bullets.add(new Bullet(692, 53, 15, color(255, 128, 0), 0));
        bullets.add(new Bullet(654, 53, 15, color(255, 128, 0), 0));
        bShoot.play();
      }
      if (attackTimer==21 || attackTimer==25 || attackTimer==29) {
        bullets.add(new Bullet(102, 53, 15, color(255, 128, 0), 0));
        bullets.add(new Bullet(142, 53, 15, color(255, 128, 0), 0));
        bullets.add(new Bullet(302, 69, 15, color(255, 128, 0), 0));
        bullets.add(new Bullet(342, 69, 15, color(255, 128, 0), 0));
        bullets.add(new Bullet(592, 63, 15, color(255, 128, 0), 0));
        bullets.add(new Bullet(554, 63, 15, color(255, 128, 0), 0));
        bullets.add(new Bullet(792, 30, 15, color(255, 128, 0), 0));
        bullets.add(new Bullet(754, 30, 15, color(255, 128, 0), 0));
        bShoot.play();
      }
      if (attackTimer>=60)attackTimer=0;
    } else {
      //passive random fire pattern
      rand=(int)random(300);
      if (rand==1) {
        bullets.add(new Bullet(2, 30, 15, color(255, 128, 0), 0));
        bullets.add(new Bullet(42, 30, 15, color(255, 128, 0), 0));
        bShoot.play();
      }
      if (rand==2) {
        bullets.add(new Bullet(202, 63, 15, color(255, 128, 0), 0));
        bullets.add(new Bullet(242, 63, 15, color(255, 128, 0), 0));
        bShoot.play();
      }
      if (rand==3) {
        bullets.add(new Bullet(492, 69, 15, color(255, 128, 0), 0));
        bullets.add(new Bullet(454, 69, 15, color(255, 128, 0), 0));
        bShoot.play();
      }
      if (rand==4) {
        bullets.add(new Bullet(692, 53, 15, color(255, 128, 0), 0));
        bullets.add(new Bullet(654, 53, 15, color(255, 128, 0), 0));
        bShoot.play();
      }
      if (rand==5) {
        bullets.add(new Bullet(102, 53, 15, color(255, 128, 0), 0));
        bullets.add(new Bullet(142, 53, 15, color(255, 128, 0), 0));
        bShoot.play();
      }
      if (rand==6) {
        bullets.add(new Bullet(302, 69, 15, color(255, 128, 0), 0));
        bullets.add(new Bullet(342, 69, 15, color(255, 128, 0), 0));
        bShoot.play();
      }
      if (rand==7) {
        bullets.add(new Bullet(592, 63, 15, color(255, 128, 0), 0));
        bullets.add(new Bullet(554, 63, 15, color(255, 128, 0), 0));
      }
      if (rand==8) {
        bullets.add(new Bullet(792, 30, 15, color(255, 128, 0), 0));
        bullets.add(new Bullet(754, 30, 15, color(255, 128, 0), 0));
        bShoot.play();
      }
    }
  }
  
  void spawnFodder(){
    rand0=(int)random(80);
    if(rand0==3)cannonFodder.add(new CannonFodder(400,200));
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
  
  void damage(int damage){
    health-=damage;
    if(health<=0){
      die();
      dieing=true;
    }
  }
  
  void die(){
    for (int f=0;f<cannonFodder.size();f++){
      cannonFodder.get(f).destroy();
    }
    for (int p=0;p<enemies.size();p++){
      enemies.get(p).destroy();
    }
    for (int n=0;n<necrophites.size();n++){
      necrophites.get(n).destroy();
    }
    for (int c=0;c<cryomorphs.size();c++){
      cryomorphs.get(c).destroy();
    }
    for (int h=0;h<hemobibes.size();h++){
      hemobibes.get(h).destroy();
    }
    dead=true;
  }
  
  boolean isCollisionCam1(Bullet b) {
    if (b.right>92 && b.left<109 && b.bottom<144 && b.top>120 && cam1Open) return true;
    return false;
  }
  boolean isCollisionCam2(Bullet b) {
    if (b.right>262 && b.left<279 && b.bottom<169 && b.top>147 && cam2Open) return true;
    return false;
  }
  boolean isCollisionCam3(Bullet b) {
    if (b.right>522 && b.left<539 && b.bottom<169 && b.top>147 && cam3Open) return true;
    return false;
  }
  boolean isCollisionCam4(Bullet b) {
    if (b.right>692 && b.left<709 && b.bottom<144 && b.top>120 && cam4Open) return true;
    return false;
  }
  boolean isCollisionCockpit(Bullet b) {
    if (dist(b.right,b.top,400,150)<100 && cockPitOpen) return true;
    return false;
  }
   boolean isExploadedCam1(Torpedo t) {
    if(dist(t.left-2,t.top-10,100,140)<t.radius && cam1Open)return true;
    return false;
  }
  boolean isExploadedCam2(Torpedo t) {
    if(dist(t.left-2,t.top-10,270,167)<t.radius && cam2Open)return true;
    return false;
  }
  boolean isExploadedCam3(Torpedo t) {
    if(dist(t.left-2,t.top-10,530,167)<t.radius && cam3Open)return true;
    return false;
  }
  boolean isExploadedCam4(Torpedo t) {
    if(dist(t.left-2,t.top-10,700,140)<t.radius && cam4Open)return true;
    return false;
  }
  boolean isExploadedCockpit(Torpedo t) {
    if(dist(t.left-2,t.top-10,400,150)<t.radius+100 && cockPitOpen)return true;
    return false;
  }
  
}
