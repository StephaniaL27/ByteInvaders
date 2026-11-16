// ---------- Frames compartidos de las naves ----------

PImage[][] framesNaves = new PImage[4][8];

class Nave {
  float x, y;
  float v;
  int tipo;  // 0: jugador, 1: aliado verde, 2: distracción gris, 3: enemigo rojo
  float hiddenValue;
  PImage[] frames;
  int frameActual = 0;
  float vidas;
  float daño;
  float cooldown, inicioCooldown;

  Nave(float x, float y, float v, int tipo, float hiddenValue, float vidas, float daño, float cooldown, float inicioCooldown) {
    this.x = x;
    this.y = y;
    this.v = v;
    this.tipo = tipo;
    this.hiddenValue = hiddenValue;
    frames = framesNaves[tipo];
    this.vidas = vidas;
    this.daño = daño;
    this.cooldown = cooldown;
    this.inicioCooldown = inicioCooldown;
  }

  void dibujarNave() {
    if (!juegoPausado && frameCount % intervaloEstrellas == 0) {
      frameActual = (frameActual + 1) % frames.length;
    }
    image(frames[frameActual], x, y, 128, 128);
  }
}
