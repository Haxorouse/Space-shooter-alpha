void setupWin(){
  btnReplay = new Button(width/2-60,height/2,120,30,"Play Again?");
  stage=999;
  print("won");
}

void winScreen(){
  background(0);
  fill(255);
  textSize(40);
  text("YOU WIN", width/2,height/3);
  text("Your Final Score"+hero.score,width/2,height/3+40);
  btnReplay.drawButton();
}
