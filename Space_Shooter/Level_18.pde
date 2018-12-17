void setupLvl18(){
    asteroids.clear();
  hero.y=height+25;
  for(int x =0;x<25;x++){
    enemies.add(new Enemy((int)random(width),(int)random(-1200,-80)));
    necrophites.add(new Enemy2((int)random(width),(int)random(-7200,-3600),1,3,0));
    cryomorphs.add(new Cryomorph((int)random(25,width-25),(int)random(-14400,-9600)));
    hemobibes.add(new Hemobibe((int)random(25,width-25),(int)random(-14400,-10800)));
  }
  for(int x =0;x<5;x++){
    asteroids.add(new Asteroid((int)random(25,width-25),(int)random(height),false,0));
  }
  hero.lives+=5;
  newBackground();
  starting = true;
  hero.boosters=false;
  stage=18;
}

void level18(){
  drawBackground();
  hero.drawHero();
  if(hero.y>height-80 && starting){
    fill(255);
    textSize(40);
    text("Level 18",width/2,height/2);
  }else{
    starting = false;
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
  for(int a=0;a<asteroids.size();a++){
    asteroids.get(a).drawAsteroid();
  }
  if(necrophites.size()==0 && hemobibes.size()==0 &&  enemies.size()==0 && cryomorphs.size()==0){
    if(hero.y>-25){
      hero.blastOff();
    }else{
      setupLvl19();
    }
  }
  HUD();
}
