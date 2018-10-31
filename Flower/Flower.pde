int r=60;


void setup() {
  size(600,400);
  background(#43AF76);
}

void draw(){
int numPetals = 5;
  fill(#FFA005);
  for (float i=0;i<PI*2;i+=2*PI/numPetals) {
  ballX=width/2 + r*cos(i);
  ballY=height/2 + r*sin(i);
  ellipse(ballX,ballY,r,r); 
  }
  fill(200,0,255);
  ellipse(width/2,height/2,r*1.2,r*1.2);
  
void flower (float r, int n_petals, float x, float y, int petalColor) {
float ballX;
float ballY;
  fill(petalColor);
  for (float i=0;i<PI*2;i+=2*PI/numPetals) {
  ballX=width/2 + r*cos(i);
  ballY=height/2 + r*sin(i);
  ellipse(ballX,ballY,r,r); 
  }
  fill(200,0,255);
  ellipse(x,y,r*1.2,r*1.2);
  }
  
}  
 
