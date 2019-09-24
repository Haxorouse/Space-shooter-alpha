ArrayList<Enemy> enemies = new ArrayList<Enemy>();
ArrayList<Asteroid> asteroids = new ArrayList<Asteroid>();

void setupLvl1(){
  enemies.clear();
  asteroids.clear();
  for(int x =0;x<15;x++){
    enemies.add(new Enemy((int)random(width),(int)random(-2000,-80)));
  }
  hero = new Hero(width/2,height+25);
  newBackground();
  hero.score=0;
  hero.lives=3;
  starting = true;
  stage=1;
  if(trackUnlocked==0){
    trackUnlocked=1;
    stageMusic.add(muLevel1);
  }
  musicHandler.levelMusic=true;
}

void level1(){
  drawBackground();
  hero.drawHero();
  if(hero.y>height-80 && starting){
    fill(255);
    textSize(40);
    text("Level 1",width/2,height/2);
  }else{
    starting = false;
  }
  for(int e =0;e<enemies.size();e++){
    enemies.get(e).drawEnemy();
    enemiesRemaning++;
  }
  for(int a=0;a<asteroids.size();a++){
    asteroids.get(a).drawAsteroid();
  }
  //if we meet the condition below, then move to level 2
  if(enemies.size()==0){
    if(hero.y>-25){
      hero.blastOff();
    }else{
      setupLvl2();
    }
  }
  HUD();
}
