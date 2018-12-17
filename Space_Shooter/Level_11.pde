void setupLvl11(){
    asteroids.clear();
  hero.y=height+25;
  for(int x =0;x<10;x++){
    cryomorphs.add(new Cryomorph((int)random(25,width-25),(int)random(-14400,-12000)));
  }
  for(int x=0;x<20;x++){
    enemies.add(new Enemy((int)random(25,width-25),(int)random(-2000,-80)));
  }
  for(int x=0;x<20;x++){
    necrophites.add(new Enemy2((int)random(20,width-20),(int)random(-9000,-6000),1,3,0));
  }
  hero.lives+=4;
  newBackground();
  starting = true;
  hero.boosters=false;
  stage=11;
}

void level11(){
  drawBackground();
  hero.drawHero();
  if(hero.y>height-80 && starting){
    fill(255);
    textSize(40);
    text("Level 11",width/2,height/2);
  }else{
    starting = false;
  }
  for(int a =0;a<cryomorphs.size();a++){
    cryomorphs.get(a).drawCryomorph();
    enemiesRemaning++;
  }
  for(int e =0;e<enemies.size();e++){
    enemies.get(e).drawEnemy();
    enemiesRemaning++;
  }
  for(int a =0;a<necrophites.size();a++){
    necrophites.get(a).drawEnemy2();
    enemiesRemaning++;
  }
  if(cryomorphs.size()==0 && enemies.size()==0 && necrophites.size()==0){
    if(hero.y>-25){
      hero.blastOff();
    }else{
      setupLvl12();
    }
  }
  HUD();
}
