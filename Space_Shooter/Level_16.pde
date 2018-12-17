void setupLvl16(){
    asteroids.clear();
  hero.y=height+25;
  for(int x =0;x<15;x++){
    necrophites.add(new Enemy2((int)random(width),(int)random(-2500,-80),1,3,0));
    hemobibes.add(new Hemobibe((int)random(25,width-25),(int)random(-4000,2700)));
  }
  hero.lives+=2;
  newBackground();
  starting = true;
  hero.boosters=false;
  stage=16;
}

void level16(){
  drawBackground();
  hero.drawHero();
  if(hero.y>height-80 && starting){
    fill(255);
    textSize(40);
    text("Level 16",width/2,height/2);
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
  if(necrophites.size()==0 && hemobibes.size()==0){
    if(hero.y>-25){
      hero.blastOff();
    }else{
      setupLvl17();
    }
  }
  HUD();
}
