class ball {
  int ballx = 200;
  int bally = 100;
  float speedX= 3;
  float speedY= 3;
  int ballsize = 50;
  int ballincrement = 100;

  ball(int tempx, int tempy, int tempsize, int tempspeedX, int tempspeedY) {
    ballx = tempx;
    bally = tempy;
    ballsize = tempsize;
    speedX = tempspeedX;
    speedY = tempspeedY;
  }

void checkIfCollision () {
   if (dist(mouseX, mouseY, ballx, bally) < 80) {
      life-=1;
   }
}

//void faster () {
  //speedX *=1.2;
 // speedY *=1.2;
//}

  void increase () {
    if (score >= 5) {
     if(speedX <= 6 && speedX >= -6) {
       speedX *=1.1;
       if (speedY <= 6 && speedY >= -6) {
        speedY *=1.1; 
       }
   }
   
      
     ballsize = ballincrement;
    }
  }

  void move() {
    bally += speedY;
    ballx += speedX;
  }
  void display() { 
    ellipse(ballx, bally, ballsize, ballsize); 

   // if (ballx+(ballsize/2) > width || ballx-(ballsize/2) < 0) {
     // speedX *= -1;
   // }
    //if (bally+(ballsize/2) > height || bally-(ballsize/2) < 0) {
     // speedY *= -1;
   // }
   if (ballx > width || ballx < 0) {
      speedX *= -1;
    }
    if (bally > height || bally < 0) {
      speedY *= -1;
    }
  }
}
