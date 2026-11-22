// ---------- Interfaz de botones ----------

PFont fuenteBoton;
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

boolean estaDentroRectangulo(float x, float y, float w, float h) {
  return mouseX >= x - w / 2 && mouseX <= x + w / 2 && mouseY >= y - h / 2 && mouseY <= y + h / 2;
}

class Boton {
  boolean cursorEncima = false;
  boolean seleccionado = false;
  color colorPrincipal, colorCadena;
  float x, y, w, h;
  float tamaño, radio;
  String cadena;

  // Recibe medidas del diseño (1920 × 1080, desde la esquina superior izquierda) y las escala.
  Boton(float x, float y, float w, float h, String contenido, color colorPrincipal, color colorCadena, float tamaño, float radio) {
    this.x = escalar(x);
    this.y = escalar(y);
    this.w = escalar(w);
    this.h = escalar(h);
    this.cadena = contenido;
    this.colorPrincipal = colorPrincipal;
    this.colorCadena = colorCadena;
    this.tamaño = escalar(tamaño);
    this.radio = escalar(radio);
  }

  void dibujarBoton() {
    textAlign(CENTER, CENTER);
    textFont(fuenteBoton, tamaño);
    cursorEncima = estaDentroRectangulo(x, y, w, h);
    stroke(seleccionado ? #00FFFF : colorPrincipal);
    strokeWeight(cursorEncima || seleccionado ? 3 : 2);
    if (seleccionado) {
      fill(#00FFFF, 100);
    } else if (cursorEncima) {
      fill(colorPrincipal, 60);
    } else {
      noFill();
    }
    rect(x, y, w, h, radio);
    fill(seleccionado ? #00FFFF : colorCadena);
    text(cadena, x, y);
  }
}

void crearBotones() {
  for (int i = 0; i < botonMenu.length; i++) {
    botonMenu[i] = new Boton(960, posicion(i, 536, hBotonG + espacioM), wBotonG, hBotonG, opcionesMenu[i], #FFED00, #FFED00, letraT2, hBotonG);
  }
  for (int i = 0; i < botonDificultad.length; i++) {
    botonDificultad[i] = new Boton(posicion(i, 688, wBotonM + espacioP), 488, wBotonM, hBotonM, opcionesDificultad[i], #00FFFF, color(200), letraS, hBotonM);
  }
  botonDificultad[1].seleccionado = true;
  controlVolumen[0] = new Boton(1032 + 640 / 2, 556, 24, 24, "", #00FFFF, color(200), 24, 24);
  controlVolumen[1] = new Boton(1032 + 640 / 2, 612, 24, 24, "", #00FFFF, color(200), 24, 24);
  botonPausa = new Boton(388, 1020, hBotonG, hBotonG, "||", #00FFFF, #00FFFF, letraT2, hBotonG);
  botonContinuar = new Boton(960, posicion(0, 544, hBotonM + espacioM), wBotonM, hBotonM, "CONTINUE", #00FF66, #00FF66, letraS, hBotonM);
  botonInicio = new Boton(960, posicion(1, 544, hBotonM + espacioM), wBotonM, hBotonM, "HOME", #FF4444, #FF4444, letraS, hBotonM);
  botonVolver = new Boton(960, 992, wBotonM, hBotonM, "BACK", #FF4000, #FFFFFF, letraS, hBotonM);
  botonHistoria = new Boton(960, 720, wBotonM, hBotonM, "HISTORIA", #FF7700, #FF7700, letraS, hBotonM);
  botonHistoria.seleccionado = true;
  botonSi = new Boton(posicion(0, 864, wBotonP + espacioM), posicion(5, 440, letraN + espacioP), wBotonP, hBotonP, "SÍ", #FFED00, #FFFFFF, letraN, hBotonP);
  botonNo = new Boton(posicion(1, 864, wBotonP + espacioM), posicion(5, 440, letraN + espacioP), wBotonP, hBotonP, "NO", #FFED00, #FFFFFF, letraN, hBotonP);
}
