class PowerUp{
  int type;
  int x;
  int y;
  
  PowerUp(int x, int y, int type){
    this.type=type;
    this.x=x;
    this.y=y;
  }
  
  void drawPowerUps(){
    pushMatrix();
  translate(x-25,y-25);
  scale(1.0,1.0);
  if(type==0){
    //sheild
    noStroke();
    fill(203,37,37);
    rect(5,5,40,40);
    fill(27,237,17);
    quad(25,0, 50,25, 25,50, 0,25);
    stroke(17,154,237);
    noFill();
    strokeWeight(5);
    ellipse(25,25,30,30);
  }else if(type==1){
    //health
    noStroke();
    fill(13,250,14);
    rect(0,0,50,50);
    fill(255,0,0);
    ellipse(25,25,40,40);
    fill(13,240,250);
    quad(25,10, 40,25, 25,40, 10,25);
    fill(255,255,0);
    ellipse(5,5,3,3);
    ellipse(45,45,3,3);
    ellipse(5,45,3,3);
    ellipse(45,5,3,3);
  }else if(type==2){
    //lives
    noStroke();
    fill(111,50,20);
    rect(0,0,50,50);
    fill(80);
    rect(5,5,40,40);
    fill(150);
    ellipse(20,15,17,5);
    ellipse(37,25,6,31);
    ellipse(15,30,16,15);
    ellipse(25,40,33,4);
    ellipse(26,28,5,5);
  }else if(type==3){
    //tripple ammo
    noStroke();
    fill(72,247,5);
    ellipse(25,25,40,40);
    fill(0,0,255);
    rect(10,20,4,15);
    rect(23,10,4,15);
    rect(36,20,4,15);
    fill(255,0,0);
    ellipse(25,40,10,10);
  }else if(type==4){
    //machine ammo
    noStroke();
    fill(255,0,0);
    rect(7,7,36,36);
    quad(25,0, 50,25, 25,50, 0,25);
    fill(0,0,255);
    ellipse(25,10,10,10);
    ellipse(25,25,10,10);
    ellipse(25,40,10,10);
  }else if(type==5){
    //sniper ammo
    noStroke();
    fill(0,255,0);
    rect(5,5,40,40);
    fill(0,0,255);
    ellipse(25,25,45,45);
    stroke(0,255,0);
    strokeWeight(1);
    line(45,5,5,45);
  }else if(type==6){
    //score
    noStroke();
    fill(23,142,28);
    ellipse(25,25,50,50);
    fill(0,0,255);
    rect(0,15,50,20);
    fill(255);
    textSize(19);
    textAlign(CENTER,CENTER);
    text("+500",25,22);
  }else if(type==7){
    //torpedo ammo
    noStroke();
    fill(70);
    ellipse(25,25,50,50);
    fill(150);
    ellipse(10,10,7,7);
    ellipse(10,40,7,7);
    ellipse(40,10,7,7);
    ellipse(40,40,7,7);
    stroke(0,0,255);
    strokeWeight(3);
    line(10,10,40,40);
    line(10,40,40,10);
    stroke(255);
    strokeWeight(1);
    line(10,10,40,40);
    line(10,40,40,10);
    fill(7,240,207);
    noStroke();
    ellipse(25,25,10,10); 
  }
  popMatrix();
  if(heroIsCollision())effects();
    move();
  }
  
  void effects(){
    if(type==0){
      hero.sheildTime+=300;
      powerUps.remove(this);
    }else if(type==1){
      hero.health=hero.defaultHealth;
      powerUps.remove(this);
    }else if(type==2){
      hero.lives+=2;
      powerUps.remove(this);
    }else if(type==3){
      hero.ammoTripple+=50;
      powerUps.remove(this);
    }else if(type==4){
      hero.ammoMachine+=200;
      powerUps.remove(this);
    }else if(type==5){
      hero.ammoSniper+=10;
      powerUps.remove(this);
    }else if(type==6){
      hero.score+=500;
      powerUps.remove(this);
    }else if(type==7){
      hero.ammoTorpedo++;
      powerUps.remove(this);
    }
  }
  
  void move(){
    y++;
    if(y>height+25){
      powerUps.remove(this);
    }
  }
  
  boolean heroIsCollision(){
      if(hero.x>x-50 && hero.x<x+50 && hero.y>y-50 && hero.y<y+50){
       return true; 
      }else{
      return false;
      }
    }
  
}
