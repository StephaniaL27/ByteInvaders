String[] textoBotones = {
  "START GAME",
  "HOW TO PLAY",
  "SETTINGS",
  "CREDITS"
};

float[] botonX = new float[4];
float[] botonY = new float [4];

float ancho = 400;
float alto = 50;

Boton[] botones_menu = new Boton[4];

void apariencia_menu() {
  float x = 0;
  float y = 0;
  for (int i = 0; i< planetas.length; i++) {
    switch(i) {
    case 0:
      x = 1300;
      y = 650;
      break;
    case 1:
      x = 180;
      y = 150;
      break;
    case 2:
      x = 1350;
      y = 200;
      break;
    case 3:
      x = 10;
      y = 1000;
      break;
    }
    mov_planetas(planetas[i], x, y);
  }

  image(titulo_menu, width/2, height*0.25, 1100, 300);

  for (int i = 0; i < textoBotones.length; i++) {
    botones_menu[i].dibujarBoton(botonX[i], botonY[i], ancho, alto, textoBotones[i]);
  }

  for (int i = 0; i < textoBotones.length; i++) {
  }
}


void mov_planetas(PImage planeta, float x, float y/*, float angulo*/) {
  /*pushMatrix();
   translate(x, y);
   rotate(radians(angulo));
   image(planeta, 0, 0);
   popMatrix();*/
  image(planeta, x, y);
}
