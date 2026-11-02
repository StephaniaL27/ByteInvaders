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
  "Porque en esta guerra, no todas las señales merecen una respuesta, y no intervenir también puede tener consecuencias."
};

float interlineado = 50;
float scroll = 0;
float velScroll = 1.5;
float salida = 100;
float horizonte = 300;   // por encima de esta altura, el texto se pierde
float tamañoT = 30;

PFont fuenteHistoria;

PGraphics capaTexto;

void dibujarHistoria() {
  capaTexto.beginDraw();
  capaTexto.clear();
  capaTexto.textAlign(CENTER, CENTER);
  capaTexto.textFont(fuenteHistoria);
  for (int i = 0; i < historia.length; i++) {
    float y = height + i * interlineado - scroll;
    float u = (y - salida) / (height - salida);   // 0 arriba, 1 abajo
    u = max(u, 0);                                // evita NaN con pow()
    float yPantalla = salida + (height - salida) * pow(u, 1.5);

    float valorT = map(yPantalla, salida, horizonte, 0.2, 1); // calcular la escala para el tamaño (0.2 arriba, 1 abajo) a partir de y
    float escalaT = constrain(valorT, 0.2, 1); // para que no se salga de la escala que establecimos
    float valorC = map(yPantalla, salida, horizonte, 0, 255); // calcular la escala para que cambie la opacidad conforme va subiendo el texto
    float escalaC = constrain(valorC, 0, 255); // para que no se salga de la escala que establecimos
    float opacidad = constrain(map(u, 0, 0.3, 0, 255), 0, 255);

    capaTexto.textSize(tamañoT*escalaT);
    capaTexto.fill(#FFED00, escalaC);
    if (i == 0) {
      texto(capaTexto, historia[i], width/2, yPantalla, 8 * escalaT, opacidad);
    } else {
      capaTexto.text(historia[i], width/2, yPantalla);
    }
    capaTexto.endDraw();
    scroll += velScroll;
    image(capaTexto, width/2, height/2);

    float ultY = height + (historia.length -1) * interlineado - scroll;
    if (ultY < salida) {
      pantalla = 2;
    }
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
