PImage titulo;

String[] textoBotones = {
  "START GAME",
  "HOW TO PLAY",
  "SETTINGS",
  "CREDITS"
};

float[] botonX = new float[4];
float[] botonY = new float [4];
float[] brillo = new float[4];
float ancho = 400;
float alto = 50;

Botones[] botones_menu = new Botones[4];

void apariencia_menu() {

  //Botones del menú
  float distancia = 80;

  for (int i = 0; i < textoBotones.length; i++) {
    botones_menu[i] = new Botones();

    botonX[i] = width/2;
    botonY[i] = 480+i*distancia;
    botones_menu[i].dibujarBoton(
      botonX[i],
      botonY[i],
      ancho,
      alto,
      textoBotones[i]
      );
  }
}
