int stage = 0;
Thread thread1 = new Thread();
Thread thread2 = new Thread();
Thread thread3 = new Thread();
Thread thread4 = new Thread();
import processing.sound.*;
import ddf.minim.*;
import ddf.minim.ugens.*;
MusicHandler musicHandler;
Hero hero;
Boss boss;
Button btnShop;
Button btnExitShop;
Button btnHealthUp;
Button btnFireRateUp;
Button btnDamageUp;
Button btnBuyTripple;
Button btnBuyBigTripple;
Button btnBuyMachine;
Button btnBuyBigMachine;
Button btnBuySniper;
Button btnBuyBigSniper;
Button btnUnpause;
Button btnReturnToTitle;
Button btnMusic;
Button btnEnterTutorial;
Minim minim;
AudioOutput enemiesAudio;
AudioOutput bossAudio;
AudioOutput heroAudio;
AudioOutput sfxAudio;
AudioOutput musicAudio;
Sampler pShoot;
Sampler nShoot;
Sampler cFreeze;
Sampler hShoot;
Sampler fShoot;
Sampler bShoot;
Sampler sniper;
Sampler mGun;
Sampler bGun;
Sampler tGun;
Sampler cBoom;
SoundFile tFire;
SoundFile tBoom;
SoundFile tShock;
SoundFile muMainMenu;
SoundFile muTutorial;
SoundFile muLevel1;
SoundFile muLevel4;
SoundFile muLevel7;
SoundFile muLevel10;
SoundFile muLevel13;
SoundFile muLevel16;
SoundFile muLevel19;
SoundFile muBoss;
SoundFile muBossLoop;
SoundFile muCredits;
SoundFile muWin;
SoundFile muFinalBoss;
SoundFile muUnlock1;
SoundFile muUnlock2;
SoundFile muUnlock3;
SoundFile muUnlock4;
boolean starting = false;
boolean paused = false;
boolean shopping = false;
boolean musicMenu = false;
PFont HUDFont;
int enemiesRemaning;
int currentKey;
int trackUnlocked = 0;
int bonusTrackUnlocked = 0;
ArrayList<PowerUp> powerUps = new ArrayList<PowerUp>();
ArrayList<SoundFile> stageMusic = new ArrayList<SoundFile>();
float frameTime;
float eVolume=-30;
float hVolume=-20;
float hVolumeC=1;
float mVolume=1;
Gain eVol1;
Gain eVol2;
Gain eVol3;
Gain eVol4;
Gain eVol5;
Gain eVolb1;
Gain eVolb2;
Gain eVolb3;
Gain eVolb4;
Gain eVolb5;
Gain bVol;
Gain hero1;
Gain hero2;
Gain hero3;
Gain hero4;

void setup() {
  size(800, 600, P2D);
  minim=new Minim(this);
  musicHandler = new MusicHandler();
  enemiesAudio=minim.getLineOut();
  bossAudio=minim.getLineOut();
  heroAudio=minim.getLineOut();
  sfxAudio=minim.getLineOut();
  musicAudio=minim.getLineOut();
  surface.setResizable(true);
  smooth(8);
  frameRate(60);
  btnPlay = new Button(width/2-35, height*2/3-15, 70, 30, "play");
  btnShop = new Button(width/2-60, height*5/16-15,120,30,"Enter Shop");
  btnUnpause = new Button(width/2-60,height*7/16-15,120,30,"Continue");
  btnReturnToTitle = new Button(width/2-60,height*9/16-15,120,30,"Back to Title");
  btnMusic = new Button(width/2-60,height*11/16-15,120,30,"Music PLayer");
  btnExitShop = new Button(width-90,height-50,70,30,"EXIT");
  btnHealthUp = new Button(width*.1,height*1/7,120,30,"Upgrade Health");
  btnFireRateUp = new Button(width*.1,height*2/7,120,30,"Upgrade Fire Rate");
  btnDamageUp = new Button(width*.1,height*3/7,120,30,"Increase Damage");
  btnBuyTripple = new Button(width*.1,height*4/7,180,30,"Buy Tripple Shot Ammo");
  btnBuyBigTripple = new Button(width*.65,height*4/7,180,30,"Buy Tripple Shot Ammo");
  btnBuyMachine = new Button(width*.1,height*5/7,180,30,"Buy Machine gun Ammo");
  btnBuyBigMachine = new Button(width*.65,height*5/7,180,30,"Buy Machine gun Ammo");
  btnBuySniper = new Button(width*.1,height*6/7,180,30,"Buy Sniper Ammo");
  btnBuyBigSniper = new Button(width*.65,height*6/7,180,30,"Buy Sniper Ammo");
  btnEnterTutorial = new Button(width*.85,40,80,30,"Tutorial");
  nShoot = new Sampler("necrophite fire.wav",100,minim);
  pShoot = new Sampler("pyroling fire.wav",100,minim);
  cFreeze = new Sampler("cryomorph freeze.wav",100,minim);
  hShoot = new Sampler("hemobibe fire.wav",100,minim);
  bShoot = new Sampler("boss fire.wav",100,minim);
  fShoot = new Sampler("fodder fire.wav",100,minim);
  sniper = new Sampler("sniper.wav",100,minim);
  mGun = new Sampler("mGun.wav",100,minim);
  bGun = new Sampler("basic fire.wav",100,minim);
  tGun = new Sampler("tripple fire.wav",100,minim);
  cBoom = new Sampler("cryomorph boom.wav",100,minim);
  tFire = new SoundFile(this,"torpedo fire.wav");
  tBoom = new SoundFile(this,"torpedo boom.wav");
  tShock = new SoundFile(this,"torpedo shock.wav");
  muMainMenu = new SoundFile(this,"At Doom's Gate.mp3");
  muTutorial = new SoundFile(this,"VAB.wav");
  muLevel1 = new SoundFile(this,"Rocket Science.wav");
  muLevel4 = new SoundFile(this,"Space Invaders.wav");
  muLevel7 = new SoundFile(this,"Atomic.wav");
  muLevel10 = new SoundFile(this,"Binary Fable.wav");
  muLevel13 = new SoundFile(this,"Space Adventure.wav");
  muLevel16 = new SoundFile(this,"Plan of Attack.wav");
  muLevel19 = new SoundFile(this,"Delete!.wav");
  muBoss = new SoundFile(this,"Cosmic Kittens-first.wav");
  muBossLoop = new SoundFile(this,"Cosmic Kittens-loop.wav");
  muCredits = new SoundFile(this,"Want You Gone.wav");
  eVol1=new Gain(eVolume);
  eVol2=new Gain(eVolume);
  eVol3=new Gain(eVolume);
  eVol4=new Gain(eVolume+3);
  eVol5=new Gain(eVolume);
  eVolb1=new Gain(eVolume);
  eVolb2=new Gain(eVolume);
  eVolb3=new Gain(eVolume+20);
  eVolb4=new Gain(eVolume);
  eVolb5=new Gain(eVolume);
  bVol=new Gain(eVolume/2);
  hero1=new Gain(hVolume-20);
  hero2=new Gain(hVolume);
  hero3=new Gain(hVolume);
  hero4=new Gain(hVolume);
  tFire.amp(hVolumeC);
  tBoom.amp(hVolumeC/2);
  tShock.amp(hVolumeC);
  muMainMenu.amp(mVolume);
  muTutorial.amp(mVolume);
  muLevel1.amp(mVolume);
  muLevel4.amp(mVolume);
  muLevel7.amp(mVolume);
  muLevel10.amp(mVolume);
  muLevel13.amp(mVolume);
  muLevel16.amp(mVolume);
  muLevel19.amp(mVolume);
  muBoss.amp(mVolume);
  muBossLoop.amp(mVolume);
  muCredits.amp(mVolume);
  pShoot.patch(eVol1).patch(enemiesAudio);
  nShoot.patch(eVol2).patch(enemiesAudio);
  cFreeze.patch(eVol3).patch(enemiesAudio);
  hShoot.patch(eVol4).patch(enemiesAudio);
  bShoot.patch(bVol).patch(enemiesAudio);
  fShoot.patch(eVol5).patch(enemiesAudio);
  sniper.patch(hero1).patch(heroAudio);
  mGun.patch(hero2).patch(heroAudio);
  bGun.patch(hero3).patch(heroAudio);
  tGun.patch(hero4).patch(heroAudio);
  cBoom.patch(eVolb3).patch(enemiesAudio);
  musicHandler.mainMenuMusic();
}

void draw() {
  musicHandler.play();
  enemiesRemaning=0;
  if (paused) {
    pause();
  } else if(shopping){
    shop();
  }else if(musicMenu){
    musicMenu();
  }else{
    switch(stage) {
    case 0:
      startScreen();
      break;
    case 1:
      level1();
      break;
    case 2:
      level2();
      break;
    case 3:
      level3();
      break;
    case 4:
      level4();
      break;
     case 5:
       level5();
       break;
     case 6:
       level6();
       break;
     case 7:
       level7();
       break;
     case 8:
       level8();
       break;
     case 9:
       level9();
       break;
     case 10:
       level10();
       break;
     case 11:
       level11();
       break;
     case 12:
       level12();
       break;
     case 13:
       level13();
       break;
     case 14:
       level14();
       break;
     case 15:
       level15();
       break;
     case 16:
       level16();
       break;
     case 17:
       level17();
       break;
     case 18:
       level18();
       break;
     case 19:
       level19();
       break;
     case 20:
       level20();
       break;
     case 41:
       tutorial1();
       break;
     case 42:
       tutorial2();
       break;
     case 43:
       tutorial3();
       break;
     case 44:
       tutorial4();
       break;
     case 45:
       tutorial5();
       break;
     case 46:
       tutorial6();
       break;
     case 47:
       tutorial7();
       break;
     case 48:
       tutorial8();
       break;
     case 49:
       tutorial9();
       break;
     case 50:
       tutorial10();
       break;
     case 51:
       tutorial11();
       break;
     case 52:
       tutorial12();
       break;
     case 53:
       tutorial13();
       break;
     case 54:
       tutorial14();
       break;
     case 55:
       tutorial15();
       break;
     case 56:
       tutorial16();
       break;
     case 57:
       tutorial17();
       break;
     case 58:
       tutorial18();
       break;
     case 59:
       tutorial19();
       break;
     case 60:
       tutorial20();
       break;
     case 61:
       tutorial21();
       break;
     case 62:
       tutorial22();
       break;
     case 63:
       tutorial23();
       break;
     case 64:
       tutorial24();
       break;
     case 65:
       tutorial25();
       break;
     case 66:
       tutorial26();
       break;
     case 67:
       tutorial27();
       break;
     case 68:
       tutorial28();
       break;
     case 69:
       tutorial29();
       break;
     case 70:
       tutorial30();
       break;
     case 71:
       tutorial31();
       break;
     case 72:
       tutorial32();
       break;
     case 73:
       tutorial33();
       break;
     case 74:
       tutorial34();
       break;
      case 999:
        winScreen();
        break;
    default:
      endScreen();
    }
    }
  }
