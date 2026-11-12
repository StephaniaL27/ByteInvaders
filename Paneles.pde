// ---------- Paneles ----------

Panel panelHTP;
Panel panelSettings;
Panel panelCredits;
Panel panelGamePaused;
Panel panelEquilibrioRestaurado;
Panel panelGameOver;

class Panel {
  float x, y, w, h;
  float Radio;
  color Fondo, Borde;

  Panel(float x, float y, float w, float h, float Radio, color Fondo, color Borde) {
    this.x = x;
    this.y = y;
    this.w = w;
    this.h = h;
    this.Radio = Radio;
    this.Fondo = Fondo;
    this.Borde = Borde;
  }

  void dibujarPanel() {
    rectMode(CENTER);
    fill(Fondo);
    stroke(Borde);
    strokeWeight(2);
    rect(x, y, w, h, Radio);
    fill(255);
    textAlign(LEFT, BASELINE);
  }
}

void crearPaneles() {
  panelHTP = new Panel(width / 2, height / 2 - 20, width * 0.82, height * 0.72, 20, color(10, 15, 30, 230), #00FFFF);
  panelSettings = new Panel(width / 2, height / 2 - 20, width * 0.75, height * 0.65, 20, color(10, 15, 30, 230), #00FFFF);
  panelCredits = new Panel(width / 2, height / 2 - 20, width * 0.70, height * 0.58, 20, color(10, 15, 30, 230), #00FFFF);
  panelGamePaused = new Panel(width / 2, height / 2, 380, 260, 20, color(10, 15, 30, 240), #FFE600);
  panelEquilibrioRestaurado = new Panel(width / 2, height / 2, 0.8 * width, 0.7 * height, 20, color(10, 15, 30, 230), #00FFFF);
  panelGameOver = new Panel(width / 2, height / 2, 0.8 * width, 0.8 * height, 20, color(10, 15, 30, 230), #00FFFF);
}
