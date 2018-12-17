ArrayList<Hemobibe> hemobibes = new ArrayList<Hemobibe>();

void setupLvl12(){
    asteroids.clear();
  hero.y=height+25;
  for(int x =0;x<10;x++){
    hemobibes.add(new Hemobibe((int)random(25,width-25),(int)random(-8000,-80)));
  }
  hero.lives+=4;
  newBackground();
  starting = true;
  hero.boosters=false;
  stage=12;
}

void level12(){
  drawBackground();
  hero.drawHero();
  if(hero.y>height-80 && starting){
    fill(255);
    textSize(40);
    text("Level 12",width/2,height/2);
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
      setupLvl13();
    }
  }
  HUD();
}
