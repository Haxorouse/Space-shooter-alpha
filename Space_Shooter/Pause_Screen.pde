void startPause(){
  noStroke();
  fill(90,90,90,200);
  rect(-1,-1,width+2,height+2);
  paused=true;
}

void pause(){
  stroke(50);
  strokeWeight(5);
  fill(90);
  rect(width/3,height/4,width/3,height/2,30);
  btnShop.drawButton();
  btnUnpause.drawButton();
  btnReturnToTitle.drawButton();
  btnExitGame.drawButton();
}
