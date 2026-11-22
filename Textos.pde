// ---------- Textos ----------

Texto textoHistoria[] = new Texto[historia.length];
Texto textoInstrucciones[];
Texto textoAjustes[];
Texto textoCreditos[];
Texto textoVictoria[];
Texto textoDerrota[];
Texto textoJuego;
Texto textoPausa;

class Texto {
  int alineacionX, alineacionY;
  color colorTexto;
  float x, y;
  float tamaño;
  String contenido;
  PFont fuente;

  // Recibe medidas del diseño (1920 × 1080, desde la esquina superior izquierda) y las escala.
  Texto(float x, float y, String contenido, float tamaño, color colorTexto, PFont fuente, int alineacionX, int alineacionY) {
    this.x = escalar(x);
    this.y = escalar(y);
    this.contenido = contenido;
    this.tamaño = escalar(tamaño);
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
  for (int i = 0; i < historia.length; i++) {
    textoHistoria[i] = new Texto(960, 0, historia[i], tamañoT, #FFED00, fuenteHistoria, CENTER, CENTER);
  }
  textoJuego = new Texto(224, 1020, str(Puntos), letraT2, #FFFFFF, fuenteBoton, LEFT, CENTER);
  textoInstrucciones = new Texto[] {
    new Texto(960, posicion(0, 320, letraN + espacioP), "HOW TO PLAY", letraT1, #FFE600, fuenteBoton, CENTER, CENTER),
    new Texto(960, posicion(2, 320, letraN + espacioP), "CONTROLES", letraT2, #00FFFF, fuenteBoton, CENTER, CENTER),
    new Texto(960, posicion(3, 320, letraN + espacioP), "- Moverte: teclas W, A, S, D o flechas de dirección", letraN, #FFFFFF, fuenteBoton, LEFT, CENTER),
    new Texto(960, posicion(4, 320, letraN + espacioP), "- Disparar / Acción: barra espaciadora", letraN, #FFFFFF, fuenteBoton, LEFT, CENTER),
    new Texto(960, posicion(5, 320, letraN + espacioP), "- Pausar: tecla ENTER o botón ||", letraN, #FFFFFF, fuenteBoton, LEFT, CENTER),
    new Texto(960, posicion(7, 320, letraN + espacioP), "FILTRADO DE MENSAJES", letraT2, #00FFFF, fuenteBoton, CENTER, CENTER),
    new Texto(960, posicion(8, 320, letraN + espacioP), "Y BIENESTAR DIGITAL", letraT2, #00FFFF, fuenteBoton, CENTER, CENTER),
    new Texto(960, posicion(9, 320, letraN + espacioP), "Pilota tu nave y filtra el contenido cibernético que llega a la pantalla:", letraN, #FFFFFF, fuenteBoton, CENTER, CENTER),
    new Texto(960, posicion(11, 320, letraN + espacioP), "¡Mantén el equilibrio cibernético y supera el puntaje máximo!", letraS, #00FFFF, fuenteBoton, CENTER, CENTER)
  };
  textFont(fuenteBoton, escalar(letraN));
  float anchoLista = 0;
  for (int i = 2; i < 5; i++) {
    anchoLista = max(anchoLista, textWidth(textoInstrucciones[i].contenido));
  }
  for (int i = 2; i < 5; i++) {
    textoInstrucciones[i].x = escalar(960) - anchoLista / 2;
  }
  // Ajustes: 16 entre cada etiqueta y su control, 32 entre grupos. Música y efectos van en la misma fila que su barra.
  textoAjustes = new Texto[] {
    new Texto(960, 364, "SETTINGS", letraT1, #FFE600, fuenteBoton, CENTER, CENTER),
    new Texto(960, 436, "Dificultad:", letraN, #FFFFFF, fuenteBoton, CENTER, CENTER),
    new Texto(1032 - 640 / 2 - espacioP, 556, "Música:", letraN, #FFFFFF, fuenteBoton, RIGHT, CENTER),
    new Texto(1380, 556, "100%", letraN, #FFFFFF, fuenteBoton, LEFT, CENTER),
    new Texto(1032 - 640 / 2 - espacioP, 612, "Efectos de sonido:", letraN, #FFFFFF, fuenteBoton, RIGHT, CENTER),
    new Texto(1380, 612, "100%", letraN, #FFFFFF, fuenteBoton, LEFT, CENTER),
    new Texto(960, 668, "Modo de juego:", letraN, #FFFFFF, fuenteBoton, CENTER, CENTER)
  };
  textoCreditos = new Texto[] {
    new Texto(960, posicion(0, 320, letraN + espacioP), "CREDITS", letraT1, #FFE600, fuenteBoton, CENTER, CENTER),
    new Texto(960, posicion(2, 320, letraN + espacioP), "BYTE INVADERS - Equipo 6", letraT2, #00FFFF, fuenteBoton, CENTER, CENTER),
    new Texto(960, posicion(3, 320, letraN + espacioP), "Stephania Lamadrid", letraN, #FFFFFF, fuenteBoton, CENTER, CENTER),
    new Texto(960, posicion(4, 320, letraN + espacioP), "Matías Guarín", letraN, #FFFFFF, fuenteBoton, CENTER, CENTER),
    new Texto(960, posicion(5, 320, letraN + espacioP), "Natalia Herrera", letraN, #FFFFFF, fuenteBoton, CENTER, CENTER),
    new Texto(960, posicion(6, 320, letraN + espacioP), "Algoritmia y Programación II -- Uninorte 2026", letraN, #FFFFFF, fuenteBoton, CENTER, CENTER),
    new Texto(960, posicion(8, 320, letraN + espacioP), "MÚSICA", letraT2, #00FFFF, fuenteBoton, CENTER, CENTER),
    new Texto(960, posicion(9, 320, letraN + espacioP), "Ice Path - Pokémon Heart Gold and Soul Silver", letraN, #FFFFFF, fuenteBoton, CENTER, CENTER),
    new Texto(960, posicion(10, 320, letraN + espacioP), "Theme of Star Wars - Super Star Wars (SNES)", letraN, #FFFFFF, fuenteBoton, CENTER, CENTER),
    new Texto(960, posicion(11, 320, letraN + espacioP), "Victory! (Wild Pokémon) - Pokémon Platinum", letraN, #FFFFFF, fuenteBoton, CENTER, CENTER)
  };
  textoPausa = new Texto(960, 460, "GAME PAUSED", letraT1, #FFE600, fuenteBoton, CENTER, CENTER);
  textoVictoria = new Texto[] {
    new Texto(960, posicion(0, 440, letraN + espacioP), "¡EQUILIBRIO RESTAURADO!", letraT1, #FFE600, fuenteBoton, CENTER, CENTER),
    new Texto(960, posicion(2, 440, letraN + espacioP), "THE NETWORK ESTÁ A SALVO", letraS, #00FFFF, fuenteBoton, CENTER, CENTER),
    new Texto(960, posicion(3, 440, letraN + espacioP), "No todo mensaje merece una respuesta.", letraN, #FFFFFF, fuenteBoton, CENTER, CENTER),
    new Texto(960, posicion(4, 440, letraN + espacioP), "Elegir qué bloqueas, qué apoyas y qué ignoras también", letraN, #FFFFFF, fuenteBoton, CENTER, CENTER),
    new Texto(960, posicion(5, 440, letraN + espacioP), "es cuidar a los demás.", letraN, #FFFFFF, fuenteBoton, CENTER, CENTER)
  };
  textoDerrota = new Texto[] {
    new Texto(960, posicion(0, 440, letraN + espacioP), "GAME OVER", letraT1, #FFE600, fuenteBoton, CENTER, CENTER),
    new Texto(960, posicion(2, 440, letraN + espacioP), "Las señales hostiles ganaron terreno.", letraS, #00FFFF, fuenteBoton, CENTER, CENTER),
    new Texto(960, posicion(3, 440, letraN + espacioP), "¿Jugar de nuevo?", letraS, #00FFFF, fuenteBoton, CENTER, CENTER)
  };
}
