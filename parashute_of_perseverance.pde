import controlP5.*;

ControlP5 cp5;

String word1 = "";
String word2 = "";
String word3 = "";
String word4 = "";

ring[] fragment1 = new ring[100]; boolean[] memory1 = new boolean[100];
ring[] fragment2 = new ring[100]; boolean[] memory2 = new boolean[100];
ring[] fragment3 = new ring[100]; boolean[] memory3 = new boolean[100];
ring[] fragment4 = new ring[100]; boolean[] memory4 = new boolean[100];

int x_pos = 600;
int y_pos = 500;


void setup(){

  size(2000,1000);
  background(100,100,100);
  
  for (int i = 0; i < fragment1.length; i++ ) {
   fragment1[i]= new ring(); memory1[i] = false; 
   fragment2[i]= new ring(); memory2[i] = false;
   fragment3[i]= new ring(); memory3[i] = false;
   fragment4[i]= new ring(); memory4[i] = false;}
  
  cp5 = new ControlP5(this);
  
  for(int i = 1; i<5; i++){
           cp5.addTextfield("RING"+i)
                   .setPosition(1300, 100+100*i)
                   .setSize(200, 20)
                   .setFont(createFont("arial",20))
                   .setFocus(true);
  
  
  //myTextfield4.setAutoClear(true).keepFocus(true);
  //myTextfield3.setAutoClear(true).keepFocus(true);

  cp5.addButton("clear"+i, 1000, 1200, 100+100*i, 70, 20).setFont(createFont("arial",13));
  cp5.addButton("submit"+i, 1400, 1530, 100+100*i, 60, 20).setFont(createFont("arial",13));}
  
 
                   
  
}

void draw(){

  int num1=0;
  int num2=0;
  int num3=0;
  int num4=0;
  
  println(WordSplit(word1));
  
  
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

void clear1(int theValue) {
  cp5.get(Textfield.class,"RING1").clear();
}

void clear2(int theValue) {
  cp5.get(Textfield.class,"RING2").clear();
}

void clear3(int theValue) {
  cp5.get(Textfield.class,"RING3").clear();
}

void clear4(int theValue) {
  cp5.get(Textfield.class,"RING4").clear();
}

void submit1(int theValue) {

   word1 = (cp5.get(Textfield.class,"RING1").getText()).toUpperCase();
   cp5.get(Textfield.class,"RING1").clear();
}

void submit2(int theValue) {

   word2 = (cp5.get(Textfield.class,"RING2").getText()).toUpperCase();
   cp5.get(Textfield.class,"RING2").clear();
}

void submit3(int theValue) {

   word3 = (cp5.get(Textfield.class,"RING3").getText()).toUpperCase();
   cp5.get(Textfield.class,"RING3").clear();
}

void submit4(int theValue) {

   word4 = (cp5.get(Textfield.class,"RING4").getText()).toUpperCase();
   cp5.get(Textfield.class,"RING4").clear();
}

void controlEvent(ControlEvent theEvent) {
  if (theEvent.isAssignableFrom(Textfield.class)) {
    Textfield t = (Textfield)theEvent.getController();

    println("Вы ввели: "
      +t.getName()+"': "+t.getStringValue());
      

    
  }
}

String[] WordSplit(String word){
  int num = word.length();
  String[] bin = new String[num];
  
  
  for(int i = 0; i < num; i++){
    bin[i] = Word2Bin(char(word.charAt(i)));}
   return bin;}
    
  
  String Word2Bin(char word){
  String abc = "_ABCDEFGHIJKLMNOPQRSTUVWXYZ";
  int place = abc.indexOf(word);
  return binary(place,10);}
  
  
