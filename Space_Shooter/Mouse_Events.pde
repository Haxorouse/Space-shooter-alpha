void mousePressed(){
  if(btnPlay!=null && btnPlay.mouseIsHovering()&& stage==0){
    setupLvl1();
  }
  if(btnReplay!=null && btnReplay.mouseIsHovering()&& stage==1000){
    setupLvl1();
  }
  if(btnShop.mouseIsHovering() && paused==true){
    enterShop();
    paused=false;
  }
  if(btnUnpause.mouseIsHovering()){
    paused=false;
  }
  if(btnReturnToTitle.mouseIsHovering()){
    paused=false;
    stage=0;
  }
  if(btnExitGame.mouseIsHovering())exit();
  //shop buttons
  if(shopping){
    if(btnExitShop.mouseIsHovering())shopping=false;
    if(btnHealthUp.mouseIsHovering() && hero.defaultHealth<15 && hero.score>=100*hero.defaultHealth){
      hero.score-=100*hero.defaultHealth;
      hero.defaultHealth++;
    }
    if(btnFireRateUp.mouseIsHovering() && hero.coolDown>7 && hero.score>=500*(17-hero.coolDown)/2){
      hero.score-=500*((17-hero.coolDown)/2);
      hero.coolDown-=2;
    }
    if(btnDamageUp.mouseIsHovering() && hero.damage<3 && hero.score>=1000*hero.damage){
            hero.score-=1000*hero.damage;
      hero.damage++;
    }
    if(btnBuyTripple.mouseIsHovering() && hero.score>=100){
      hero.score-=100;
      hero.ammoTripple+=10;
    }
    if(btnBuyBigTripple.mouseIsHovering() && hero.score>=1000){
      hero.score-=1000;
      hero.ammoTripple+=100;
    }
    if(btnBuyMachine.mouseIsHovering() && hero.score>=300){
      hero.score-=300;
      hero.ammoMachine+=50;
    }
    if(btnBuyBigMachine.mouseIsHovering() && hero.score>=3000){
      hero.score-=3000;
      hero.ammoMachine+=500;
    }
    if(btnBuySniper.mouseIsHovering() && hero.score>=500){
      hero.score-=500;
      hero.ammoSniper+=3;
    }
    if(btnBuyBigSniper.mouseIsHovering() && hero.score>=5000){
      hero.score-=5000;
      hero.ammoSniper+=30;
    }
  }
}
