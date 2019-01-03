class Flower {
float speedx = 5;
float speedy = 5;
float ballX;
float ballY;
int rpetalColor = #A9E5D7;
int numPetals = 5;
  // variables
  
  float r;
  int n_petals;
  float x;
  float y;
  int petalColor;
  
 Flower(float temp_r, int temp_n_petals, float temp_x, float temp_y, int temp_petalColor) {
    r=temp_r;
    n_petals = temp_n_petals;
    x=temp_x;
    y=temp_y;
    petalColor=temp_petalColor;
  }
  
 void display () {

  fill(petalColor);
  for (float i=0;i<PI*2;i+=2*PI/numPetals) {
  ballX=x + r*cos(i);
  ballY=y + r*sin(i);
  ellipse(ballX,ballY,r,r); 
  }
  fill(200,0,255);
  ellipse(x,y,r*1.2,r*1.2);
  }
  
  
  

}
