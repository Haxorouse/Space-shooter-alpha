Button btnPlay;


void startScreen(){
  background(0,0,15);
  textAlign(CENTER,CENTER);
  fill(255);
  textSize(50);
  text("SPACE SHOOTER",width/2,height/3);
  btnPlay.drawButton();
  fill(255);
  textSize(25);
  text("controls",width*3/4,height/2);
  textSize(15);
  text("Left -A, Right -D",width*3/4,height/2+20);
  text("Shoot -Space, Pause -Tab",width*3/4,height/2+40);
  text("Expload Torpedo -C",width*3/4,height/2+60);
  text("Aim left -Q, Aim right -E",width*3/4,height/2+80);
}
