void keyPressed(){
  println(keyCode);
  //keyCode 65=a 68=d 32 = space 9 = tab [-] = 109
  if(stage!=0) hero.move(keyCode);
  currentKey=keyCode;
}

void keyReleased(){
  if(stage!=0) hero.stopHero(keyCode);
}
