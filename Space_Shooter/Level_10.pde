void setupLvl10(){
    asteroids.clear();
  hero.y=height+25;
  for(int x =0;x<5;x++){
    cryomorphs.add(new Cryomorph((int)random(25,width-25),(int)random(-7600,-6800)));
  }
  for(int x=0;x<80;x++){
    enemies.add(new Enemy((int)random(25,width-25),(int)random(-3600,-80)));
  }
  hero.lives+=4;
  newBackground();
  starting = true;
  hero.boosters=false;
  stage=10;
  if(trackUnlocked==3){
    trackUnlocked=4;
    stageMusic.add(muLevel10);
    musicHandler.interupt(muLevel10);
  }
}

void level10(){
  drawBackground();
  hero.drawHero();
  if(hero.y>height-80 && starting){
    fill(255);
    textSize(40);
    text("Level 10",width/2,height/2);
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
  if(cryomorphs.size()==0 && enemies.size()==0){
    if(hero.y>-25){
      hero.blastOff();
    }else{
      setupLvl11();
    }
  }
  HUD();
}
