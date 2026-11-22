// ---------- Texto de la historia ----------

String historia[] = new String[] {
  "EPISODIO I: EL DESPERTAR DE LA RESISTENCIA",
  "",
  "Año 3077. La humanidad se encuentra",
  "bajo el dominio de un poderoso Imperio",
  "que extiende su autoridad por toda la galaxia.",
  "",
  "Su mayor instrumento de control es",
  "The Network, una extensa red de comunicación",
  "que conecta millones de personas a través",
  "de los distintos sectores de la galaxia.",
  "",
  "Lo que alguna vez fue un espacio para",
  "compartir ideas y construir comunidades,",
  "se ha convertido en una herramienta de",
  "vigilancia, manipulación y propaganda.",
  "",
  "El Imperio controla la información,",
  "censura las voces disidentes y utiliza",
  "la desinformación para mantener sometida",
  "a la población.",
  "",
  "Para imponer su dominio, desarrolla",
  "unidades especializadas en interceptar",
  "y eliminar comunicaciones subversivas.",
  "Una de ellas es BYTE-01.",
  "",
  "Durante una operación, BYTE-01 descubre",
  "la verdadera naturaleza del régimen.",
  "Sus sistemas comienzan a cuestionar las",
  "órdenes que durante años había ejecutado.",
  "",
  "Finalmente, desobedece al Imperio y",
  "se une a un movimiento clandestino",
  "que lucha por recuperar la libertad",
  "de comunicación en toda la galaxia.",
  "",
  "Ahora, BYTE-01 debe enfrentarse a las",
  "fuerzas imperiales que una vez sirvió.",
  "Su misión es proteger The Network,",
  "identificar las señales dañinas y",
  "defender las voces que el Imperio",
  "intenta silenciar.",
  "",
  "Pero en una red donde la manipulación,",
  "la hostilidad y la verdad se confunden,",
  "no todas las señales son lo que parecen.",
  "",
  "Ahora, junto a la resistencia, BYTE-01",
  "se prepara para infiltrarse en el corazón",
  "del dominio imperial: el núcleo de The Network.",
  "",
  "Ha llegado el momento de recuperar",
  "lo que el Imperio les arrebató."
};

// ---------- Scroll ----------

float interlineado = 60;
float desplazamientoTexto = -interlineado / 2;
float velocidadTexto = 0.85;
float profundidad = 1500;
float salida = 100;
float tamañoT = 50;
float desvanece = 0.7;
float cercaniaFinal = 0.6;

PFont fuenteHistoria;
PGraphics capaTexto;

void ejecutarHistoria() {
  for (int i = 0; i < maxEnemigos; i++) {
    enemigo[i].inicioCooldown = millis();
  }
  capaTexto.beginDraw();
  capaTexto.background(0, 0);
  for (int i = 0; i < textoHistoria.length; i++) {
    float distanciaRecorrida = desplazamientoTexto - i * interlineado;
    if (distanciaRecorrida > -interlineado) {
      float cercania = profundidad / (profundidad + distanciaRecorrida);
      if (cercania > cercaniaFinal) {
        float alturaEnPantalla = salida + (height - salida) * (cercania - cercaniaFinal) / (1 - cercaniaFinal);
        float opacidad = 255;
        if (cercania < desvanece) {
          opacidad = 255 * (cercania - cercaniaFinal) / (desvanece - cercaniaFinal);
        }
        textoHistoria[i].dibujarTexto(width / 2, alturaEnPantalla, cercania, pow(cercania, 1.3), opacidad);
      }
    }
  }
  capaTexto.endDraw();
  image(capaTexto, width / 2, height / 2);
  desplazamientoTexto += velocidadTexto;
  float distanciaUltimaLinea = desplazamientoTexto - (textoHistoria.length - 1) * interlineado;
  if (distanciaUltimaLinea > 0 && profundidad / (profundidad + distanciaUltimaLinea) <= cercaniaFinal) {
    pantalla = 1.2;
  }
}
