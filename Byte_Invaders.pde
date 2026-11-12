import processing.sound.*;

// ---------- Contadores globales ----------

int i = 0;
int j = 0;

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
  crearPaneles();
    AUG = new Nave(width / 2, height + 128, 6, 0, 22, 3, 1, 0, 0);
}

void draw() {
  actualizarFondo();
  dibujarFondo(fondoY);
  controlarMusica();
  if (pantalla == 0) {
    image(tituloMenu, width/2, height * 0.25, 1100, 300);
    for (i = 0; i < botonesMenu.length; i++) {
      botonesMenu[i].dibujarBoton();
    }
  } else if (pantalla == 1.1) {
    dibujarHistoria();
  } else if (pantalla == 1.2) {
    dibujarJuego();
  } else if (pantalla == 2) {
    howToPlay();
  } else if (pantalla == 3) {
    Settings();
  } else if (pantalla == 4) {
    Credits();
  }
}
