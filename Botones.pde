PFont font_botones_r;
float rad = 51;
float[] brillo =  new float[4];

class Boton {
  float nivelBrillo = 0;
  float velocidadBrillo = 250;
  void dibujarBoton(float x, float y, float ancho, float alto, String contenido) {

    rectMode(CENTER);
    textAlign(CENTER, CENTER);
    textFont(font_botones_r, 42);
    boolean overButton = (
      mouseX >= x - ancho / 2 &&
      mouseX <= x + ancho / 2 &&
      mouseY >= y - alto / 2 &&
      mouseY <= y + alto / 2
      );

    if (overButton) {
      nivelBrillo += velocidadBrillo;
    } else {
      nivelBrillo -= velocidadBrillo;
    }
    if (nivelBrillo > 255) {
      nivelBrillo = 255;
    }
    if (nivelBrillo < 0) {
      nivelBrillo = 0;
    }

    stroke(#ffed00);
    strokeWeight(3);
    fill(255, 237, 0, nivelBrillo);
    rect(x, y, ancho, alto, rad);
    if (overButton) {
      fill(0);
    } else {
      fill(#ffed00);
    }
    text(contenido, x, y);
  }
}
