// ---------- Interfaz de botones ----------

float radioEsquinas = 50;

String[] etiquetasMenu = {"START GAME", "HOW TO PLAY", "SETTINGS", "CREDITS"};
String[] etiquetasDificultad = {"FÁCIL", "NORMAL", "DIFÍCIL"};
String[] etiquetasVelocidad = {"LENTA", "NORMAL", "RÁPIDA"};

Boton[] botonesMenu = new Boton[etiquetasMenu.length];
Boton[] botonesDificultad = new Boton[etiquetasDificultad.length];
Boton[] botonesVelocidad = new Boton[etiquetasVelocidad.length];

Boton botonPausa;
Boton botonContinuar;
Boton botonInicio;
Boton botonAtras;
Boton botonHistoria;
Boton botonSi;
Boton botonNo;

PFont fuenteBoton;

boolean sobreRect(float cx, float cy, float w, float h) {
  return mouseX >= cx - w/2 && mouseX <= cx + w/2 && mouseY >= cy - h/2 && mouseY <= cy + h/2;
}

class Boton {
  float x, y, w, h;
  String contenido;
  float nivelBrillo = 0;
  float velocidadBrillo = 250;
  float Tamaño, Radio;
  boolean sobreBoton = false;
  boolean seleccionado = false;
  color Color, Fondo, Texto;

  Boton(float nx, float ny, float nw, float nh, String ncontenido, color nColor, color nFondo, color nTexto, float nTamaño, float nRadio) {
    x = nx;
    y = ny;
    w = nw;
    h = nh;
    contenido = ncontenido;
    Color = nColor;
    Fondo = nFondo;
    Texto = nTexto;
    Tamaño = nTamaño;
    Radio = nRadio;
  }

  void dibujarBoton() {
    rectMode(CENTER);
    textAlign(CENTER, CENTER);
    textFont(fuenteBoton, Tamaño);
    sobreBoton = sobreRect(x, y, w, h);

    if (sobreBoton) nivelBrillo = min(nivelBrillo + velocidadBrillo, 255);
    else nivelBrillo = max(nivelBrillo - velocidadBrillo, 0);

    if (seleccionado) stroke(#00FFFF);
    else stroke(Color);

    if (sobreBoton || seleccionado) strokeWeight(3);
    else strokeWeight(2);

    fill(Fondo);
    rect(x, y, w, h, Radio);

    if (seleccionado) {
      fill(#00FFFF, 100);
      rect(x, y, w, h, Radio);
    }

    if (nivelBrillo > 0) {
      fill(Color, nivelBrillo);
      rect(x, y, w, h, Radio);
    }

    if (nivelBrillo > 127) fill(0);
    else if (seleccionado) fill(#00FFFF);
    else fill(Texto);
    text(contenido, x, y);

    fill(255);
    stroke(0);
    strokeWeight(1);
    textAlign(LEFT, BASELINE);
  }
}

void crearBotones() {
  float[] posicionesX = {width/2 - 80, width/2 + 35, width/2 + 160};
  float[] anchos = {100, 110, 110};

  for (i = 0; i < etiquetasMenu.length; i++) {
    botonesMenu[i] = new Boton(width/2, 480 + i * 80, 400, 50, etiquetasMenu[i], #FFED00, color(0, 0), #FFED00, 42, radioEsquinas);
  }

  for (i = 0; i < 3; i++) {
    botonesDificultad[i] = new Boton(posicionesX[i], height/2 - 80, anchos[i], 38, etiquetasDificultad[i], #00FFFF, color(20, 25, 45), color(200), 16, 8);
    botonesVelocidad[i] = new Boton(posicionesX[i], height/2, anchos[i], 38, etiquetasVelocidad[i], #00FFFF, color(20, 25, 45), color(200), 16, 8);
  }

  botonPausa = new Boton(width - 70, 45, 90, 40, "|| PAUSE", #00FFFF, color(10, 15, 30, 200), #00FFFF, 18, 10);
  botonContinuar = new Boton(width/2, height/2 + 5, 200, 44, "CONTINUE", #00FF66, color(10, 30, 20, 200), #00FF66, 20, 10);
  botonInicio = new Boton(width/2, height/2 + 65, 200, 44, "HOME", #FF4444, color(30, 10, 10, 200), #FF4444, 20, 10);
  botonAtras = new Boton(width/2, height - 100, 160, 50, "BACK", #FF4000, #0F0F0B, #FFFFFF, 24, 12);
  botonHistoria = new Boton(width/2 - 30, height/2 + 80, 160, 38, "HISTORIA", #FF7700, color(255, 119, 0, 80), #FF7700, 16, 10);
  botonSi = new Boton(width/2 - 50, height/2 + 150, 80, 60, "SI", #FFED00, #0F0F0B, #FFFFFF, 24, 10);
  botonNo = new Boton(width/2 + 50, height/2 + 150, 80, 60, "NO", #FFED00, #0F0F0B, #FFFFFF, 24, 10);
}
