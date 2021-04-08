public class ring{
  PVector[] vertices = new PVector[4];
  ring(){}
  boolean flag = false;
  boolean pressed = true;
  
  void sector(float x1, float y1, float x2, float y2, float x3, float y3, float x4, float y4){
     
    
     
     vertices[0] = new PVector(x1,y1);
     vertices[1] = new PVector(x2,y2);
     vertices[2] = new PVector(x3,y3);
     vertices[3] = new PVector(x4,y4);
     
     boolean hit = polyPoint(x1,y1,x2,y2,x3,y3,x4,y4);
     
    if(hit && mousePressed) {flag = !flag;}
    if (flag) {fill(216,113,52);}
    else{fill(245,242,242);}
  
     
     beginShape();
    for (PVector v : vertices) {
    vertex(v.x, v.y);}
     endShape(CLOSE);
  
  }

   boolean polyPoint(float x1, float y1, float x2, float y2, float x3, float y3, float x4, float y4) {
     boolean collision = false;
  
     PVector[] points = new PVector[4];
     
     points[0] = new PVector(x1,y1);
     points[1] = new PVector(x2,y2);
     points[2] = new PVector(x3,y3);
     points[3] = new PVector(x4,y4);

  // go through each of the vertices, plus
  // the next vertex in the list
  int next = 0;
  for (int current=0; current<4; current++) {

    // get next vertex in list
    // if we've hit the end, wrap around to 0
    next = current+1;
    if (next == 4) next = 0;

    // get the PVectors at our current position
    // this makes our if statement a little cleaner
    PVector vc = points[current];    // c for "current"
    PVector vn = points[next];       // n for "next"
    

    // compare position, flip 'collision' variable
    // back and forth
    if (((vc.y >= mouseY && vn.y < mouseY) || (vc.y < mouseY && vn.y >= mouseY)) &&
         (mouseX < (vn.x-vc.x)*(mouseY-vc.y) / (vn.y-vc.y)+vc.x)) {
            collision = !collision;
    }
  }
  return collision;
  
}

void mouseReleased(){
    pressed = !pressed;}
}
