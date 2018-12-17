void setupLvl20(){
    asteroids.clear();
  boss=(new Boss());
  hero.y=height+25;
  hero.lives+=2;
  newBackground();
  starting = true;
  hero.boosters=false;
  stage=20;
}

void level20(){
  drawBackground();
  hero.drawHero();
  if(hero.y>height-80 && starting){
    fill(255);
    textSize(40);
    text("Level 20",width/2,height/2);
  }else{
    starting = false;
  }
  for(int f =0;f<cannonFodder.size();f++){
    cannonFodder.get(f).drawCannonFodder();
    enemiesRemaning++;
  }
  for(int a =0;a<necrophites.size();a++){
    necrophites.get(a).drawEnemy2();
    enemiesRemaning++;
  }
  for(int h =0;h<hemobibes.size();h++){
    hemobibes.get(h).drawHemobibe();
    enemiesRemaning++;
  }
  for(int a =0;a<cryomorphs.size();a++){
    cryomorphs.get(a).drawCryomorph();
    enemiesRemaning++;
  }
  for(int a =0;a<enemies.size();a++){
    enemies.get(a).drawEnemy();
    enemiesRemaning++;
  }
  boss.drawBoss();
  if(boss.dead)setupWin();
  HUD();
}
