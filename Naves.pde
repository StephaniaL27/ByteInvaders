// ---------- Frames compartidos de las naves ----------

PImage[][] framesNaves = new PImage[4][8];

class Nave {
  int tipo;  // 0: jugador, 1: aliado verde, 2: distracción gris, 3: enemigo rojo
  int frameActual = 0;
  float x, y;
  float v;
  float hiddenValue;
  float vidas;
  float cooldown, inicioCooldown;

  Nave(float x, float y, float v, int tipo, float hiddenValue, float vidas, float cooldown, float inicioCooldown) {
    this.x = x;
    this.y = y;
    this.v = v;
    this.tipo = tipo;
    this.hiddenValue = hiddenValue;
    this.vidas = vidas;
    this.cooldown = cooldown;
    this.inicioCooldown = inicioCooldown;
  }

  void dibujarNave() {
    if (!juegoPausado && frameCount % intervaloEstrellas == 0) {
      frameActual = (frameActual + 1) % framesNaves[tipo].length;
    }
    image(framesNaves[tipo][frameActual], x, y, 128, 128);
  }
}
