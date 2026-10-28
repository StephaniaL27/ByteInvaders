class Naves {
  int frameActual = 0;
  PImage[] frames = new PImage[8];
  float x, y;
  
  Naves(PImage imagen, float nx, float ny) {
    for (int i = 0; i < 8; i++) {
      frames[i] = imagen.get(i * 64, 0, 64, 64);  // recorta cada cuadro de 64x64
    }
    x = nx;
    y = ny;
  }

  void dibujarNaves() {
    if (frameCount % 6 == 0) {
      frameActual = (frameActual + 1) % 8;
    }
    image(frames[frameActual], x, y, 64*2, 64*2);
  }
}
