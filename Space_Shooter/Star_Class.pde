class Star{
  int x;
  float y;
  int type;
  float size;
  
  Star(int x, float y){
  this.x=x;
  this.y=y;
  type = (int)random(1,11);
  }
  
    void drawStar(){
      noStroke();
      if(type==1){
        //white dwarf
          size=random(1,2);
          fill(random(240,255));
          ellipse(x,y,size,size);
      }else if(type==2){
        //main sequence red
          size=random(3,4);
          fill(random(220,255),random(0,10),0);
          ellipse(x,y,size,size);
      }else if(type==3){
        //main sequence orange
          size=random(3,4);
          fill(random(200,255),random(100,150),random(0,15));
          ellipse(x,y,size,size);
      }else if(type==4){
        //main sequence yellow
          size=random(3,4);
          fill(random(220,255),random(220,255),random(0,15));
          ellipse(x,y,size,size);
      }else if(type==5){
        //main sequence green
          size=random(3,4);
          fill(random(220,255),random(220,255),random(130,170));
          ellipse(x,y,size,size);
      }else if(type==6){
        //main sequence teal
          size=random(3,4);
          fill(random(100,130),random(220,255),random(220,255));
          ellipse(x,y,size,size);
      }else if(type==7){
        //main sequence blue
          size=random(3,4);
          fill(random(0,15),random(15,30),random(220,255));
          ellipse(x,y,size,size);
      }else if(type==8){
        //blue giant
          size=random(6,7);
          fill(random(0,15),random(15,30),random(220,255));
          ellipse(x,y,size,size);
      }else if(type==9){
        //red giant
          size=random(6,7);
          fill(random(220,255),random(0,10),0);
          ellipse(x,y,size,size);
      }else if(type==10){
        //red super giant
          size=random(8,9);
          fill(random(220,255),random(0,10),0);
          ellipse(x,y,size,size);
    }
    move();
  }
  void move(){
    y+=.1;
    if(y+15>height){
      x=(int)random(width);
      y=-15;
    }
  }
}
