void setupLvl7(){
    asteroids.clear();
  hero.y=height+25;
  for(int x =0;x<30;x++){
    cryomorphs.add(new Cryomorph((int)random(25,width-25),(int)random(-20000,-80)));
  }
  hero.lives+=4;
  newBackground();
  starting = true;
  hero.boosters=false;
  stage=7;
}

void level7(){
  drawBackground();
  hero.drawHero();
  if(hero.y>height-80 && starting){
    fill(255);
    textSize(40);
    text("Level 7",width/2,height/2);
  }else{
    starting = false;
  }
  for(int a =0;a<cryomorphs.size();a++){
    cryomorphs.get(a).drawCryomorph();
    enemiesRemaning++;
  }
  if(cryomorphs.size()==0){
    if(hero.y>-25){
      hero.blastOff();
    }else{
      setupLvl8();
    }
  }
  HUD();
}
