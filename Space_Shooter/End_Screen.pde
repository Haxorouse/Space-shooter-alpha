Button btnReplay;

void setupEnd(){
  btnReplay = new Button(width/2-60,height/2,120,30,"Play Again?");
  stage=1000;
}

void endScreen(){
  background(0);
  fill(255);
  textSize(40);
  text("GAME OVER", width/2,height/3);
  btnReplay.drawButton();
}
