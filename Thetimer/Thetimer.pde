Timer startTimer;

void setup() {
  
  size(1200,800);
  startTimer = new Timer(0);
}

void draw() {
  background(200);
  startTimer.countUp();
  fill(0);
  text(startTimer.getTime(),20,20);
  
}
