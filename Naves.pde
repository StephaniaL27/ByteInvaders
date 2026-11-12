// ---------- Frames compartidos de las naves ----------

PImage[][] framesNaves = new PImage[4][8];

class Nave {
  float x, y;
  float v;
  int tipo;  // 0: jugador, 1: aliado verde, 2: distracción gris, 3: enemigo rojo
  float hiddenValue;
  PImage[] Frames;
  int FrameActual = 0;
  float vidas;
  float damage;
  float cooldown, inicioCooldown;

  Nave(float x, float y, float v, int tipo, float hiddenValue, float vidas, float damage, float cooldown, float inicioCooldown) {
    this.x = x;
    this.y = y;
    this.v = v;
    this.tipo = tipo;
    this.hiddenValue = hiddenValue;
    Frames = framesNaves[tipo];
    this.vidas = vidas;
    this.damage = damage;
    this.cooldown = cooldown;
    this.inicioCooldown = inicioCooldown;
  }

  void dibujarNave() {
    if (!juegoPausado && frameCount % FPS == 0) {
      FrameActual = (FrameActual + 1) % Frames.length;
    }
    image(Frames[FrameActual], x, y, 128, 128);
  }
}
