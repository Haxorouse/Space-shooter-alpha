void setupLvl5(){
    asteroids.clear();
  hero.y=height+25;
  for(int x =0;x<20;x++){
    enemies.add(new Enemy((int)random(width),(int)random(-2000,-80)));
  }
  for(int x=0;x<4;x++){
    necrophites.add(new Enemy2(width/2-20-(x*40),-30,2,3,-1));
    necrophites.add(new Enemy2(width/2+20+(x*40),-30,2,3,1));
    necrophites.add(new Enemy2(0,height/2-x*60,3,3,0));
    necrophites.add(new Enemy2(width,height/2-x*60,3,3,0));
  }
  hero.lives+=3;
  newBackground();
  starting = true;
  hero.boosters=false;
  stage=5;
}

void level5(){
  drawBackground();
  hero.drawHero();
  if(hero.y>height-80 && starting){
    fill(255);
    textSize(40);
    text("Level 5",width/2,height/2);
  }else{
    starting = false;
  }
  for(int a =0;a<necrophites.size();a++){
    necrophites.get(a).drawEnemy2();
    enemiesRemaning++;
  }
  for(int e =0;e<enemies.size();e++){
    enemies.get(e).drawEnemy();
    enemiesRemaning++;
  }
  if(necrophites.size()==0 && enemies.size()==0){
    if(hero.y>-25){
      hero.blastOff();
    }else{
      setupLvl6();
    }
  }
  HUD();
}
