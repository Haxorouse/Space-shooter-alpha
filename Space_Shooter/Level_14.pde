void setupLvl14(){
    asteroids.clear();
  hero.y=height+25;
  for(int x =0;x<10;x++){
    hemobibes.add(new Hemobibe((int)random(25,width-25),(int)random(-600,-80)));
    hemobibes.add(new Hemobibe((int)random(25,width-25),(int)random(-8100,-7500)));
  }
  for(int x=0;x<50;x++){
    enemies.add(new Enemy((int)random(25,width-25),(int)random(-2500,-200)));
  }
  hero.lives+=3;
  newBackground();
  starting = true;
  hero.boosters=false;
  stage=14;
}

void level14(){
  drawBackground();
  hero.drawHero();
  if(hero.y>height-80 && starting){
    fill(255);
    textSize(40);
    text("Level 14",width/2,height/2);
  }else{
    starting = false;
  }
  for(int h =0;h<hemobibes.size();h++){
    hemobibes.get(h).drawHemobibe();
    enemiesRemaning++;
  }
  for(int a =0;a<enemies.size();a++){
    enemies.get(a).drawEnemy();
    enemiesRemaning++;
  }
  if(hemobibes.size()==0 && enemies.size()==0){
    if(hero.y>-25){
      hero.blastOff();
    }else{
      setupLvl15();
    }
  }
  HUD();
}
