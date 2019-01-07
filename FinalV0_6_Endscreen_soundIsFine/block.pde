class Hblock {
  int hblockX = 700;
  int hblockY = 1000;
  int hblockW = 50;
  int hblockH = 50;
  int speedX = 1;
  int speedY = 1;


  Hblock(int tempx, int tempy, int tempW, int tempH, int tempspeedX, int tempspeedY) {

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


  //magic number?
  void ifCollision () {
    int initiallife = 100;
    if (dist(mouseX, mouseY, hblockX, hblockY) < (hblockW*2) && life < (initiallife-0.02)) {
      life+=0.2;
    }
  }
}
