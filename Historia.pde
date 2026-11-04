void dibujarHistoria() {
  capaTexto.beginDraw();
  capaTexto.clear();
  capaTexto.textFont(fuenteHistoria);
  capaTexto.textSize(tamañoT);
  capaTexto.textAlign(CENTER, CENTER);

  for (int i = 0; i < historia.length; i++) {
    float y = height + i * interlineado - scroll;
    float u = max((y - salida) / (height - salida), 0);   // 0: arriba, 1: abajo
    float yPantalla = salida + (height - salida) * pow(u, 1.5);

    float s = constrain(u / tramo, 0, 1);
    s = s * s * (3 - 2 * s);                 // Suaviza el inicio y el final del cambio
    float escala = lerp(escalaMin, 1, s);
    float opacidad = constrain(map(u, 0, desvanece, 0, 255), 0, 255);

    capaTexto.pushMatrix();
    capaTexto.translate(width/2, yPantalla);
    capaTexto.scale(escala);
    if (i == 0) {
      texto(capaTexto, historia[i], 0, 0, 8, opacidad);
    } else {
      capaTexto.fill(#FFED00, opacidad);
      capaTexto.text(historia[i], 0, 0);
    }
    capaTexto.popMatrix();
  }
  capaTexto.endDraw();
  image(capaTexto, width/2, height/2);

  scroll += velScroll;
  float ultY = height + (historia.length - 1) * interlineado - scroll;
  if (ultY < salida) {
    pantalla = 2;
  }
}

void texto(PGraphics g, String s, float x, float y, float prof, float opacidad) {
  for (int k = int(prof); k >= 1; k--) {
    color c = lerpColor(#FFED00, #B84400, k / prof);   // Más oscuro cuanto más lejos
    g.fill(c, opacidad);
    g.text(s, x - k, y + k);
  }
  g.fill(#FFED00, opacidad);
  g.text(s, x, y);
}
