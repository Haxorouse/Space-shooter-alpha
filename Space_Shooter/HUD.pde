void HUD(){
  
  int activePU=hero.activePU;
  
 HUDFont=createFont("Monotxt_IV50-15.vlw",15);
  
  //health bar
  noFill();
  stroke(31,38,147);
  strokeWeight(5);
  rect(width-120,20,100,20);
  fill((100-hero.percentHealth)*5, 5*hero.percentHealth,0);
  noStroke();
  rect(width-120,20,hero.percentHealth,20);
  
  //wepon cool down
  noFill();
  stroke(31,38,147);
  strokeWeight(5);
  rect(width-120,height-25,100,5);
  noStroke();
  fill(255,0,0);
  if(hero.activePU==0 || hero.activePU==1 || hero.activePU==2){
  rect(width-120,height-25,hero.coolDownPercent,5);
  }else if(hero.activePU==3){
    rect(width-120,height-25,hero.coolDownPercentS,5);
  }else if(hero.activePU==4){
    rect(width-120,height-25,hero.coolDownPercentT,5);
  }
  
  //ammo counter
  noFill();
  stroke(255-5*(hero.ammo),5*hero.ammo,0);
  strokeWeight(7);
  ellipse(width-70,height*4/5,50,50);
  textSize(15);
  fill(255);
  textAlign(CENTER,CENTER);
  text(hero.ammo,width-70,height*4/5);
  
  //lives counter
  stroke(31,38,147);
  strokeWeight(5);
  if(hero.lives>=12){
      hero.lives=12;
    }
  fill(500-50*hero.lives,hero.lives*50,0);
    rect(5,25,(hero.lives*25)+10,35);
  for(int l=0;l<hero.lives;l++){
    pushMatrix();
  translate(l*25+10,30);
  scale(.5,.5);
  
  //left gun
  noStroke();
  fill(0,0,0);
  rect(7,25,5,12);
  fill(254,0,12);
  rect(8,15,3,11);
  stroke(254,239,0);
  strokeWeight(1);
  line(9,24,9,42);
  noStroke();
  
  //right gun
  fill(0,0,0);
  rect(38,25,5,12);
  fill(254,0,12);
  rect(39,15,3,11);
  stroke(254,239,0);
  strokeWeight(1);
  line(40,24,41,42);
  noStroke();
  
  
  //body
  fill(163,185,217);
  triangle(10,42,40,42,25,0);
  
  //cockpit
  fill(115,244,236);
  ellipse(25,17,5,10);
  
  //left wing
  fill(163,185,217);
  triangle(0,20,4,42,15,42);
  
  //right wing
  fill(163,185,217);
  triangle(50,20,46,42,35,42);
  
  //thrusters
  fill(0,0,0);
  rect(15,40,6,8);
  rect(29,40,6,8);
  
  //exaust
  fill(249,164,1);
  ellipse(18,48,6,4);
  ellipse(32,48,6,4);
  fill(255,0,0);
  ellipse(18,47,3,2);
  ellipse(32,47,3,2);
  
  //detailing
  fill(193,0,0);
  triangle(21,41,25,25,29,41);
  
  popMatrix();
  }
  
  //enemy counter
  fill(31,38,147);
  noStroke();
  rectMode(CENTER);
  rect(width-50,height/2,60,20);
  rectMode(CORNER);
  textAlign(CENTER,CENTER);
  fill(255);
  text(enemiesRemaning,width-50,height/2-2);
  
  //score
  fill(31,38,147);
  rect(width/2-40,50,80,20);
  textAlign(CENTER,CENTER);
  fill(255);
  text(hero.score,width/2,57);
  
  //weapon type display
  noStroke();
  fill(31,38,147);
  ellipse(width-20,height*4/5,40,40);
  pushMatrix();
  translate(width-30,height*4/5-10);
  scale(1.0,1.0);
  
  noStroke();
  
  if(activePU==0){
    strokeWeight(1);
    fill(0,0,0);
    rect(7,8,5,12);
    fill(255,0,0);
    rect(8,3,3,6);
    stroke(255,255,0);
    line(9,20,9,7);
  }else if(activePU==1){
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
  }else if(activePU==2){
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
  }else if(activePU==3){
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
  }else if(activePU==4){
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
  }
      
  popMatrix();
}
