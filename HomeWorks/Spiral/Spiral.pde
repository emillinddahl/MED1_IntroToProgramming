float r = 0;
float theta = 0;
 float time = 0.0;
int bigger = 35;
void setup() {
  size(1000, 1000);
  background(255);
  
  for(float r=0.01;r<width;r+=0.2){
   float x = r * cos(theta);
  float y = r * sin(theta);
float size = noise(theta)*bigger;
println(size);
  // Draw an ellipse at x,y
  noStroke();
  fill(0,0,random(20,250));
  // Adjust for center of window
  ellipse(x+width/2, y+height/2, size, size); 

  // Increment the angle
  theta += 0.02;
  // Increment the radius
 // r += 0.2;
  noise(theta);
  }
 
 
}

void draw() {
}
  // Polar to Cartesian conversion
  /*
  float x = r * cos(theta);
  float y = r * sin(theta);
float size = noise(theta)*bigger;
println(size);
  // Draw an ellipse at x,y
  noStroke();
  fill(0,0,random(20,250));
  // Adjust for center of window
  ellipse(x+width/2, y+height/2, size, size); 

  // Increment the angle
  theta += 0.02;
  // Increment the radius
  r += 0.2;
  noise(theta);
}
*/
