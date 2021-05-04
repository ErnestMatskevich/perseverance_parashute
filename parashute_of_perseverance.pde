import controlP5.*;

ControlP5 cp5;

String word1 = "";
String word2 = "";
String word3 = "";
String word4 = "";

ring[] fragment1 = new ring[100]; 
ring[] fragment2 = new ring[100]; 
ring[] fragment3 = new ring[100]; 
ring[] fragment4 = new ring[100];

public int[] memory1 = new int[100];
public int[] memory2 = new int[100];
public int[] memory3 = new int[100];
public int[] memory4 = new int[100];

int len_field = 300;


void setup(){
  smooth();
  
  size(displayWidth,displayHeight);
  surface.setResizable(true);
  surface.setTitle("Parashute of Perseverance");
  background(100,100,100);
  
  for (int i = 0; i < fragment1.length; i++ ) {
   fragment1[i]= new ring();  
   fragment2[i]= new ring(); 
   fragment3[i]= new ring(); 
   fragment4[i]= new ring(); 
   
 }
 Buttons();            
           

}

void draw(){
  float ring_len = min(width,height)/10;
  
  float x_pos = ring_len*5;
  float y_pos = height/2;
  
  int num1=0;
  int num2=0;
  int num3=0;
  int num4=0;
  
  submit();
  
  for (float a = 0; a<TWO_PI; a += TWO_PI/100){
    float x2 = x_pos + cos(a)*ring_len;
    float y2 = y_pos + sin(a)*ring_len;
    
    float x3 = x_pos + cos(a+TWO_PI/100)*ring_len;
    float y3 = y_pos + sin(a+TWO_PI/100)*ring_len;
    
    float x1 = x_pos + cos(a)*ring_len/2;
    float y1 = y_pos + sin(a)*ring_len/2;
    
    float x4 = x_pos + cos(a+TWO_PI/100)*ring_len/2;
    float y4 = y_pos + sin(a+TWO_PI/100)*ring_len/2; 

    fragment1[num1].sector(x1,y1,x2,y2,x3,y3,x4,y4,memory1[num1]); num1++;}  
    
     
    for (float a = 0; a<TWO_PI; a += TWO_PI/100){
    float x2 = x_pos + cos(a)*ring_len*2;
    float y2 = y_pos + sin(a)*ring_len*2;
    
    float x3 = x_pos + cos(a+TWO_PI/100)*ring_len*2;
    float y3 = y_pos + sin(a+TWO_PI/100)*ring_len*2;
    
    float x1 = x_pos + cos(a)*ring_len;
    float y1 = y_pos + sin(a)*ring_len;
    
    float x4 = x_pos + cos(a+TWO_PI/100)*ring_len;
    float y4 = y_pos + sin(a+TWO_PI/100)*ring_len;
    
    fragment2[num2].sector(x1,y1,x2,y2,x3,y3,x4,y4,memory2[num2]); num2++;} 
    
    
    for (float a = 0; a<TWO_PI; a += TWO_PI/100){
    float x2 = x_pos + cos(a)*ring_len*4;
    float y2 = y_pos + sin(a)*ring_len*4;
    
    float x3 = x_pos + cos(a+TWO_PI/100)*ring_len*4;
    float y3 = y_pos + sin(a+TWO_PI/100)*ring_len*4;
    
    float x1 = x_pos + cos(a)*ring_len*2;
    float y1 = y_pos + sin(a)*ring_len*2;
    
    float x4 = x_pos + cos(a+TWO_PI/100)*ring_len*2;
    float y4 = y_pos + sin(a+TWO_PI/100)*ring_len*2;
    
    fragment3[num3].sector(x1,y1,x2,y2,x3,y3,x4,y4,memory3[num3]); num3++;} 
    
    
    for (float a = 0; a<TWO_PI; a += TWO_PI/100){
    float x2 = x_pos + cos(a)*ring_len*5;
    float y2 = y_pos + sin(a)*ring_len*5;
    
    float x3 = x_pos + cos(a+TWO_PI/100)*ring_len*5;
    float y3 = y_pos + sin(a+TWO_PI/100)*ring_len*5;
    
    float x1 = x_pos + cos(a)*ring_len*4.5;
    float y1 = y_pos + sin(a)*ring_len*4.5;
    
    float x4 = x_pos + cos(a+TWO_PI/100)*ring_len*4.5;
    float y4 = y_pos + sin(a+TWO_PI/100)*ring_len*4.5;
    
    fragment4[num4].sector(x1,y1,x2,y2,x3,y3,x4,y4,memory4[num4]); num4++;} 
           
}



void submit(){
  word1 = (cp5.get(Textfield.class,"RING1").getText()).toUpperCase(); if(word1.length()>10){cp5.get(Textfield.class,"RING1").setText("Long text!");} Word2Bin(word1,memory1);
  word2 = (cp5.get(Textfield.class,"RING2").getText()).toUpperCase(); if(word2.length()>10){cp5.get(Textfield.class,"RING2").setText("Long text!");} Word2Bin(word2,memory2);
  word3 = (cp5.get(Textfield.class,"RING3").getText()).toUpperCase(); if(word3.length()>10){cp5.get(Textfield.class,"RING3").setText("Long text!");} Word2Bin(word3,memory3);
  word4 = (cp5.get(Textfield.class,"RING4").getText()).toUpperCase(); if(word4.length()>10){cp5.get(Textfield.class,"RING4").setText("Long text!");} Word2Bin(word4,memory4); 
}


void Word2Bin(String word, int[] memory){
  

  String abc = "_ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789 *(),.";
  String bin_code = "";
  int place;
  
  
  if((word.length()==0)||(word=="Long text!")||(word.length()>10)){for(int i = 0; i<100; i++){memory[i] = 48;}}
  else{
  
  for(int i = 0; i<word.length(); i++){
    
    place = abc.indexOf(word.charAt(i));
    bin_code = bin_code + (binary(place,10));}
    
  for(int i = 0; i<bin_code.length(); i++){
    memory[i] = (bin_code.charAt(i));}}}
    
void Buttons(){
  float x_place = width*0.6;
    if ((width<=1280)||(height<=768)){x_place=800;len_field=200;}
    
   
  cp5 = new ControlP5(this);
  for(int i = 1; i<5; i++){
           cp5.addTextfield("RING"+i)
                   .setPosition(x_place, 100+100*i)
                   .setSize(len_field, 25)
                   .setFont(createFont("Times New Roman",25));}
}
  
