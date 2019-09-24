class MusicHandler {
  
  int trackPlaying = 0;
  boolean levelMusic = false;
  int hold = 0;
  
   MusicHandler(){
     
   }

  void mainMenuMusic(){
    muMainMenu.loop();
    for(int m=0;m<stageMusic.size();m++){
      if(stageMusic.get(m).isPlaying())stageMusic.get(m).stop();
    }
    if(muBoss.isPlaying())muBoss.stop();
    if(muBossLoop.isPlaying())muBossLoop.stop();
    //if(muFinalBoss.isPlaying())muFinalBoss.stop();
    //if(muWin.isPlaying())muWin.stop();
    if(muTutorial.isPlaying())muTutorial.stop();
  }
  
  void play(){
    if(hold<0){
    if((stage>=1 && stage<=19) || (stage>=21 && stage<=39)){
      if(muBoss.isPlaying())muBoss.stop();
      if(muBossLoop.isPlaying())muBossLoop.stop();
      //if(muFinalBoss.isPlaying())muFinalBoss.stop();
      //if(muWin.isPlaying())muWin.stop();
      if(muTutorial.isPlaying())muTutorial.stop();
      if(muMainMenu.isPlaying())muMainMenu.stop();
      if(!stageMusic.get(trackPlaying).isPlaying()){
        trackPlaying++;
        hold=3;
        if(trackPlaying>=stageMusic.size())trackPlaying=0;
        stageMusic.get(trackPlaying).play();
        println("next Song"+trackPlaying);
      }
    }else if(stage==20){
      stageMusic.get(trackPlaying).stop();
      if(!muBoss.isPlaying() && !muBossLoop.isPlaying())muBossLoop.loop();
    }else if(stage==40){
      stageMusic.get(trackPlaying).stop();
    }else if(stage>=41 && stage<=74){
      if(!muTutorial.isPlaying())muTutorial.loop();
      muMainMenu.stop();
    }else if(stage==9999){
      
    }else if(stage==0){
      if(muBoss.isPlaying())muBoss.stop();
      if(muBossLoop.isPlaying())muBossLoop.stop();
      //if(muFinalBoss.isPlaying())muFinalBoss.stop();
      //if(muWin.isPlaying())muWin.stop();
      if(muTutorial.isPlaying())muTutorial.stop();
      if(stageMusic.size()>0){
        if(stageMusic.get(trackPlaying).isPlaying())stageMusic.get(trackPlaying).stop();
      }
      if(!muMainMenu.isPlaying())muMainMenu.loop();
    }
    }else{
      hold--;
    }
  }
  
  void interupt(SoundFile track){
    hold=5;
    if(muBoss.isPlaying())muBoss.stop();
    if(muBossLoop.isPlaying())muBossLoop.stop();
    //if(muFinalBoss.isPlaying())muFinalBoss.stop();
    //if(muWin.isPlaying())muWin.stop();
    if(muTutorial.isPlaying())muTutorial.stop();
    if(muMainMenu.isPlaying())muMainMenu.stop();
    for(int t=0;t<stageMusic.size();t++){
      if(stageMusic.get(t).isPlaying())stageMusic.get(t).stop();
      if(track==stageMusic.get(t))trackPlaying=t;
      println(trackPlaying);
    }
    track.play();
  }

}
