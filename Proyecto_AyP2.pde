PImage[] planetas = new PImage[4];
PImage fondo_estrellas;
PImage titulo_menu;
PImage nave;
PImage estrellasf;

float pantalla = 1;

float x;
float y;

void setup() {
  fullScreen();
  imageMode(CENTER);

  fondo_estrellas = loadImage("fondo_estrellas.png");
  titulo_menu = loadImage("titulo_byteinvaders.png");
  for (int i = 0; i< planetas.length; i++) {
    planetas[i] = loadImage("planeta"+i+".png");
  }
  estrellasf = loadImage("estrellasf.png");
  nave = loadImage("nave.png");

  font_botones_r = createFont("font_botones_r.ttf", 42);
  x = width / 2;
  y = height - 200;
  //Botones del menú
  float distancia = 80;
  for (int i = 0; i < textoBotones.length; i++) {
    botones_menu[i] = new Botones();
    botonX[i] = width/2;
    botonY[i] = 480+i*distancia;
  }
}

void draw() {
  background(#010005);
  image(fondo_estrellas, width/2, height/2, width-20, height-20);
  if (pantalla == 1) {

    apariencia_menu();
  } else if (pantalla == 2)
    image(nave, x, y, 100, 100);

  for (int i = 0; i < maxDisparos; i++) {
    if (balaAct[i]) {
      fill(#4080d2);
      rect(disparosX[i], disparosY[i], 5, 20);
      disparosY[i] -= velDisp;
    }

    if (disparosY[i] < 0) {
      balaAct[i] = false;
    }
  }

  if (Arriba == 1) {
    y = y - v;
  }
  if (Izquierda == 1) {
    x = x - v;
  }
  if (Abajo == 1) {
    y = y + v;
  }
  if (Derecha == 1) {
    x = x + v;
  }

  // Para definir el espacio en el que la nave pueda moverse,

  if (y == 0) {
    y = y + v;
  }
  if (x == 0) {
    x = x + v;
  }
  if (y == height) {
    y = y - v;
  }
  if (x == width) {
    x = x - v;
  }
}


void mousePressed() {
  if (pantalla == 1) {
    for (int i=0; i<textoBotones.length; i++) {
      boolean overButton = (
        mouseX >= botonX[i] - ancho / 2 &&
        mouseX <= botonX[i] + ancho / 2 &&
        mouseY >= botonY[i] - alto / 2 &&
        mouseY <= botonY[i] + alto / 2
        );

      if (overButton == true) {
        switch(i) {
        case 0:
          pantalla = 2;
          break;
        case 1:
          pantalla=3;
          break;
        case 2:
          pantalla=4;
          break;
        case 3:
          pantalla=5;
          break;
        }
      }
    }
  }
}
