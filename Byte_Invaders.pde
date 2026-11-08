import processing.sound.*;

// ---------- Contadores globales ----------

int i = 0;
int j = 0;
int k = 0;

void setup() {
  fullScreen();
  imageMode(CENTER);
  rectMode(CENTER);
  noSmooth();
  frameRate(60);

  cargarImagenes();
  cargarFramesNaves();
  cargarSonidos();
  cargarFramesVidas();

  fuenteBoton = createFont("font_botones_r.ttf", 42);
  fuenteHistoria = createFont("font_historia.ttf", 40);
  capaTexto = createGraphics(width, height);
  capaTexto.smooth(3);
  textFont(fuenteBoton);

  crearTextos();
  crearBotones();
  crearPantallas();

  jugador = new Naves(0, width / 2, height + 64);
  crearEnemigos();
}

void draw() {
  actualizarFondo();
  dibujarFondo(fondoY);
  controlarMusica();

  if (pantalla == 1) {
    image(tituloMenu, width/2, height * 0.25, 1100, 300);
    for (i = 0; i < botonesMenu.length; i++) {
      botonesMenu[i].dibujarBoton();
    }
  } else if (pantalla == 1.5) {
    dibujarHistoria();
  } else if (pantalla == 2) {
    dibujarJuego();
  } else if (pantalla == 3) {
    DibujarHowToPlay();
  } else if (pantalla == 4) {
    dibujarConfiguracion();
  } else {
    dibujarCreditos();
  }
}
