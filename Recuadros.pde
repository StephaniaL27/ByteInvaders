// ---------- Recuadros ----------

Recuadro recuadroInstrucciones;
Recuadro[] recuadroAjustes = new Recuadro[3];
Recuadro recuadroCreditos;
Recuadro[] recuadroPausa = new Recuadro[2];
Recuadro recuadroVictoria;
Recuadro recuadroDerrota;
Recuadro recuadroHUD;

class Recuadro {
  float x, y, w, h;
  float radio;
  color colorFondo, colorBorde;

  Recuadro(float x, float y, float w, float h, float radio, color colorFondo, color colorBorde) {
    this.x = x;
    this.y = y;
    this.w = w;
    this.h = h;
    this.radio = radio;
    this.colorFondo = colorFondo;
    this.colorBorde = colorBorde;
  }

  void dibujarRecuadro() {
    rectMode(CENTER);
    fill(colorFondo);
    stroke(colorBorde);
    strokeWeight(2);
    rect(x, y, w, h, radio);
    fill(255);
    textAlign(LEFT, BASELINE);
  }
}

void crearRecuadros() {
  recuadroInstrucciones = new Recuadro(width / 2, height / 2, escalar(1280), escalar(720), escalar(30), color(10, 15, 30, 230), #00FFFF);
  recuadroAjustes[0] = new Recuadro(width / 2, height / 2, escalar(1280), escalar(720), escalar(30), color(10, 15, 30, 230), #00FFFF);
  recuadroAjustes[1] = new Recuadro(width / 2, height / 2 + escalar(20), escalar(780), escalar(4), escalar(2), #00FFFF, #00FFFF);
  recuadroAjustes[2] = new Recuadro(width / 2, height / 2 + escalar(100), escalar(780), escalar(4), escalar(2), #00FFFF, #00FFFF);
  recuadroCreditos = new Recuadro(width / 2, height / 2, escalar(1280), escalar(720), escalar(30), color(10, 15, 30, 230), #00FFFF);
  recuadroPausa[0] = new Recuadro(width / 2, height / 2, width, height, 0, color(0, 180), color(0, 0));
  recuadroPausa[1] = new Recuadro(width / 2, height / 2, escalar(480), escalar(270), escalar(30), color(10, 15, 30, 240), #FFE600);
  recuadroVictoria = new Recuadro(width / 2, height / 2, escalar(1280), escalar(720), escalar(30), color(10, 15, 30, 230), #00FFFF);
  recuadroDerrota = new Recuadro(width / 2, height / 2, escalar(1280), escalar(720), escalar(30), color(10, 15, 30, 230), #00FFFF);
  recuadroHUD = new Recuadro(width / 2 - escalar(735), height / 2 + escalar(480), escalar(420), escalar(90), escalar(30), color(0, 150), color(0, 0));
}
