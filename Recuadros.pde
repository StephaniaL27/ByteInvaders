// ---------- Recuadros ----------

Recuadro[] recuadroAjustes = new Recuadro[3];
Recuadro[] recuadroPausa = new Recuadro[2];
Recuadro recuadroInstrucciones;
Recuadro recuadroCreditos;
Recuadro recuadroVictoria;
Recuadro recuadroDerrota;
Recuadro recuadroHUD;

class Recuadro {
  color colorFondo, colorBorde;
  float x, y, w, h;
  float radio;

  // Recibe medidas del diseño (1920 × 1080, desde la esquina superior izquierda) y las escala.
  Recuadro(float x, float y, float w, float h, float radio, color colorFondo, color colorBorde) {
    this.x = escalar(x);
    this.y = escalar(y);
    this.w = escalar(w);
    this.h = escalar(h);
    this.radio = escalar(radio);
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
  recuadroInstrucciones = new Recuadro(960, 540, wPanel, hPanel, radioPanel, color(10, 15, 30, 230), #00FFFF);
  recuadroAjustes[0] = new Recuadro(960, 540, wPanel, hPanel, radioPanel, color(10, 15, 30, 230), #00FFFF);
  recuadroAjustes[1] = new Recuadro(1032, 556, 640, 4, 2, #00FFFF, #00FFFF);
  recuadroAjustes[2] = new Recuadro(1032, 612, 640, 4, 2, #00FFFF, #00FFFF);
  recuadroCreditos = new Recuadro(960, 540, wPanel, hPanel, radioPanel, color(10, 15, 30, 230), #00FFFF);
  recuadroPausa[0] = new Recuadro(960, 540, 1920, 1080, 0, color(0, 180), color(0, 0));
  recuadroPausa[1] = new Recuadro(960, 540, 480, 280, radioPanel, color(10, 15, 30, 240), #FFE600);
  recuadroVictoria = new Recuadro(960, 540, wPanel, hPanel, radioPanel, color(10, 15, 30, 230), #00FFFF);
  recuadroDerrota = new Recuadro(960, 540, wPanel, hPanel, radioPanel, color(10, 15, 30, 230), #00FFFF);
  recuadroHUD = new Recuadro(224, 1020, 416, 88, radioPanel, color(0, 150), color(0, 0));
}
