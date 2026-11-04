import processing.sound.*;

void setup() {
  fullScreen();
  imageMode(CENTER);
  rectMode(CENTER);
  noSmooth();
  frameRate(60);

  cargarImagenes();
  cargarSonidos();
  cargarFramesVidas();

  fuenteBoton = createFont("font_botones_r.ttf", 42);
  fuenteHistoria = createFont("font_historia.ttf", 40);
  capaTexto = createGraphics(width, height);
  capaTexto.smooth(3);
  textFont(fuenteBoton);

  GestorPantallas = new Pantallas();
  jugador = new Naves(Nave_jugador, 0, width / 2, height + 64);
  crearEnemigos();
  crearBotonesMenu();

  musicaMenu.loop();
  musicaMenu.amp(0.5);
}

void draw() {
  actualizarFondo();
  dibujarFondo(fondoY);

  if (pantalla == 1) {
    aparienciaMenu();
  } else if (pantalla == 1.5) {
    dibujarHistoria();
  } else if (pantalla == 2) {
    dibujarJuego();
  } else if (pantalla == 3) {
    GestorPantallas.DibujarHowToPlay();
  } else if (pantalla == 4) {
    GestorPantallas.dibujarConfiguracion();
  } else {
    GestorPantallas.dibujarCreditos();
  }
}

void actualizarFondo() {
  if (pantalla == 2 && !juegoPausado && !juegoGanado && !gameOver) {
    fondoY += velocidadFondo;
    if (fondoY >= height) {
      fondoY -= height;
    }
  } else if (pantalla != 2) {
    fondoY = height / 2;
  }
}

void reiniciarPartida() {
  juegoGanado = false;
  victoriaSonada = false;
  gameOver = false;
  juegoPausado = false;
  jugador.x = width / 2;
  jugador.y = height - 100;

  for (int i = 0; i < maxDisparos; i++) {
    balaActiva[i] = false;
  }
  ultimoDisparo = 0;
  inicioCooldown = 0;
  duracionCooldown = 0;
  espacio = false;
  arriba = false;
  abajo = false;
  izquierda = false;
  derecha = false;

  direccionEnemigo[0] = 1;
  direccionEnemigo[1] = -1;
  direccionEnemigo[2] = 1;
  crearEnemigos();

  cantidadVidas = 3;
  Puntos = 0;
  aliadosCaidos = 0;
  scroll = 0;
}

boolean sobreRect(float cx, float cy, float w, float h) {
  return mouseX >= cx - w / 2 && mouseX <= cx + w / 2 &&
    mouseY >= cy - h / 2 && mouseY <= cy + h / 2;
}

void volverAlMenu() {
  musicaJuego.stop();
  musicaMenu.loop();
  musicaMenu.amp(0.5);
  juegoPausado = false;
  pantalla = 1;
}
