// ---------- Textos ----------

Texto textoHistoria[] = new Texto[historia.length];
Texto textoJuego;
Texto textoInstrucciones[];
Texto textoAjustes[];
Texto textoCreditos[];
Texto textoPausa;
Texto textoVictoria[];
Texto textoDerrota[];

class Texto {
  float x, y;
  String contenido;
  float tamaño;
  color colorTexto;
  PFont fuente;
  int alineacionX, alineacionY;

  Texto(float x, float y, String contenido, float tamaño, color colorTexto, PFont fuente, int alineacionX, int alineacionY) {
    this.x = x;
    this.y = y;
    this.contenido = contenido;
    this.tamaño = tamaño;
    this.colorTexto = colorTexto;
    this.fuente = fuente;
    this.alineacionX = alineacionX;
    this.alineacionY = alineacionY;
  }

  void dibujarTexto() {
    textAlign(alineacionX, alineacionY);
    textFont(fuente, tamaño);
    fill(colorTexto);
    text(contenido, x, y);
    fill(255);
    textAlign(LEFT, BASELINE);
  }

  // Dibuja el texto de la historia sobre capaTexto con escala y opacidad.
  void dibujarTexto(float nx, float ny, float escalaAncho, float escalaAlto, float opacidad) {
    capaTexto.pushMatrix();
    capaTexto.translate(nx, ny);
    capaTexto.scale(escalaAncho, escalaAlto);
    capaTexto.textAlign(alineacionX, alineacionY);
    capaTexto.textFont(fuente, tamaño);
    capaTexto.fill(colorTexto, opacidad);
    capaTexto.text(contenido, 0, 0);
    capaTexto.popMatrix();
  }
}

void crearTextos() {
  for (i = 0; i < historia.length; i++) {
    textoHistoria[i] = new Texto(width / 2, 0, historia[i], tamañoT, #FFED00, fuenteHistoria, CENTER, CENTER);
  }
  textoJuego = new Texto(width / 2 - escalar(735), height / 2 + escalar(480), str(Puntos), escalar(45), #FFFFFF, fuenteBoton, LEFT, CENTER);
  textoInstrucciones = new Texto[] {
    new Texto(width / 2, height / 2 - escalar(220), "HOW TO PLAY", escalar(50), #FFE600, fuenteBoton, CENTER, CENTER),
    new Texto(width / 2, height / 2 - escalar(180), "", escalar(25), #FFFFFF, fuenteBoton, CENTER, CENTER),
    new Texto(width / 2, height / 2 - escalar(140), "CONTROLES", escalar(45), #00FFFF, fuenteBoton, CENTER, CENTER),
    new Texto(width / 2, height / 2 - escalar(100), "- Moverte: teclas W, A, S, D o flechas de dirección", escalar(25), #FFFFFF, fuenteBoton, LEFT, CENTER),
    new Texto(width / 2, height / 2 - escalar(60), "- Disparar / Acción: barra espaciadora", escalar(25), #FFFFFF, fuenteBoton, LEFT, CENTER),
    new Texto(width / 2, height / 2 - escalar(20), "- Pausar: tecla ENTER o botón ||", escalar(25), #FFFFFF, fuenteBoton, LEFT, CENTER),
    new Texto(width / 2, height / 2 + escalar(20), "", escalar(25), #FFFFFF, fuenteBoton, CENTER, CENTER),
    new Texto(width / 2, height / 2 + escalar(60), "FILTRADO DE MENSAJES", escalar(45), #00FFFF, fuenteBoton, CENTER, CENTER),
    new Texto(width / 2, height / 2 + escalar(100), "Y BIENESTAR DIGITAL", escalar(45), #00FFFF, fuenteBoton, CENTER, CENTER),
    new Texto(width / 2, height / 2 + escalar(140), "Pilota tu nave y filtra el contenido cibernético que llega a la pantalla:", escalar(25), #FFFFFF, fuenteBoton, CENTER, CENTER),
    new Texto(width / 2, height / 2 + escalar(180), "", escalar(25), #FFFFFF, fuenteBoton, CENTER, CENTER),
    new Texto(width / 2, height / 2 + escalar(220), "¡Mantén el equilibrio cibernético y supera el puntaje máximo!", escalar(35), #00FFFF, fuenteBoton, CENTER, CENTER)
  };
  textFont(fuenteBoton, escalar(25));
  float anchoLista = 0;
  for (i = 3; i < 6; i++) {
    anchoLista = max(anchoLista, textWidth(textoInstrucciones[i].contenido));
  }
  for (i = 3; i < 6; i++) {
    textoInstrucciones[i].x = width / 2 - anchoLista / 2;
  }
  textoAjustes = new Texto[] {
    new Texto(width / 2, height / 2 - escalar(180), "SETTINGS", escalar(50), #FFE600, fuenteBoton, CENTER, CENTER),
    new Texto(width / 2, height / 2 - escalar(140), "", escalar(25), #FFFFFF, fuenteBoton, CENTER, CENTER),
    new Texto(width / 2, height / 2 - escalar(100), "Dificultad:", escalar(25), #FFFFFF, fuenteBoton, CENTER, CENTER),
    new Texto(width / 2, height / 2 - escalar(60), "", escalar(25), #FFFFFF, fuenteBoton, CENTER, CENTER),
    new Texto(width / 2, height / 2 - escalar(20), "Música:", escalar(25), #FFFFFF, fuenteBoton, CENTER, CENTER),
    new Texto(width / 2 + escalar(420), height / 2 + escalar(20), "100%", escalar(25), #FFFFFF, fuenteBoton, LEFT, CENTER),
    new Texto(width / 2, height / 2 + escalar(60), "Efectos de sonido:", escalar(25), #FFFFFF, fuenteBoton, CENTER, CENTER),
    new Texto(width / 2 + escalar(420), height / 2 + escalar(100), "100%", escalar(25), #FFFFFF, fuenteBoton, LEFT, CENTER),
    new Texto(width / 2, height / 2 + escalar(140), "Modo de juego:", escalar(25), #FFFFFF, fuenteBoton, CENTER, CENTER),
    new Texto(width / 2, height / 2 + escalar(180), "", escalar(25), #FFFFFF, fuenteBoton, CENTER, CENTER)
  };
  textoCreditos = new Texto[] {
    new Texto(width / 2, height / 2 - escalar(220), "CREDITS", escalar(50), #FFE600, fuenteBoton, CENTER, CENTER),
    new Texto(width / 2, height / 2 - escalar(180), "", escalar(25), #FFFFFF, fuenteBoton, CENTER, CENTER),
    new Texto(width / 2, height / 2 - escalar(140), "BYTE INVADERS - Equipo 6", escalar(45), #00FFFF, fuenteBoton, CENTER, CENTER),
    new Texto(width / 2, height / 2 - escalar(100), "Stephania Lamadrid", escalar(25), #FFFFFF, fuenteBoton, CENTER, CENTER),
    new Texto(width / 2, height / 2 - escalar(60), "Matías Guarín", escalar(25), #FFFFFF, fuenteBoton, CENTER, CENTER),
    new Texto(width / 2, height / 2 - escalar(20), "Natalia Herrera", escalar(25), #FFFFFF, fuenteBoton, CENTER, CENTER),
    new Texto(width / 2, height / 2 + escalar(20), "Algoritmia y Programación II -- Uninorte 2026", escalar(25), #FFFFFF, fuenteBoton, CENTER, CENTER),
    new Texto(width / 2, height / 2 + escalar(60), "", escalar(25), #FFFFFF, fuenteBoton, CENTER, CENTER),
    new Texto(width / 2, height / 2 + escalar(100), "MÚSICA", escalar(45), #00FFFF, fuenteBoton, CENTER, CENTER),
    new Texto(width / 2, height / 2 + escalar(140), "Ice Path - Pokémon Heart Gold and Soul Silver", escalar(25), #FFFFFF, fuenteBoton, CENTER, CENTER),
    new Texto(width / 2, height / 2 + escalar(180), "Theme of Star Wars - Super Star Wars (SNES)", escalar(25), #FFFFFF, fuenteBoton, CENTER, CENTER),
    new Texto(width / 2, height / 2 + escalar(220), "Victory! (Wild Pokémon) - Pokémon Platinum", escalar(25), #FFFFFF, fuenteBoton, CENTER, CENTER)
  };
  textoPausa = new Texto(width / 2, height / 2 - escalar(75), "GAME PAUSED", escalar(50), #FFE600, fuenteBoton, CENTER, CENTER);
  textoVictoria = new Texto[] {
    new Texto(width / 2, height / 2 - escalar(100), "¡EQUILIBRIO RESTAURADO!", escalar(50), #FFE600, fuenteBoton, CENTER, CENTER),
    new Texto(width / 2, height / 2 - escalar(60), "", escalar(25), #FFFFFF, fuenteBoton, CENTER, CENTER),
    new Texto(width / 2, height / 2 - escalar(20), "THE NETWORK ESTÁ A SALVO", escalar(35), #00FFFF, fuenteBoton, CENTER, CENTER),
    new Texto(width / 2, height / 2 + escalar(20), "No todo mensaje merece una respuesta.", escalar(25), #FFFFFF, fuenteBoton, CENTER, CENTER),
    new Texto(width / 2, height / 2 + escalar(60), "Elegir qué bloqueas, qué apoyas y qué ignoras también", escalar(25), #FFFFFF, fuenteBoton, CENTER, CENTER),
    new Texto(width / 2, height / 2 + escalar(100), "es cuidar a los demás.", escalar(25), #FFFFFF, fuenteBoton, CENTER, CENTER)
  };
  textoDerrota = new Texto[] {
    new Texto(width / 2, height / 2 - escalar(100), "GAME OVER", escalar(50), #FFE600, fuenteBoton, CENTER, CENTER),
    new Texto(width / 2, height / 2 - escalar(60), "", escalar(25), #FFFFFF, fuenteBoton, CENTER, CENTER),
    new Texto(width / 2, height / 2 - escalar(20), "Las señales hostiles ganaron terreno.", escalar(35), #00FFFF, fuenteBoton, CENTER, CENTER),
    new Texto(width / 2, height / 2 + escalar(20), "¿Jugar de nuevo?", escalar(35), #00FFFF, fuenteBoton, CENTER, CENTER),
    new Texto(width / 2, height / 2 + escalar(60), "", escalar(25), #FFFFFF, fuenteBoton, CENTER, CENTER),
    new Texto(width / 2, height / 2 + escalar(100), "", escalar(25), #FFFFFF, fuenteBoton, CENTER, CENTER)
  };
}
