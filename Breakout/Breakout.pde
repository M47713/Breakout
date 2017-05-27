barra[] b;
boolean c = false;
int bastaoX =0;
int bolaX = 200;
int bolaY = 200;
int dY = 1;
int dX = 5;
void setup() {
  // rectMode(CENTER);
  size(600, 600);
  b = new barra[8];

  for (int i = 0; i< 8; i++) {
    b[i] = new barra();
  }
}
void draw() {
  background(0);
  for ( int i = 0; i <8; i++) {

    b[i].barrinha( 0 +i*80, 40);
  }
    bastaoX = mouseX-50;
  if (bastaoX >= width - 100 ) {
    bastaoX = width - 100;
  } else if (bastaoX <= 0 ) {
    bastaoX = 0;
  }
  if (bolaX >= bastaoX  && bolaX <= bastaoX +100 && bolaY == 572) {
    dY = - dY;
  }

  for (int i = 0; i <8; i++) {
    if (b[i].cor == 255) {
      if (bolaX >= b[i].x && bolaX <= b[i].x + 52 && bolaY >= b[i].y && bolaY <= b[i].y + 32 && bolaY >= b[i].y-8) {
        b[i].cor = 0;
        if(sqrt(dY*dY)<16){
        dY = dY*2;
      }
        dY = - dY;
      }
    }
  }
  fill(255);
  ellipse(bolaX, bolaY, 20, 20);
  bolaX = bolaX + dX;
  bolaY = bolaY + dY;
  if (bolaX >= 590 || bolaX <= 10) {
    dX = -dX;
  }
  if (bolaY <= 10) {
    dY = -dY;
  }
  if (bolaY>600){
   bolaY = height/2;
   bolaX = width/2;
  }
  fill(255);
  rect(bastaoX, 580, 100, 20);
}
class barra {
  int cor = 255;
  int x = 0;
  int y = 0;
  void barrinha(int d, int h) {
    x = d;
    y = h;

    fill(cor);
    rect( x, h, 40, 20);
  }
}