void torpedoExplosion(int x,int y,float size){
  //size of rings for lightning
  float rad2,rad3;
  float rad1,rad4;
  //points for lightning
  float a,aa,ab,aaa,aab,aba,abb,aaaa,aaab,aaba,aabb,abaa,abab,abba,abbb;
  float b,ba,bb,baa,bab,bba,bbb,baaa,baab,baba,babb,bbaa,bbab,bbba,bbbb;
  float c,ca,cb,caa,cab,cba,cbb,caaa,caab,caba,cabb,cbaa,cbab,cbba,cbbb;
  float d,da,db,daa,dab,dba,dbb,daaa,daab,daba,dabb,dbaa,dbab,dbba,dbbb;
  float e,ea,eb,eaa,eab,eba,ebb,eaaa,eaab,eaba,eabb,ebaa,ebab,ebba,ebbb;
  
  pushMatrix();
  translate(x,y);
  scale(size,size);
  
  fill(0,175,255);
  stroke(0,100,255);
  strokeWeight(10);
  ellipse(0,0,100,100);
  
  fill(50,255,255);
  stroke(0,225,255);
  strokeWeight(8);
  ellipse(0,0,50,50);
  
  fill(255,255,255);
  stroke(0,255,255);
  strokeWeight(6);
  ellipse(0,0,10,10);
  
 //lightning
 stroke(200,150,255);
 strokeWeight(1);
   //constant radi
   rad1 = 2;
   rad4 = 55;
   //variable radi
   rad2 = random(15,19);
   rad3 = random(33,41);
   //point angles
   a=random(0-.5,(PI*2/5));
   aa=random(0-.5,(PI*2/5));
   ab=random(0-.5,(PI*2/5));
   aaa=random(0-.5,(PI*2/5));
   aab=random(0-.5,(PI*2/5));
   aba=random(0-.5,(PI*2/5));
   abb=random(0-.5,(PI*2/5));
   aaaa=random(0-.5,(PI*2/5));
   aaab=random(0-.5,(PI*2/5));
   aaba=random(0-.5,(PI*2/5));
   aabb=random(0-.5,(PI*2/5));
   abaa=random(0-.5,(PI*2/5));
   abab=random(0-.5,(PI*2/5));
   abba=random(0-.5,(PI*2/5));
   abbb=random(0-.5,(PI*2/5));
 
   b=random((PI*2/5)-.5,(PI*4/5));
   ba=random((PI*2/5)-.5,(PI*4/5));
   bb=random((PI*2/5)-.5,(PI*4/5));
   baa=random((PI*2/5)-.5,(PI*4/5));
   bab=random((PI*2/5)-.5,(PI*4/5));
   bba=random((PI*2/5)-.5,(PI*4/5));
   bbb=random((PI*2/5)-.5,(PI*4/5));
   baaa=random((PI*2/5)-.5,(PI*4/5));
   baab=random((PI*2/5)-.5,(PI*4/5));
   baba=random((PI*2/5)-.5,(PI*4/5));
   babb=random((PI*2/5)-.5,(PI*4/5));
   bbaa=random((PI*2/5)-.5,(PI*4/5));
   bbab=random((PI*2/5)-.5,(PI*4/5));
   bbba=random((PI*2/5)-.5,(PI*4/5));
   bbbb=random((PI*2/5)-.5,(PI*4/5));
 
   c=random((PI*4/5)-.5,(PI*6/5));
   ca=random((PI*4/5)-.5,(PI*6/5));
   cb=random((PI*4/5)-.5,(PI*6/5));
   caa=random((PI*4/5)-.5,(PI*6/5));
   cab=random((PI*4/5)-.5,(PI*6/5));
   cba=random((PI*4/5)-.5,(PI*6/5));
   cbb=random((PI*4/5)-.5,(PI*6/5));
   caaa=random((PI*4/5)-.5,(PI*6/5));
   caab=random((PI*4/5)-.5,(PI*6/5));
   caba=random((PI*4/5)-.5,(PI*6/5));
   cabb=random((PI*4/5)-.5,(PI*6/5));
   cbaa=random((PI*4/5)-.5,(PI*6/5));
   cbab=random((PI*4/5)-.5,(PI*6/5));
   cbba=random((PI*4/5)-.5,(PI*6/5));
   cbbb=random((PI*4/5)-.5,(PI*6/5));
 
   d=random((PI*6/5)-.5,(PI*8/5));
   da=random((PI*6/5)-.5,(PI*8/5));
   db=random((PI*6/5)-.5,(PI*8/5));
   daa=random((PI*6/5)-.5,(PI*8/5));
   dab=random((PI*6/5)-.5,(PI*8/5));
   dba=random((PI*6/5)-.5,(PI*8/5));
   dbb=random((PI*6/5)-.5,(PI*8/5));
   daaa=random((PI*6/5)-.5,(PI*8/5));
   daab=random((PI*6/5)-.5,(PI*8/5));
   daba=random((PI*6/5)-.5,(PI*8/5));
   dabb=random((PI*6/5)-.5,(PI*8/5));
   dbaa=random((PI*6/5)-.5,(PI*8/5));
   dbab=random((PI*6/5)-.5,(PI*8/5));
   dbba=random((PI*6/5)-.5,(PI*8/5));
   dbbb=random((PI*6/5)-.5,(PI*8/5));
 
   e=random((PI*8/5)-.5,(PI*10/5));
   ea=random((PI*8/5)-.5,(PI*10/5));
   eb=random((PI*8/5)-.5,(PI*10/5));
   eaa=random((PI*8/5)-.5,(PI*10/5));
   eab=random((PI*8/5)-.5,(PI*10/5));
   eba=random((PI*8/5)-.5,(PI*10/5));
   ebb=random((PI*8/5)-.5,(PI*10/5));
   eaaa=random((PI*8/5)-.5,(PI*10/5));
   eaab=random((PI*8/5)-.5,(PI*10/5));
   eaba=random((PI*8/5)-.5,(PI*10/5));
   eabb=random((PI*8/5)-.5,(PI*10/5));
   ebaa=random((PI*8/5)-.5,(PI*10/5));
   ebab=random((PI*8/5)-.5,(PI*10/5));
   ebba=random((PI*8/5)-.5,(PI*10/5));
   ebbb=random((PI*8/5)-.5,(PI*10/5));
   
   //ligtning lines
     //a
     line(rad1*cos(a),rad1*sin(a),rad2*cos(aa),rad2*sin(aa));
     line(rad1*cos(a),rad1*sin(a),rad2*cos(ab),rad2*sin(ab));
     line(rad2*cos(aa),rad2*sin(aa),rad3*cos(aaa),rad3*sin(aaa));
     line(rad2*cos(aa),rad2*sin(aa),rad3*cos(aab),rad3*sin(aab));
     line(rad2*cos(ab),rad2*sin(ab),rad3*cos(aba),rad3*sin(aba));
     line(rad2*cos(ab),rad2*sin(ab),rad3*cos(abb),rad3*sin(abb));
     line(rad3*cos(aaa),rad3*sin(aaa),rad4*cos(aaaa),rad4*sin(aaaa));
     line(rad3*cos(aaa),rad3*sin(aaa),rad4*cos(aaab),rad4*sin(aaab));
     line(rad3*cos(aab),rad3*sin(aab),rad4*cos(aaba),rad4*sin(aaba));
     line(rad3*cos(aab),rad3*sin(aab),rad4*cos(aabb),rad4*sin(aabb));
     line(rad3*cos(aba),rad3*sin(aba),rad4*cos(abaa),rad4*sin(abaa));
     line(rad3*cos(aba),rad3*sin(aba),rad4*cos(abab),rad4*sin(abab));
     line(rad3*cos(abb),rad3*sin(abb),rad4*cos(abba),rad4*sin(abba));
     line(rad3*cos(abb),rad3*sin(abb),rad4*cos(abbb),rad4*sin(abbb));
     
     //b
     line(rad1*cos(b),rad1*sin(b),rad2*cos(ba),rad2*sin(ba));
     line(rad1*cos(b),rad1*sin(b),rad2*cos(bb),rad2*sin(bb));
     line(rad2*cos(ba),rad2*sin(ba),rad3*cos(baa),rad3*sin(baa));
     line(rad2*cos(ba),rad2*sin(ba),rad3*cos(bab),rad3*sin(bab));
     line(rad2*cos(bb),rad2*sin(bb),rad3*cos(bba),rad3*sin(bba));
     line(rad2*cos(bb),rad2*sin(bb),rad3*cos(bbb),rad3*sin(bbb));
     line(rad3*cos(baa),rad3*sin(baa),rad4*cos(baaa),rad4*sin(baaa));
     line(rad3*cos(baa),rad3*sin(baa),rad4*cos(baab),rad4*sin(baab));
     line(rad3*cos(bab),rad3*sin(bab),rad4*cos(baba),rad4*sin(baba));
     line(rad3*cos(bab),rad3*sin(bab),rad4*cos(babb),rad4*sin(babb));
     line(rad3*cos(bba),rad3*sin(bba),rad4*cos(bbaa),rad4*sin(bbaa));
     line(rad3*cos(bba),rad3*sin(bba),rad4*cos(bbab),rad4*sin(bbab));
     line(rad3*cos(bbb),rad3*sin(bbb),rad4*cos(bbba),rad4*sin(bbba));
     line(rad3*cos(bbb),rad3*sin(bbb),rad4*cos(bbbb),rad4*sin(bbbb));
     
     //c
     line(rad1*cos(c),rad1*sin(c),rad2*cos(ca),rad2*sin(ca));
     line(rad1*cos(c),rad1*sin(c),rad2*cos(cb),rad2*sin(cb));
     line(rad2*cos(ca),rad2*sin(ca),rad3*cos(caa),rad3*sin(caa));
     line(rad2*cos(ca),rad2*sin(ca),rad3*cos(cab),rad3*sin(cab));
     line(rad2*cos(cb),rad2*sin(cb),rad3*cos(cba),rad3*sin(cba));
     line(rad2*cos(cb),rad2*sin(cb),rad3*cos(cbb),rad3*sin(cbb));
     line(rad3*cos(caa),rad3*sin(caa),rad4*cos(caaa),rad4*sin(caaa));
     line(rad3*cos(caa),rad3*sin(caa),rad4*cos(caab),rad4*sin(caab));
     line(rad3*cos(cab),rad3*sin(cab),rad4*cos(caba),rad4*sin(caba));
     line(rad3*cos(cab),rad3*sin(cab),rad4*cos(cabb),rad4*sin(cabb));
     line(rad3*cos(cba),rad3*sin(cba),rad4*cos(cbaa),rad4*sin(cbaa));
     line(rad3*cos(cba),rad3*sin(cba),rad4*cos(cbab),rad4*sin(cbab));
     line(rad3*cos(cbb),rad3*sin(cbb),rad4*cos(cbba),rad4*sin(cbba));
     line(rad3*cos(cbb),rad3*sin(cbb),rad4*cos(cbbb),rad4*sin(cbbb));
     
     //d
     line(rad1*cos(d),rad1*sin(d),rad2*cos(da),rad2*sin(da));
     line(rad1*cos(d),rad1*sin(d),rad2*cos(db),rad2*sin(db));
     line(rad2*cos(da),rad2*sin(da),rad3*cos(daa),rad3*sin(daa));
     line(rad2*cos(da),rad2*sin(da),rad3*cos(dab),rad3*sin(dab));
     line(rad2*cos(db),rad2*sin(db),rad3*cos(dba),rad3*sin(dba));
     line(rad2*cos(db),rad2*sin(db),rad3*cos(dbb),rad3*sin(dbb));
     line(rad3*cos(daa),rad3*sin(daa),rad4*cos(daaa),rad4*sin(daaa));
     line(rad3*cos(daa),rad3*sin(aaa),rad4*cos(daab),rad4*sin(daab));
     line(rad3*cos(dab),rad3*sin(dab),rad4*cos(daba),rad4*sin(daba));
     line(rad3*cos(dab),rad3*sin(dab),rad4*cos(dabb),rad4*sin(dabb));
     line(rad3*cos(dba),rad3*sin(dba),rad4*cos(dbaa),rad4*sin(dbaa));
     line(rad3*cos(dba),rad3*sin(dba),rad4*cos(dbab),rad4*sin(dbab));
     line(rad3*cos(dbb),rad3*sin(dbb),rad4*cos(dbba),rad4*sin(dbba));
     line(rad3*cos(dbb),rad3*sin(dbb),rad4*cos(dbbb),rad4*sin(dbbb));
     
     //e
     line(rad1*cos(e),rad1*sin(e),rad2*cos(ea),rad2*sin(ea));
     line(rad1*cos(e),rad1*sin(e),rad2*cos(eb),rad2*sin(eb));
     line(rad2*cos(ea),rad2*sin(ea),rad3*cos(eaa),rad3*sin(eaa));
     line(rad2*cos(ea),rad2*sin(ea),rad3*cos(eab),rad3*sin(eab));
     line(rad2*cos(eb),rad2*sin(eb),rad3*cos(eba),rad3*sin(eba));
     line(rad2*cos(eb),rad2*sin(eb),rad3*cos(ebb),rad3*sin(ebb));
     line(rad3*cos(eaa),rad3*sin(eaa),rad4*cos(eaaa),rad4*sin(eaaa));
     line(rad3*cos(eaa),rad3*sin(eaa),rad4*cos(eaab),rad4*sin(eaab));
     line(rad3*cos(eab),rad3*sin(eab),rad4*cos(eaba),rad4*sin(eaba));
     line(rad3*cos(eab),rad3*sin(eab),rad4*cos(eabb),rad4*sin(eabb));
     line(rad3*cos(eba),rad3*sin(eba),rad4*cos(ebaa),rad4*sin(ebaa));
     line(rad3*cos(eba),rad3*sin(eba),rad4*cos(ebab),rad4*sin(ebab));
     line(rad3*cos(ebb),rad3*sin(ebb),rad4*cos(ebba),rad4*sin(ebba));
     line(rad3*cos(ebb),rad3*sin(ebb),rad4*cos(ebbb),rad4*sin(ebbb));
     
  popMatrix();
 }
