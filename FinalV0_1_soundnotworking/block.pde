class hblock {
 int hblockX = 700;
 int hblockY = 1000;
 int hblockW = 50;
 int hblockH = 50;
 int speedX = 1;
 int speedY = 1;

  
  hblock(int tempx, int tempy, int tempW, int tempH, int tempspeedX, int tempspeedY) {
  
    hblockX = tempx;
    hblockY = tempy;
    hblockW = tempW;
    hblockH = tempH;
    speedX = tempspeedX;
    speedY = tempspeedY;
  }
  
  void display() {
   rect(hblockX, hblockY, hblockW, hblockH);  
  }
  
  void move() {
    hblockX += speedX;
  }
  
  void ifCollision () {
   if (dist(mouseX, mouseY, hblockX, hblockY) < 80 && life!=100) {
      life+=0.2;
   }
  }
}
