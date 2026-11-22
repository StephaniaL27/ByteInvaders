import processing.sound.*;

void setup() {
  fullScreen();
  imageMode(CENTER);
  rectMode(CENTER);
  noSmooth();
  frameRate(60);
  escala = min(width / 1920.0, height / 1080.0);
  cargarImagenes();
  cargarFramesNaves();
  cargarSonidos();
  cargarFramesVidas();
  fuenteBoton = createFont("font_botones_r.ttf", 30);
  fuenteHistoria = createFont("font_historia.ttf", 30);
  capaTexto = createGraphics(width, height);
  capaTexto.smooth(3);
  textFont(fuenteBoton);
  crearTextos();
  crearBotones();
  crearRecuadros();
  AUG = new Nave(width / 2, height + 128, 6, 0, 22, 3, 0, 0);
}

void draw() {
  actualizarFondo();
  dibujarFondo(fondoY);
  ecualizador();
  controlarOSTs();
  if (pantalla == 0) {
    image(tituloMenu, width / 2, height / 2 - escalar(270), escalar(1100), escalar(300));
    for (int i = 0; i < botonMenu.length; i++) {
      botonMenu[i].dibujarBoton();
    }
  } else if (pantalla == 1.1) {
    ejecutarHistoria();
  } else if (pantalla == 1.2) {
    ejecutarPartida();
  } else if (pantalla == 2) {
    dibujarInstrucciones();
  } else if (pantalla == 3) {
    dibujarAjustes();
  } else if (pantalla == 4) {
    dibujarCreditos();
  }
}
