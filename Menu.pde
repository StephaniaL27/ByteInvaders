class Boton {
  float x, y, w, h;
  String contenido;
  float nivelBrillo = 0;
  float velocidadBrillo = 250;
  boolean sobreBoton = false;

  Boton(float nx, float ny, float nw, float nh, String ncontenido) {
    x = nx;
    y = ny;
    w = nw;
    h = nh;
    contenido = ncontenido;
  }

  void dibujarBoton() {
    rectMode(CENTER);
    textAlign(CENTER, CENTER);
    textFont(fuenteBoton, 42);

    sobreBoton = sobreRect(x, y, w, h);
    if (sobreBoton) nivelBrillo = min(nivelBrillo + velocidadBrillo, 255);
    else nivelBrillo = max(nivelBrillo - velocidadBrillo, 0);

    stroke(#FFED00);
    strokeWeight(3);
    fill(255, 237, 0, nivelBrillo);
    rect(x, y, w, h, radioEsquinas);

    fill(sobreBoton ? 0 : #FFED00);
    text(contenido, x, y);
  }
}

void crearBotonesMenu() {
  float distancia = 80;
  String[] etiquetas = {"START GAME", "HOW TO PLAY", "SETTINGS", "CREDITS"};
  for (int i = 0; i < botonesMenu.length; i++) {
    botonesMenu[i] = new Boton(width / 2, 480 + i * distancia, 400, 50, etiquetas[i]);
  }
}

void aparienciaMenu() {
  image(tituloMenu, width / 2, height * 0.25, 1100, 300);
  for (int i = 0; i < botonesMenu.length; i++) {
    botonesMenu[i].dibujarBoton();
  }
}

void dibujarFondo(float desplazamiento) {
  imageMode(CORNER);

  if (frameCount % Velocidad_titileo == 0) {
    Frame_estrellas = (Frame_estrellas + 1) % estrellas.length;
  }

  image(fondo, 0, int(desplazamiento), width, height);
  image(fondo, 0, int(desplazamiento) - height, width, height);
  image(estrellas[Frame_estrellas], 0, int(desplazamiento), width, height);
  image(estrellas[Frame_estrellas], 0, int(desplazamiento) - height, width, height);
  imageMode(CENTER);
}
