int stage = 0;
Thread thread1 = new Thread();
Thread thread2 = new Thread();
Thread thread3 = new Thread();
Thread thread4 = new Thread();
import processing.sound.*;
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
Button btnExitGame;
SoundFile nShoot;
SoundFile pShoot;
SoundFile bShoot;
SoundFile fShoot;
boolean starting = false;
boolean paused = false;
boolean shopping = false;
PFont HUDFont;
int enemiesRemaning;
ArrayList<PowerUp> powerUps = new ArrayList<PowerUp>();
float frameTime;
float eVolume = .1;

void setup() {
  size(800, 600,P2D);
  surface.setResizable(true);
  smooth(8);
  frameRate(60);
  btnPlay = new Button(width/2-35, height*2/3-15, 70, 30, "play");
  btnShop = new Button(width/2-60, height*5/16-15,120,30,"Enter Shop");
  btnUnpause = new Button(width/2-60,height*7/16-15,120,30,"Continue");
  btnReturnToTitle = new Button(width/2-60,height*9/16-15,120,30,"Back to Title");
  btnExitGame = new Button(width/2-60,height*11/16-15,120,30,"Exit Game");
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
  nShoot = new SoundFile(this, "necrophite fire.wav");
  pShoot = new SoundFile(this, "pyroling fire.wav");
  bShoot = new SoundFile(this, "boss fire.wav");
  fShoot = new SoundFile(this, "fodder fire.wav");
  nShoot.amp(eVolume);
  pShoot.amp(eVolume);
  bShoot.amp(eVolume/2);
  fShoot.amp(eVolume);
}

void draw() {
  enemiesRemaning=0;
  if (paused) {
    pause();
  } else if(shopping){
    shop();
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
      case 999:
        winScreen();
        break;
    default:
      endScreen();
    }
    }
  }
