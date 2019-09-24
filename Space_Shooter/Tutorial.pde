void setupTutorial(){
  hero = new Hero(width/2,height+25);
  newBackground();
  hero.score=0;
  hero.lives=3;
  hero.ammoTripple=1;
  hero.ammoMachine=5;
  hero.ammoSniper=1;
  hero.ammoTorpedo=1;
  hero.lives=12;
  starting = true;
  stage=41;
}

void tutorial1(){
  background(0);
   hero.drawHero();
  if(hero.y>height-80 && starting){
    fill(255);
    textSize(40);
    text("WELCOME!",width/2,height/2);
  }else{
    starting = false;
    stage=42;
  }
  HUD();
}

void tutorial2(){
  background(0);
   hero.drawHero();
   fill(255);
    textSize(20);
    text("Press A to move Left",width/2,height/2);
    if(currentKey==65)stage=43;
  HUD();
}

void tutorial3(){
  background(0);
   hero.drawHero();
   fill(255);
    textSize(20);
    text("Press D to move Right",width/2,height/2);
    if(currentKey==68)stage=44;
  HUD();
}

void tutorial4(){
  background(0);
   hero.drawHero();
   fill(255);
    textSize(20);
    text("Press SPACE to Fire",width/2,height/2);
    if(currentKey==32)stage=45;
  HUD();
}

void tutorial5(){
  background(0);
   hero.drawHero();
   fill(255);
    textSize(20);
    text("Press W to continue",width/2,height/2);
    textSize(12);
    text("^^Health Bar^^",730,50);
    text("Weapon Cooldown^^",700,590);
    text("Ammo Counter\\/",685,440);
    text("Selected Weapon^^",730,520);
    text("^^Live Counter\ncurrent life not counted",70,80);
    text("^^Score^^",400,80);
    text("Remaining Enemy Counter^^",680,330);
    if(currentKey==87)stage=46;
  HUD();
}

void tutorial6(){
  background(0);
   hero.drawHero();
   fill(255);
    textSize(20);
    text("Press M or N to Cycle weapon type",width/2,height/2);
    if(currentKey==77 || currentKey==78)stage=47;
  HUD();
}

void tutorial7(){
  background(0);
   hero.drawHero();
   fill(255);
    textSize(20);
    text("Select the Tripple shot weapon type",width/2,height/2);
    pushMatrix();
      translate(width/2,height*2/3);
      strokeWeight(1);
    fill(0,0,0);
    rect(7,5,5,12);
    fill(255,0,0);
    rect(8,0,3,6);
    stroke(255,255,0);
    line(9,17,9,4);
    
    noStroke();
    
    fill(0,0,0);
    rect(0,8,5,12);
    fill(255,0,0);
    rect(1,3,3,6);
    stroke(255,255,0);
    line(2,20,2,7);
    
    noStroke();
    
    fill(0,0,0);
    rect(14,8,5,12);
    fill(255,0,0);
    rect(15,3,3,6);
    stroke(255,255,0);
    line(16,20,16,7);
    popMatrix();
    if(hero.activePU==1)stage=48;
  HUD();
}

void tutorial8(){
  background(0);
   hero.drawHero();
   fill(255);
    textSize(20);
    text("This weapon will fire 3 lasers at once\nand fires at the same rate as the regular weapon",width/2,height/2);
    if(currentKey==32)stage=49;
  HUD();
}

void tutorial9(){
  background(0);
   hero.drawHero();
   fill(255);
    textSize(20);
    text("Select the Machine gun weapon type",width/2,height/2);
    pushMatrix();
      translate(width/2,height*2/3);
      strokeWeight(1);
    fill(150);
    rect(6,5,8,12);
    ellipse(10,18,8,5);
    fill(100);
    ellipse(10,5,8,5);
    fill(0);
    rect(6,5,1,1);
    rect(13,5,1,1);
    rect(8,6,1,1);
    rect(11,6,1,1);
    rect(8,3,1,1);
    rect(11,3,1,1);
    popMatrix();
    if(hero.activePU==2)stage=50;
  HUD();
}

void tutorial10(){
  background(0);
   hero.drawHero();
   fill(255);
    textSize(20);
    text("This weapon fires rapidly with a constant fire rate",width/2,height/2);
    if(currentKey==32)stage=51;
  HUD();
}

void tutorial11(){
  background(0);
   hero.drawHero();
   fill(255);
    textSize(20);
    text("Select the sniper weapon type",width/2,height/2);
    pushMatrix();
      translate(width/2,height*2/3);
      strokeWeight(1);
      fill(150);
      rect(8,12,4,8);
      fill(80);
      rect(9,0,2,13);
      fill(255,0,0);
      rect(9,0,2,2);
      stroke(80);
      line(9,6,15,0);
      line(10,6,4,0);
    popMatrix();
    if(hero.activePU==3)stage=52;
  HUD();
}

void tutorial12(){
  background(0);
   hero.drawHero();
   fill(255);
    textSize(20);
    text("Press Q or E to aim the Sniper Left or Right",width/2,height/2);
    if(currentKey==81 || currentKey==69)stage=53;
  HUD();
}

void tutorial13(){
  background(0);
   hero.drawHero();
   fill(255);
    textSize(20);
    text("This weapon fires an instantanious beam\nthat perices and kills everything in its path",width/2,height/2);
    if(currentKey==32)stage=54;
  HUD();
}

void tutorial14(){
  background(0);
   hero.drawHero();
   fill(255);
    textSize(20);
    text("now select the Torpedo weapon type",width/2,height/2);
    pushMatrix();
      translate(width/2,height*2/3);
      strokeWeight(1);
    fill(52,229,247);
    noStroke();
    ellipse(10,5,10,10);
    beginShape();
      vertex(5,5);
      vertex(15,5);
      vertex(12,12);
      vertex(10,20);
      vertex(8,12);
    endShape();
    popMatrix();
    if(hero.activePU==4)stage=55;
  HUD();
}

void tutorial15(){
  background(0);
   hero.drawHero();
   fill(255);
    textSize(20);
    text("This weapon exploads on impact with an enemy\nat the top of screen or when you choose\nthe explosion will kill everything it touches\nFire a torpedo and press C to detonate it when you choose",width/2,height/2);
    if(currentKey==32)stage=56;
  HUD();
}

void tutorial16(){
  background(0);
   hero.drawHero();
   fill(255);
    textSize(20);
    text("This weapon exploads on impact with an enemy\nat the top of screen or when you choose\nthe explosion will kill everything it touches\nFire a torpedo and press C to detonate it when you choose",width/2,height/2);
    if(currentKey==67)stage=57;
  HUD();
}

void tutorial17(){
  background(0);
   hero.drawHero();
   fill(255);
    textSize(20);
    text("Now for the enemies\nfirst up are the Pyrolings\n they move down screen slowly\nhave a low rate of fire\ndeal one damage\nand have 1 health\nPress W to Fight",width/2,height/2);
    if(currentKey==87){
      for(int e=0; e<5; e++){
        enemies.add(new Enemy((int)random(width),(int)random(-500,-80)));
      }
      stage=58;
    }
  HUD();
}

void tutorial18(){
  background(0);
   hero.drawHero();
   hero.lives=12;
   fill(255);
    textSize(20);
    for(int e =0;e<enemies.size();e++){
      enemies.get(e).drawEnemy();
      enemiesRemaning++;
    }
    for(int p=0; p<powerUps.size();p++){
      powerUps.remove(powerUps.get(p));
    }
    if(enemiesRemaning==0)stage=59;
  HUD();
}

void tutorial19(){
  background(0);
   hero.drawHero();
   fill(255);
    textSize(20);
    text("next up are the Necrophites\n they move down screen faster\nthey have a visible weapon cooldown\nthe three lights on their back progresivley turn on\nwhen all 3 are on they are ready to fire\ndeal three damage\nand have 2 health indicated by the color of the side windows\nwhen blue they have full health but when red they are down to one health\nPress W to Fight",width/2,height/2);
    if(currentKey==87){
      for(int e=0; e<5; e++){
        necrophites.add(new Enemy2((int)random(width),(int)random(-1000,-80),1,3,0));
      }
      stage=60;
    }
  HUD();
}

void tutorial20(){
  background(0);
   hero.drawHero();
   hero.lives=12;
   fill(255);
    textSize(20);
    for(int a =0;a<necrophites.size();a++){
      necrophites.get(a).drawEnemy2();
      enemiesRemaning++;
    }
    for(int p=0; p<powerUps.size();p++){
      powerUps.remove(powerUps.get(p));
    }
    if(enemiesRemaning==0)stage=61;
  HUD();
}

void tutorial21(){
  background(0);
   hero.drawHero();
   fill(255);
    textSize(20);
    text("next up are the Cryomorphs\nthey move down and across screen rapidly\nthey don't fire but inta-kill you if you come into contact with them\nthey have 4 health indicated by the greeen dots aranged along their front turing red\nPress W to Fight",width/2,height/2);
    if(currentKey==87){
      for(int e=0; e<5; e++){
        cryomorphs.add(new Cryomorph((int)random(25,width-25),(int)random(-2000,-80)));
      }
      stage=62;
    }
  HUD();
}

void tutorial22(){
  background(0);
   hero.drawHero();
   hero.lives=12;
   fill(255);
    textSize(20);
    for(int a =0;a<cryomorphs.size();a++){
      cryomorphs.get(a).drawCryomorph();
      enemiesRemaning++;
    }
    for(int p=0; p<powerUps.size();p++){
      powerUps.remove(powerUps.get(p));
    }
    if(enemiesRemaning==0)stage=63;
  HUD();
}

void tutorial23(){
  background(0);
   hero.drawHero();
   fill(255);
    textSize(20);
    text("next up are the Hemobibes\nthey move down and across the screen rapidly\nfrequently fire rapid 3 shot bursts dealing 3 damage per hit\nthey have 7 health\nindicated by the lines leading from the center to the verticies turning red\nPress W to Fight",width/2,height/2);
    if(currentKey==87){
      for(int e=0; e<5; e++){
        hemobibes.add(new Hemobibe((int)random(25,width-25),(int)random(-3000,-80)));
      }
      stage=64;
    }
  HUD();
}

void tutorial24(){
  background(0);
   hero.drawHero();
   hero.lives=12;
   fill(255);
    textSize(20);
    for(int h =0;h<hemobibes.size();h++){
      hemobibes.get(h).drawHemobibe();
      enemiesRemaning++;
    }
    for(int p=0; p<powerUps.size();p++){
      powerUps.remove(powerUps.get(p));
    }
    if(enemiesRemaning==0)stage=65;
  HUD();
}

void tutorial25(){
  background(0);
   hero.drawHero();
   fill(255);
    textSize(20);
    text("Now onto Power Ups\nPower Ups slowly scroll down screen and are collected by hitting them\nonce a Power Up scrolls off the bottom of the screen is it gone\nPress W to Continue",width/2,height/2);
    if(currentKey==87){
      stage=66;
      hero.defaultHealth=2;
    }
  HUD();
}

void tutorial26(){
  background(0);
   hero.drawHero();
   fill(255);
    textSize(20);
    if(powerUps.size()==0 && hero.health!=2){
      powerUps.add(new PowerUp(width/2,height/2,1));
    }
    text("This is the Health Power Up\nwhen collected it restores your health to full\nit is dropped by all enemies\ncollect the Power Up to Continue",width/2,height/2);
    if(hero.health==2)stage=67;
  HUD();
}

void tutorial27(){
  background(0);
   hero.drawHero();
   fill(255);
    textSize(20);
    if(powerUps.size()==0 && hero.sheildTime<=0){
      powerUps.add(new PowerUp(width/2,height/2,0));
    }
    text("This is the Shield Power Up\nwhen collected it grants you 10 seconds of invincability\nhowever Cryomorphs remove your sheild\nit is dropped by all enemies\ncollect the Power Up to Continue",width/2,height/2);
    if(hero.sheildTime>0){
      hero.lives=11;
      stage=68;
    }
  HUD();
}

void tutorial28(){
  background(0);
   hero.drawHero();
   fill(255);
    textSize(20);
    if(powerUps.size()==0 && hero.lives<12){
      powerUps.add(new PowerUp(width/2,height/2,2));
    }
    text("This is the Lives Power Up\nwhen collected it grants you 3 Lives\nit is dropped by all enemies\ncollect the Power Up to Continue",width/2,height/2);
    if(hero.lives==12)stage=69;
  HUD();
}

void tutorial29(){
  background(0);
   hero.drawHero();
   fill(255);
    textSize(20);
    if(powerUps.size()==0 && hero.ammoTripple<2){
      powerUps.add(new PowerUp(width/2,height/2,3));
    }
    text("This is the Tripple Shot Ammo Power Up\nwhen collected it grants you 50 Tripple Shot Ammo\nit is dropped by all enemies\ncollect the Power Up to Continue",width/2,height/2);
    if(hero.ammoTripple>1)stage=70;
  HUD();
}

void tutorial30(){
  background(0);
   hero.drawHero();
   fill(255);
    textSize(20);
    if(powerUps.size()==0 && hero.ammoMachine<10){
      powerUps.add(new PowerUp(width/2,height/2,4));
    }
    text("This is the Machine Gun Ammo Power Up\nwhen collected it grants you 200 Machine Gun Ammo\nit is dropped by all enemies\ncollect the Power Up to Continue",width/2,height/2);
    if(hero.ammoMachine>10)stage=71;
  HUD();
}

void tutorial31(){
  background(0);
   hero.drawHero();
   fill(255);
    textSize(20);
    if(powerUps.size()==0 && hero.ammoSniper<2){
      powerUps.add(new PowerUp(width/2,height/2,5));
    }
    text("This is the Sniper Ammo Power Up\nwhen collected it grants you 10 Sniper Ammo\nit is dropped by Necrophites and up\ncollect the Power Up to Continue",width/2,height/2);
    if(hero.ammoSniper>1){
      hero.score=0;
      stage=72;
    }
  HUD();
}

void tutorial32(){
  background(0);
   hero.drawHero();
   fill(255);
    textSize(20);
    if(powerUps.size()==0 && hero.score<100){
      powerUps.add(new PowerUp(width/2,height/2,6));
    }
    text("This is the +500 Points Power Up\nwhen collected it grants you 500 Ponts\nit is dropped Cryomorphs and Hemobibes\ncollect the Power Up to Continue",width/2,height/2);
    if(hero.score>100)stage=73;
  HUD();
}

void tutorial33(){
  background(0);
   hero.drawHero();
   fill(255);
    textSize(20);
    if(powerUps.size()==0 && hero.ammoTorpedo<1){
      powerUps.add(new PowerUp(width/2,height/2,7));
    }
    text("This is the Torpedo Ammo Power Up\nwhen collected it grants you 1 Torpedo Ammo\nit is dropped only by Hemobibes\nand in normal gameplay is the only way to obtain Torpedo Ammo\ncollect the Power Up to Continue",width/2,height/2);
    if(hero.ammoTorpedo==1)stage=74;
  HUD();
}

void tutorial34(){
  background(0);
   hero.drawHero();
   fill(255);
    textSize(20);
    text("One more thing before you go\nPress Tab to enter the pause menu and click the shop button there to enter the shop\nin the shop you can upgrade your health\nstandard weapon fire rate and damage\nand buy ammo\nnow Press W to return to the main menu and START PLAYING!!",width/2,height/2);
    if(currentKey==87)stage=0;
  HUD();
}
