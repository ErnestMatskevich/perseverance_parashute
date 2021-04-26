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

int x_pos = 600;
int y_pos = 500;


void setup(){

  size(1700,1000);
  background(100,100,100);
  
  for (int i = 0; i < fragment1.length; i++ ) {
   fragment1[i]= new ring();  
   fragment2[i]= new ring(); 
   fragment3[i]= new ring(); 
   fragment4[i]= new ring(); 
   
 }
  
  cp5 = new ControlP5(this);
  
  for(int i = 1; i<5; i++){
           cp5.addTextfield("RING"+i)
                   .setPosition(1300, 100+100*i)
                   .setSize(200, 20)
                   .setFont(createFont("arial",20))
                   .setFocus(true);
                   
  cp5.addButton("clear"+i, 1000, 1200, 100+100*i, 70, 20).setFont(createFont("arial",13));
  cp5.addButton("submit"+i, 1400, 1530, 100+100*i, 60, 20).setFont(createFont("arial",13));}
    
}

void draw(){
 
  int num1=0;
  int num2=0;
  int num3=0;
  int num4=0;

  for (float a = 0; a<TWO_PI; a += TWO_PI/100){
    float x2 = x_pos + cos(a)*100;
    float y2 = y_pos + sin(a)*100;
    
    float x3 = x_pos + cos(a+TWO_PI/100)*100;
    float y3 = y_pos + sin(a+TWO_PI/100)*100;
    
    float x1 = x_pos + cos(a)*50;
    float y1 = y_pos + sin(a)*50;
    
    float x4 = x_pos + cos(a+TWO_PI/100)*50;
    float y4 = y_pos + sin(a+TWO_PI/100)*50; 

    fragment1[num1].sector(x1,y1,x2,y2,x3,y3,x4,y4,memory1[num1]); num1++;}  
    
     
    for (float a = 0; a<TWO_PI; a += TWO_PI/100){
    float x2 = x_pos + cos(a)*200;
    float y2 = y_pos + sin(a)*200;
    
    float x3 = x_pos + cos(a+TWO_PI/100)*200;
    float y3 = y_pos + sin(a+TWO_PI/100)*200;
    
    float x1 = x_pos + cos(a)*100;
    float y1 = y_pos + sin(a)*100;
    
    float x4 = x_pos + cos(a+TWO_PI/100)*100;
    float y4 = y_pos + sin(a+TWO_PI/100)*100;
    
    fragment2[num2].sector(x1,y1,x2,y2,x3,y3,x4,y4,memory2[num2]); num2++;} 
    
    
    for (float a = 0; a<TWO_PI; a += TWO_PI/100){
    float x2 = x_pos + cos(a)*400;
    float y2 = y_pos + sin(a)*400;
    
    float x3 = x_pos + cos(a+TWO_PI/100)*400;
    float y3 = y_pos + sin(a+TWO_PI/100)*400;
    
    float x1 = x_pos + cos(a)*200;
    float y1 = y_pos + sin(a)*200;
    
    float x4 = x_pos + cos(a+TWO_PI/100)*200;
    float y4 = y_pos + sin(a+TWO_PI/100)*200;
    
    fragment3[num3].sector(x1,y1,x2,y2,x3,y3,x4,y4,memory3[num3]); num3++;} 
    
    
    for (float a = 0; a<TWO_PI; a += TWO_PI/100){
    float x2 = x_pos + cos(a)*500;
    float y2 = y_pos + sin(a)*500;
    
    float x3 = x_pos + cos(a+TWO_PI/100)*500;
    float y3 = y_pos + sin(a+TWO_PI/100)*500;
    
    float x1 = x_pos + cos(a)*450;
    float y1 = y_pos + sin(a)*450;
    
    float x4 = x_pos + cos(a+TWO_PI/100)*450;
    float y4 = y_pos + sin(a+TWO_PI/100)*450;
    
    fragment4[num4].sector(x1,y1,x2,y2,x3,y3,x4,y4,memory4[num4]); num4++;} 
           
}

void clear1() {
  cp5.get(Textfield.class,"RING1").clear();
}

void clear2() {
  cp5.get(Textfield.class,"RING2").clear();
}

void clear3() {
  cp5.get(Textfield.class,"RING3").clear();
}

void clear4() {
  cp5.get(Textfield.class,"RING4").clear();
}

void submit1() {

   word1 = (cp5.get(Textfield.class,"RING1").getText()).toUpperCase();
   cp5.get(Textfield.class,"RING1").clear();
   Word2Bin(word1,memory1);
}

void submit2() {

   word2 = (cp5.get(Textfield.class,"RING2").getText()).toUpperCase();
   cp5.get(Textfield.class,"RING2").clear();
   Word2Bin(word2,memory2);
}

void submit3() {

   word3 = (cp5.get(Textfield.class,"RING3").getText()).toUpperCase();
   cp5.get(Textfield.class,"RING3").clear();
   Word2Bin(word3,memory3);
}

void submit4() {

   word4 = (cp5.get(Textfield.class,"RING4").getText()).toUpperCase();
   cp5.get(Textfield.class,"RING4").clear();
   Word2Bin(word4,memory4);
}

void controlEvent(ControlEvent theEvent) {
  if (theEvent.isAssignableFrom(Textfield.class)) {
    Textfield t = (Textfield)theEvent.getController();

    println("Вы ввели: "
      +t.getName()+"': "+t.getStringValue());    
  }
}

void Word2Bin(String word, int[] memory){
  String abc = "_ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789 *(),.";
  String bin_code = "";
  int place;
  word = word.toUpperCase();
  
  for(int i = 0; i<word.length(); i++){
    
    place = abc.indexOf(word.charAt(i));
    bin_code = bin_code + (binary(place,10));}
    
  for(int i = 0; i<bin_code.length(); i++){
    memory[i] = (bin_code.charAt(i));}}
