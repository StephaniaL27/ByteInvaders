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
  image(titulo_menu, width/2, height*0.25, 1100, 300);

  for (int i = 0; i < textoBotones.length; i++) {
    botones_menu[i].dibujarBoton(botonX[i], botonY[i], ancho, alto, textoBotones[i]);
  }

  for (int i = 0; i < textoBotones.length; i++) {
  }
}
