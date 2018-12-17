ArrayList<Enemy2> necrophites = new ArrayList<Enemy2>();

void setupLvl3(){
    asteroids.clear();
  hero.y=height+25;
  for(int x =0;x<10;x++){
    necrophites.add(new Enemy2((int)random(width),(int)random(-2500,-200),1,3,0));
  }
  hero.lives+=2;
  newBackground();
  starting = true;
  hero.boosters=false;
  stage=3;
}

void level3(){
  drawBackground();
  hero.drawHero();
  if(hero.y>height-80 && starting){
    fill(255);
    textSize(40);
    text("Level 3",width/2,height/2);
  }else{
    starting = false;
  }
  for(int a =0;a<necrophites.size();a++){
    necrophites.get(a).drawEnemy2();
    enemiesRemaning++;
  }
  if(necrophites.size()==0){
    if(hero.y>-25){
      hero.blastOff();
    }else{
      setupLvl4();
    }
  }
  HUD();
}
