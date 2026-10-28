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
<<<<<<< Updated upstream
=======

void dibujarFondo(float fondoY) {
  imageMode(CORNER);
  if (fondoY >= height) fondoY -= height;
  int yy = int(fondoY);

  if (frameCount % velTitileo == 0) {
    frameEstrellas = (frameEstrellas + 1) % estrellas.length;
  }

  image(fondo, 0, yy, width, height);
  image(fondo, 0, yy - height, width, height);
  image(estrellas[frameEstrellas], 0, yy, width, height);
  image(estrellas[frameEstrellas], 0, yy - height, width, height);

  imageMode(CENTER);   // vuelve al modo que usa todo lo demás
}
>>>>>>> Stashed changes
