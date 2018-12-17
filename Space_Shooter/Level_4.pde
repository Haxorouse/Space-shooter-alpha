void setupLvl4() {
    asteroids.clear();
  hero.y=height+25;
  for (int x =0; x<30; x++) {
    necrophites.add(new Enemy2((int)random(width), (int)random(-9000, -200), 1, 3, 0));
  }
  hero.lives+=3;
  newBackground();
  starting = true;
  hero.boosters=false;
  stage=4;
}

void level4() {
  drawBackground();
  hero.drawHero();
  if (hero.y>height-80 && starting) {
    fill(255);
    textSize(40);
    text("Level 4", width/2, height/2);
  } else {
    starting = false;
  }
  for (int a =0; a<necrophites.size(); a++) {
    necrophites.get(a).drawEnemy2();
    enemiesRemaning++;
  }
  if(necrophites.size()==0){
    if(hero.y>-25){
      hero.blastOff();
    }else{
      setupLvl5();
    }
  }
  HUD();
}
