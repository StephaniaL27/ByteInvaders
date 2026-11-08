// ---------- Frames compartidos de las naves ----------

PImage[][] framesNaves = new PImage[4][8];

class Naves {
  int FrameActual = 0;
  PImage[] Frames;
  int tipo;  // 0: jugador, 1: enemigo rojo, 2: aliado verde, 3: distracción gris
  float x, y;

  Naves(int nTipo, float nx, float ny) {
    Frames = framesNaves[nTipo];
    tipo = nTipo;
    x = nx;
    y = ny;
  }

  void dibujarNave() {
    if (!juegoPausado && frameCount % FPS == 0) {
      FrameActual = (FrameActual + 1) % Frames.length;
    }
    image(Frames[FrameActual], x, y, 128, 128);
  }
}
