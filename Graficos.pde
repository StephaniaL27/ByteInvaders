// ---------- Recursos gráficos ----------

PImage tituloMenu;
PImage fondo;
PImage corazones;
PImage naveJugador;
PImage naveVerde;
PImage naveGris;
PImage naveRoja;
PImage[] estrellas = new PImage[8];

// ---------- Fondo animado ----------

int frameActualEstrellas = 0;
int intervaloEstrellas = 6;
float velocidadFondo = 5;
float fondoY = -velocidadFondo;

// ---------- HUD ----------

int FrameActualVidas = 0;
PImage[] framesVidas = new PImage[8];

void cargarImagenes() {
  tituloMenu = loadImage("titulo_byteinvaders.png");
  corazones = loadImage("corazones.png");
  naveJugador = loadImage("nave_jugador.png");
  naveVerde = loadImage("nave_verde.png");
  naveGris = loadImage("nave_gris.png");
  naveRoja = loadImage("nave_roja.png");
  fondo = loadImage("fondo_loop_1920x1080.png");
  for (int i = 0; i < estrellas.length; i++) {
    estrellas[i] = loadImage("estrellas_" + i + ".png");
  }
}

void cargarFramesNaves() {
  PImage[] imagenes = {naveJugador, naveVerde, naveGris, naveRoja};
  for (int i = 0; i < imagenes.length; i++) {
    for (int j = 0; j < framesNaves[i].length; j++) {
      framesNaves[i][j] = imagenes[i].get(j * 64, 0, 64, 64);
    }
  }
}

void cargarFramesVidas() {
  for (int i = 0; i < framesVidas.length; i++) {
    framesVidas[i] = corazones.get(i * 32, 0, 32, 32);
  }
}

void actualizarFondo() {
  if (pantalla != 1.2) {
    fondoY = height / 2;
  } else if (!juegoPausado && !juegoGanado && !gameOver) {
    fondoY += velocidadFondo;
    if (fondoY >= height) {
      fondoY -= height;
    }
  }
}

void dibujarFondo(float desplazamiento) {
  imageMode(CORNER);
  if (!juegoPausado && frameCount % intervaloEstrellas == 0) {
    frameActualEstrellas = (frameActualEstrellas + 1) % estrellas.length;
  }
  image(fondo, 0, int(desplazamiento), width, height);
  image(fondo, 0, int(desplazamiento) - height, width, height);
  image(estrellas[frameActualEstrellas], 0, int(desplazamiento), width, height);
  image(estrellas[frameActualEstrellas], 0, int(desplazamiento) - height, width, height);
  imageMode(CENTER);
}

void dibujarVidas() {
  if (!juegoPausado && frameCount % intervaloEstrellas == 0) {
    FrameActualVidas = (FrameActualVidas + 1) % framesVidas.length;
  }
  for (int i = 0; i < AUG.vidas; i++) {
    image(framesVidas[FrameActualVidas], width / 2 - escalar(900) + i * escalar(60), height / 2 + escalar(480), escalar(60), escalar(60));
  }
}
