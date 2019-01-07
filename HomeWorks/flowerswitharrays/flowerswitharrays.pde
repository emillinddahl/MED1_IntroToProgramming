//Flower myFlower1;
//Flower myFlower2;
//Flower myFlower3;

Flower[] myFlower = new Flower[12];
void setup() {
  size(1200,800);

 
  int _r1=60;
  int _petals=7;
  float _x=width/2;
  float _y=height/2;
  int _pc=#FFA000;
 // myFlower1 = new Flower(_r1,_petals,random(width),random(height),_pc);
  //myFlower2 = new Flower(_r1,_petals,random(width),random(height),_pc);
  //myFlower3 = new Flower(_r1,_petals,random(width),random(height),_pc);
    for(int i =0; i<myFlower.length;i++){
      myFlower[i] = new Flower(_r1,_petals,random(width),random(height),_pc);
    }
}

void draw() {
    background(#5EE3C2);
    /*
    myFlower1.display();
    myFlower1.move();
    myFlower1.bounce();
    myFlower2.display();
    myFlower2.move();
    myFlower2.bounce();
    myFlower3.display();
    myFlower3.move();
    myFlower3.bounce();
    */
    for(int i =0; i<myFlower.length;i++){
      myFlower[i].display();
      myFlower[i].move();
      myFlower[i].bounce();
    }
      
      
}
