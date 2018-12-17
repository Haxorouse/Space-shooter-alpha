

void setupLvl2(){
    asteroids.clear();
  hero.y=height+25;
  for(int x =0;x<15;x++){
    enemies.add(new Enemy((int)random(width),(int)random(-1300,-80)));
  }
  hero.lives+=2;
  newBackground();
  starting = true;
  hero.boosters=false;
  stage=2;
}

void level2(){
  drawBackground();
  hero.drawHero();
  if(hero.y>height-80 && starting){
    fill(255);
    textSize(40);
    text("Level 2",width/2,height/2);
  }else{
    starting = false;
  }
  for(int a =0;a<enemies.size();a++){
    enemies.get(a).drawEnemy();
    enemiesRemaning++;
  }
   if(enemies.size()==0){
    if(hero.y>-25){
      hero.blastOff();
    }else{
      setupLvl3();
    }
  }
  HUD();
}
