void setupLvl15(){
    asteroids.clear();
  hero.y=height+25;
  for(int x =0;x<10;x++){
    hemobibes.add(new Hemobibe((int)random(25,width-25),(int)random(-1500,-1100)));
    cryomorphs.add(new Cryomorph((int)random(25,width-25),(int)random(-1500,-80)));
  }
  hero.lives+=3;
  newBackground();
  starting = true;
  hero.boosters=false;
  stage=15;
}

void level15(){
  drawBackground();
  hero.drawHero();
  if(hero.y>height-80 && starting){
    fill(255);
    textSize(40);
    text("Level 15",width/2,height/2);
  }else{
    starting = false;
  }
  for(int h =0;h<hemobibes.size();h++){
    hemobibes.get(h).drawHemobibe();
    enemiesRemaning++;
  }
  for(int a =0;a<cryomorphs.size();a++){
    cryomorphs.get(a).drawCryomorph();
    enemiesRemaning++;
  }
  if(hemobibes.size()==0 && cryomorphs.size()==0){
    if(hero.y>-25){
      hero.blastOff();
    }else{
      setupLvl16();
    }
  }
  HUD();
}
