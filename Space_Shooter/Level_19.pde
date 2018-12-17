ArrayList<CannonFodder> cannonFodder=new ArrayList<CannonFodder>();

void setupLvl19(){
    asteroids.clear();
  hero.y=height+25;
  for(int x =0;x<200;x++){
    cannonFodder.add(new CannonFodder((int)random(width),(int)random(-10000,-80)));
  }
  for(int x =0;x<7;x++){
    asteroids.add(new Asteroid((int)random(25,width-25),(int)random(height),false,0));
  }
  hero.lives+=2;
  newBackground();
  starting = true;
  hero.boosters=false;
  stage=19;
}

void level19(){
  drawBackground();
  hero.drawHero();
  if(hero.y>height-80 && starting){
    fill(255);
    textSize(40);
    text("Level 19",width/2,height/2);
  }else{
    starting = false;
  }
  for(int f =0;f<cannonFodder.size();f++){
    cannonFodder.get(f).drawCannonFodder();
    enemiesRemaning++;
  }
  for(int a=0;a<asteroids.size();a++){
    asteroids.get(a).drawAsteroid();
  }
  if(cannonFodder.size()==0){
    if(hero.y>-25){
      hero.blastOff();
    }else{
      setupLvl20();
    }
  }
  HUD();
}
