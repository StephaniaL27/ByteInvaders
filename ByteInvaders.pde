import processing.sound.*;

// ---------- Contadores globales ----------

int i = 0;
int j = 0;

// ---------- Escala ----------

float escala;

// Medidas del diseño en píxeles de 1920 × 1080. escalar() las ajusta a la pantalla real.
// Letras: normal, 25; título 3, 35; título 2, 45; título 1, 50.
// Separaciones: pequeña 15, mediana 30, grande 45.
// Paso entre filas de texto: 40 (letra normal + separación pequeña).
// Botones (esquinas redondas: radio = alto):
// Pequeño 300 × 40 (letra 25)
// Mediano 250 × 45 (letra 35)
// Grande  500 × 60 (letra 50)
// Separación entre botones: 30.
// Paneles: 1280 × 720, radio 30. Ventana de pausa: 480 × 270.
// HUD: corazones de 60, caja de 420 × 90 con margen de 15.

float escalar(float pixeles) {
  return pixeles * escala;
}

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
  AUG = new Nave(width / 2, height + 128, 6, 0, 22, 3, 1, 0, 0);
}

void draw() {
  actualizarFondo();
  dibujarFondo(fondoY);
  ecualizador();
  controlarOSTs();
  if (pantalla == 0) {
    image(tituloMenu, width / 2, height / 2 - escalar(270), escalar(1100), escalar(300));
    for (i = 0; i < botonMenu.length; i++) {
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
