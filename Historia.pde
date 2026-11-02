String[] historia = {
  "EPISODIO I: ",
  "Año 3077. La humanidad ha construido una red de comunicación interplanetaria conocida como The Network.",
  "Millones de personas la utilizan diariamente para compartir ideas, construir comunidades",
  "y mantenerse conectadas sin importar la distancia.",
  "Sin embargo, la red comienza a presentar una anomalía:",
  "señales hostiles, mensajes manipuladores y ataques coordinados se propagan a una velocidad alarmante.",
  "Poco a poco, las comunicaciones se convierten en un espacio donde la agresión se normaliza,",
  "mientras quienes la presencian comienzan a ignorarla.",
  "La estación central pierde el control de sus sistemas de comunicación.",
  "Si nadie interviene, el ruido terminará silenciando las voces que realmente importan.",
  "Tú eres el piloto de la última unidad de defensa digital: BYTE-01.",
  "Tu misión no consiste simplemente en destruir señales enemigas.",
  "Debes aprender a distinguir entre mensajes dañinos, comunicaciones positivas y señales neutrales;",
  "intervenir cuando sea necesario y proteger el bienestar de la comunidad digital.",
  "Porque en esta guerra, no todas las señales merecen una respuesta, y no intervenir",
  "también puede tener consecuencias."
};

float interlineado = 50;
float scroll = 0;
float velScroll = 1.5;
float salida = 100;
float tamañoT = 30;
float tramo = 0.8;        // más alto = el encogimiento empieza antes
float escalaMin = 0.3;    // tamaño mínimo arriba (1 = sin encoger)
float desvanece = 0.25;   // más alto = se desvanece desde más abajo

PFont fuenteHistoria;

PGraphics capaTexto;

void dibujarHistoria() {
  capaTexto.beginDraw();
  capaTexto.clear();
  capaTexto.textFont(fuenteHistoria);
  capaTexto.textSize(tamañoT);
  capaTexto.textAlign(CENTER, CENTER);

  for (int i = 0; i < historia.length; i++) {
    float y = height + i * interlineado - scroll;
    float u = max((y - salida) / (height - salida), 0);   // 0 arriba, 1 abajo
    float yPantalla = salida + (height - salida) * pow(u, 1.5);

    float s = constrain(u / tramo, 0, 1);
    s = s * s * (3 - 2 * s);                 // suaviza el inicio y el final del cambio
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
    color c = lerpColor(#FFED00, #B84400, k / prof);   // más oscuro cuanto más lejos
    g.fill(c, opacidad);
    g.text(s, x - k, y + k);
  }
  g.fill(#FFED00, opacidad);
  g.text(s, x, y);
}
