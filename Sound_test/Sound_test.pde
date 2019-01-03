import processing.sound.*;
soundFile file;

void setup() {
 size(500,500);
 background(200);
 
 file = new soundFile(this,"nice.wav");
 file.play();
     
}
