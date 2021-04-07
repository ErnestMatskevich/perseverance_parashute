
ring[] fragment1 = new ring[100];
ring[] fragment2 = new ring[100];
ring[] fragment3 = new ring[100];
ring[] fragment4 = new ring[100];
 
PVector[] vertices = new PVector[4];
boolean flag = false;

void setup(){

  size(2000,1000);
  
  for (int i = 0; i < fragment1.length; i++ ) {
   fragment1[i]= new ring(); 
   fragment2[i]= new ring();
   fragment3[i]= new ring();
   fragment4[i]= new ring();}
  
  
}

void draw(){
 
  for (float a = 0; a<TWO_PI; a += TWO_PI/100){
    float x2 = 1000 + cos(a)*100;
    float y2 = 500 + sin(a)*100;
    
    float x3 = 1000 + cos(a+TWO_PI/100)*100;
    float y3 = 500 + sin(a+TWO_PI/100)*100;
    
    float x1 = 1000 + cos(a)*50;
    float y1 = 500 + sin(a)*50;
    
    float x4 = 1000 + cos(a+TWO_PI/100)*50;
    float y4 = 500 + sin(a+TWO_PI/100)*50;
    
    fragment1[int(a)].sector(x1,y1,x2,y2,x3,y3,x4,y4);}  
    
    
    
    for (float a = 0; a<TWO_PI; a += TWO_PI/100){
    float x2 = 1000 + cos(a)*200;
    float y2 = 500 + sin(a)*200;
    
    float x3 = 1000 + cos(a+TWO_PI/100)*200;
    float y3 = 500 + sin(a+TWO_PI/100)*200;
    
    float x1 = 1000 + cos(a)*100;
    float y1 = 500 + sin(a)*100;
    
    float x4 = 1000 + cos(a+TWO_PI/100)*100;
    float y4 = 500 + sin(a+TWO_PI/100)*100;
    
    fragment2[int(a)].sector(x1,y1,x2,y2,x3,y3,x4,y4);} 
    
    
    for (float a = 0; a<TWO_PI; a += TWO_PI/100){
    float x2 = 1000 + cos(a)*400;
    float y2 = 500 + sin(a)*400;
    
    float x3 = 1000 + cos(a+TWO_PI/100)*400;
    float y3 = 500 + sin(a+TWO_PI/100)*400;
    
    float x1 = 1000 + cos(a)*200;
    float y1 = 500 + sin(a)*200;
    
    float x4 = 1000 + cos(a+TWO_PI/100)*200;
    float y4 = 500 + sin(a+TWO_PI/100)*200;
    
    fragment3[int(a)].sector(x1,y1,x2,y2,x3,y3,x4,y4);} 
    
    
    for (float a = 0; a<TWO_PI; a += TWO_PI/100){
    float x2 = 1000 + cos(a)*500;
    float y2 = 500 + sin(a)*500;
    
    float x3 = 1000 + cos(a+TWO_PI/100)*500;
    float y3 = 500 + sin(a+TWO_PI/100)*500;
    
    float x1 = 1000 + cos(a)*450;
    float y1 = 500 + sin(a)*450;
    
    float x4 = 1000 + cos(a+TWO_PI/100)*450;
    float y4 = 500 + sin(a+TWO_PI/100)*450;
    
    fragment4[int(a)].sector(x1,y1,x2,y2,x3,y3,x4,y4);} 
    
    
    
}
