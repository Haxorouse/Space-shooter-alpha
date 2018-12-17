void enterShop(){
  background(4,7,27);
  shopping=true;
}

void shop(){
  background(4,7,27);
  btnExitShop.drawButton();
  btnHealthUp.drawButton();
  btnFireRateUp.drawButton();
  btnDamageUp.drawButton();
  btnBuyTripple.drawButton();
  btnBuyBigTripple.drawButton();
  btnBuyMachine.drawButton();
  btnBuyBigMachine.drawButton();
  btnBuySniper.drawButton();
  btnBuyBigSniper.drawButton();
  
  //health
  noStroke();
  fill(95,252,5);
  for(int a=0 ;a<hero.defaultHealth; a++){
    rect(220+a*37,height*1/7,35,30);
  }
  textAlign(CENTER,CENTER);
  if(hero.defaultHealth<15){
    fill(95,252,5);
    text("$"+(int)hero.defaultHealth*100,width*.05,height*1/7+15);
  }else{
    fill(255,0,0);
    text("$----",width*.05,height*1/7+15);
  }
  
  //fire rate
  noStroke();
  fill(252,55,5);
  for(int b=0;b<(17-hero.coolDown)/2;b++){
    rect(240+b*105,height*2/7,100,30);
  }
  textAlign(CENTER,CENTER);
  if(hero.coolDown>7){
    fill(95,252,5);
    text("$"+(int)(500*(17-hero.coolDown)/2),width*.05,height*2/7+15);
  }else{
    fill(255,0,0);
    text("$----",width*.05,height*2/7+15);
  }
  
  //damage
  noStroke();
  fill(255,255,0);
  for(int c=0;c<hero.damage;c++){
    rect(215+c*190,height*3/7,180,30);
  }
  textAlign(CENTER,CENTER);
  if(hero.damage<3){
    fill(95,252,5);
    text("$"+(int)1000*hero.damage,width*.05,height*3/7+15);
  }else{
    fill(255,0,0);
    text("$----",width*.05,height*3/7+15);
  }
  
  //tripple ammo
  fill(95,252,5);
  text("$100",width*.05,height*4/7+15);
  text("$1000",width*.6,height*4/7+15);
  text("Get 10",width*.4,height*4/7+15);
  text("Get 100",width*.95,height*4/7+15);
  text("Have "+hero.ammoTripple,width*.5,height*4/7+15);
  
  //machine ammo
  fill(95,252,5);
  text("$300",width*.05,height*5/7+15);
  text("$3000",width*.6,height*5/7+15);
  text("Get 50", width*.4,height*5/7+15);
  text("Get 500", width*.95,height*5/7+15);
  text("Have "+hero.ammoMachine,width*.5,height*5/7+15);
  
  //sniper ammo
  fill(95,252,5);
  text("$500",width*.05,height*6/7+15);
  text("$5000",width*.6,height*6/7+15);
  text("Get 3", width*.4,height*6/7+15);
  text("Get 30", width*.95,height*6/7+15);
  text("Have "+hero.ammoSniper,width*.5,height*6/7+15);
  
  fill(95,252,5);
  textSize(20);
  text("You Have $ "+(int)hero.score,width/2,height*.05);
}
