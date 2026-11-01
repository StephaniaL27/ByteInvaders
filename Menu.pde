String[] Botones_menu = {
  "START GAME",
  "HOW TO PLAY",
  "SETTINGS",
  "CREDITS"
};

float[] boton_x = new float[4];
float[] boton_y = new float [4];

float ancho = 400;
float alto = 50;

Boton[] botones_menu = new Boton[4];

void apariencia_menu() {
  image(Titulo_menu, width/2, height*0.25, 1100, 300);

  for (int i = 0; i < Botones_menu.length; i++) {
    botones_menu[i].dibujarBoton(boton_x[i], boton_y[i], ancho, alto, Botones_menu[i]);
  }
}
