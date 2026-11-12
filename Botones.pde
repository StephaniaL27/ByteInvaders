// ---------- Interfaz de botones ----------

float radioEsquinas = 50;
String[] opcionesMenu = {"START GAME", "HOW TO PLAY", "SETTINGS", "CREDITS"};
String[] opcionesDificultad = {"FÁCIL", "NORMAL", "DIFÍCIL"};
String[] opcionesVelocidad = {"LENTA", "NORMAL", "RÁPIDA"};
Boton[] botonesMenu = new Boton[opcionesMenu.length];
Boton[] botonesDificultad = new Boton[opcionesDificultad.length];
Boton[] botonesVelocidad = new Boton[opcionesVelocidad.length];
Boton botonPause;
Boton botonContinue;
Boton botonHome;
Boton botonBack;
Boton botonHistoria;
Boton botonSi;
Boton botonNo;
PFont fuenteBoton;
boolean estaDentroRectangulo(float x, float y, float w, float h) {
  return mouseX >= x - w / 2 && mouseX <= x + w / 2 && mouseY >= y - h / 2 && mouseY <= y + h / 2;
}

class Boton {
  float x, y, w, h;
  String contenido;
  color colorPrincipal, base, cadena;
  float tamaño, radio;
  boolean cursorEncima = false;
  boolean seleccionado = false;
  float nivelBrillo = 0;
  float velocidadBrillo = 250;

  Boton(float x, float y, float w, float h, String contenido, color colorPrincipal, color base, color cadena, float tamaño, float radio) {
    this.x = x;
    this.y = y;
    this.w = w;
    this.h = h;
    this.contenido = contenido;
    this.colorPrincipal = colorPrincipal;
    this.base = base;
    this.cadena = cadena;
    this.tamaño = tamaño;
    this.radio = radio;
  }

  void dibujarBoton() {
    textAlign(CENTER, CENTER);
    textFont(fuenteBoton, tamaño);
    cursorEncima = estaDentroRectangulo(x, y, w, h);
    nivelBrillo = cursorEncima ? min(nivelBrillo + velocidadBrillo, 255) : max(nivelBrillo - velocidadBrillo, 0);
    stroke(seleccionado ? #00FFFF : colorPrincipal);
    strokeWeight(cursorEncima || seleccionado ? 3 : 2);
    fill(base);
    rect(x, y, w, h, radio);
    if (seleccionado) {
      fill(#00FFFF, 100);
      rect(x, y, w, h, radio);
    }
    if (nivelBrillo > 0) {
      fill(colorPrincipal, nivelBrillo);
      rect(x, y, w, h, radio);
    }
    if (nivelBrillo > 127) {
      fill(0);
    } else if (seleccionado) {
      fill(#00FFFF);
    } else {
      fill(cadena);
    }
    text(contenido, x, y);
  }
}

void crearBotones() {
  float[] posicionesX = {width / 2 - 80, width / 2 + 35, width / 2 + 160};
  float[] anchos = {100, 110, 110};
  for (i = 0; i < opcionesMenu.length; i++) {
    botonesMenu[i] = new Boton(width / 2, 480 + i * 80, 400, 50, opcionesMenu[i], #FFED00, color(0, 0), #FFED00, 42, radioEsquinas);
  }
  for (i = 0; i < 3; i++) {
    botonesDificultad[i] = new Boton(posicionesX[i], height / 2 - 80, anchos[i], 38, opcionesDificultad[i], #00FFFF, color(20, 25, 45), color(200), 16, 8);
    botonesVelocidad[i] = new Boton(posicionesX[i], height / 2, anchos[i], 38, opcionesVelocidad[i], #00FFFF, color(20, 25, 45), color(200), 16, 8);
  }
  botonesDificultad[1].seleccionado = true;
  botonesVelocidad[1].seleccionado = true;
  botonPause = new Boton(width - 70, 45, 90, 40, "|| PAUSE", #00FFFF, color(10, 15, 30, 200), #00FFFF, 18, 10);
  botonContinue = new Boton(width / 2, height / 2 + 5, 200, 44, "CONTINUE", #00FF66, color(10, 30, 20, 200), #00FF66, 20, 10);
  botonHome = new Boton(width / 2, height / 2 + 65, 200, 44, "HOME", #FF4444, color(30, 10, 10, 200), #FF4444, 20, 10);
  botonBack = new Boton(width / 2, height - 100, 160, 50, "BACK", #FF4000, #0F0F0B, #FFFFFF, 24, 12);
  botonHistoria = new Boton(width / 2 - 30, height / 2 + 80, 160, 38, "HISTORIA", #FF7700, color(255, 119, 0, 80), #FF7700, 16, 10);
  botonSi = new Boton(width / 2 - 50, height / 2 + 150, 80, 60, "SÍ", #FFED00, #0F0F0B, #FFFFFF, 24, 10);
  botonNo = new Boton(width / 2 + 50, height / 2 + 150, 80, 60, "NO", #FFED00, #0F0F0B, #FFFFFF, 24, 10);
}
