void setupLvl13(){
    asteroids.clear();
  hero.y=height+25;
  for(int x =0;x<30;x++){
    hemobibes.add(new Hemobibe((int)random(25,width-25),(int)random(-12000,-80)));
  }
  hero.lives+=2;
  newBackground();
  starting = true;
  hero.boosters=false;
  stage=13;
}

void level13(){
  drawBackground();
  hero.drawHero();
  if(hero.y>height-80 && starting){
    fill(255);
    textSize(40);
    text("Level 13",width/2,height/2);
  }else{
    starting = false;
  }
  for(int h =0;h<hemobibes.size();h++){
    hemobibes.get(h).drawHemobibe();
    enemiesRemaning++;
  }
  if(hemobibes.size()==0){
    if(hero.y>-25){
      hero.blastOff();
    }else{
      setupLvl14();
    }
  }
  HUD();
}
