 // ---------- Interfaz de botones ----------

String[] opcionesMenu = {"START GAME", "HOW TO PLAY", "SETTINGS", "CREDITS"};
String[] opcionesDificultad = {"FÁCIL", "NORMAL", "DIFÍCIL"};
Boton[] botonMenu = new Boton[opcionesMenu.length];
Boton[] botonDificultad = new Boton[opcionesDificultad.length];
Boton[] controlVolumen = new Boton[2];
Boton botonPausa;
Boton botonContinuar;
Boton botonInicio;
Boton botonVolver;
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
    if (seleccionado) {
      fill(#00FFFF, 100);
    } else if (nivelBrillo > 0) {
      fill(colorPrincipal, 60);
    } else {
      noFill();
    }
    rect(x, y, w, h, radio);
    fill(seleccionado ? #00FFFF : cadena);
    text(contenido, x, y);
  }
}

void crearBotones() {
  botonMenu[0] = new Boton(width / 2, height / 2, escalar(500), escalar(60), opcionesMenu[0], #FFED00, color(0, 0), #FFED00, escalar(50), escalar(60));
  botonMenu[1] = new Boton(width / 2, height / 2 + escalar(90), escalar(500), escalar(60), opcionesMenu[1], #FFED00, color(0, 0), #FFED00, escalar(50), escalar(60));
  botonMenu[2] = new Boton(width / 2, height / 2 + escalar(180), escalar(500), escalar(60), opcionesMenu[2], #FFED00, color(0, 0), #FFED00, escalar(50), escalar(60));
  botonMenu[3] = new Boton(width / 2, height / 2 + escalar(270), escalar(500), escalar(60), opcionesMenu[3], #FFED00, color(0, 0), #FFED00, escalar(50), escalar(60));
  botonDificultad[0] = new Boton(width / 2 - escalar(265), height / 2 - escalar(60), escalar(250), escalar(45), opcionesDificultad[0], #00FFFF, color(20, 25, 45), color(200), escalar(35), escalar(45));
  botonDificultad[1] = new Boton(width / 2, height / 2 - escalar(60), escalar(250), escalar(45), opcionesDificultad[1], #00FFFF, color(20, 25, 45), color(200), escalar(35), escalar(45));
  botonDificultad[2] = new Boton(width / 2 + escalar(265), height / 2 - escalar(60), escalar(250), escalar(45), opcionesDificultad[2], #00FFFF, color(20, 25, 45), color(200), escalar(35), escalar(45));
  botonDificultad[1].seleccionado = true;
  controlVolumen[0] = new Boton(width / 2 + escalar(390), height / 2 + escalar(20), escalar(25), escalar(25), "", #00FFFF, color(20, 25, 45), color(200), escalar(25), escalar(25));
  controlVolumen[1] = new Boton(width / 2 + escalar(390), height / 2 + escalar(100), escalar(25), escalar(25), "", #00FFFF, color(20, 25, 45), color(200), escalar(25), escalar(25));
  botonPausa = new Boton(width / 2 - escalar(570), height / 2 + escalar(480), escalar(60), escalar(60), "||", #00FFFF, color(10, 15, 30, 200), #00FFFF, escalar(50), escalar(60));
  botonContinuar = new Boton(width / 2, height / 2, escalar(250), escalar(45), "CONTINUE", #00FF66, color(10, 30, 20, 200), #00FF66, escalar(35), escalar(45));
  botonInicio = new Boton(width / 2, height / 2 + escalar(75), escalar(250), escalar(45), "HOME", #FF4444, color(30, 10, 10, 200), #FF4444, escalar(35), escalar(45));
  botonVolver = new Boton(width / 2, height / 2 + escalar(450), escalar(250), escalar(45), "BACK", #FF4000, #0F0F0B, #FFFFFF, escalar(35), escalar(45));
  botonHistoria = new Boton(width / 2, height / 2 + escalar(180), escalar(250), escalar(45), "HISTORIA", #FF7700, color(255, 119, 0, 80), #FF7700, escalar(35), escalar(45));
  botonHistoria.seleccionado = true;
  botonSi = new Boton(width / 2 - escalar(90), height / 2 + escalar(100), escalar(150), escalar(40), "SÍ", #FFED00, #0F0F0B, #FFFFFF, escalar(25), escalar(40));
  botonNo = new Boton(width / 2 + escalar(90), height / 2 + escalar(100), escalar(150), escalar(40), "NO", #FFED00, #0F0F0B, #FFFFFF, escalar(25), escalar(40));
}
