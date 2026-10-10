PFont font_botones;
float rad = 20;
class Botones {
  void dibujarBoton(float x, float y, float ancho, float alto, String contenido) {

    rectMode(CENTER);
    textAlign(CENTER, CENTER);
    textFont(font_botones, 40);

    boolean overButton = (mouseX >= x - ancho / 2 && mouseX <= x + ancho / 2 && 
                           mouseY >= y - alto / 2 && mouseY <= y + alto / 2);

    if (overButton) {
      fill(#ffed00);
      rect(x, y, ancho, alto, rad);
      fill(0);
      text(contenido, x, y);
    } else {
      noFill();
      stroke(#ffed00);
      strokeWeight(3);
      rect(x, y, ancho, alto, rad);
      fill(#ffed00);
      text(contenido, x, y);
    }
  }
}
