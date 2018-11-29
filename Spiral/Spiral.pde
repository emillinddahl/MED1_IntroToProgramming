float r = 0;
float theta = 0;
 float time = 0.0;

void setup() {
  size(480, 270);
  background(255);
 
}

void draw() {
  // Polar to Cartesian conversion
  float x = r * cos(theta);
  float y = r * sin(theta);
float size = noise(theta)*10;
println(size);
  // Draw an ellipse at x,y
  noStroke();
  fill(0,0,random(20,250));
  // Adjust for center of window
  ellipse(x+width/2, y+height/2, size, size); 

  // Increment the angle
  theta += 0.01;
  // Increment the radius
  r += 0.1;
  noise(theta);
}
