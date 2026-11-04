class Naves {
  int FrameActual = 0;
  PImage[] Frames = new PImage[8];
  int tipo;  // 0: jugador, 1: enemigo rojo, 2: aliado verde, 3: distracción gris
  float x, y;

  Naves(PImage Imagen, int nTipo, float nx, float ny) {
    for (int i = 0; i < Frames.length; i++) {
      Frames[i] = Imagen.get(i * 64, 0, 64, 64);
    }
    tipo = nTipo;
    x = nx;
    y = ny;
  }

  void dibujarNave() {
    if (!juegoPausado && frameCount % 8 == 0) {
      FrameActual = (FrameActual + 1) % Frames.length;
    }
    image(Frames[FrameActual], x, y, 128, 128);
  }
}
