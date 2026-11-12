// ---------- Textos ----------

Texto textoHistoria[] = new Texto[historia.length];
Texto textoJuego;
Texto textoHTP[];
Texto textoSettings[];
Texto textoCredits[];
Texto textoGamePaused;
Texto textoEquilibrioRestaurado[];
Texto textoGameOver[];

class Texto {
  float x, y;
  String Contenido;
  float Tamaño;
  color Color;
  PFont Fuente;
  int AlineacionX, AlineacionY;

  Texto(float x, float y, String Contenido, float Tamaño, color Color, PFont Fuente, int AlineacionX, int AlineacionY) {
    this.x = x;
    this.y = y;
    this.Contenido = Contenido;
    this.Tamaño = Tamaño;
    this.Color = Color;
    this.Fuente = Fuente;
    this.AlineacionX = AlineacionX;
    this.AlineacionY = AlineacionY;
  }

  void dibujarTexto() {
    textAlign(AlineacionX, AlineacionY);
    textFont(Fuente, Tamaño);
    fill(Color);
    text(Contenido, x, y);
    fill(255);
    textAlign(LEFT, BASELINE);
  }

  // Versión para la historia: dibuja sobre capaTexto, estirando el texto con escalaAncho y escalaAlto.

  void dibujarTexto(float nx, float ny, float escalaAncho, float escalaAlto, float opacidad) {
    capaTexto.pushMatrix();
    capaTexto.translate(nx, ny);
    capaTexto.scale(escalaAncho, escalaAlto);
    capaTexto.textAlign(AlineacionX, AlineacionY);
    capaTexto.textFont(Fuente, Tamaño);
    capaTexto.fill(Color, opacidad);
    capaTexto.text(Contenido, 0, 0);
    capaTexto.popMatrix();
  }
}

void crearTextos() {
  for (i = 0; i < historia.length; i++) {
    textoHistoria[i] = new Texto(width / 2, 0, historia[i], tamañoT, #FFED00, fuenteHistoria, CENTER, CENTER);
  }
  textoJuego = new Texto(width / 2 - 500, Y, str(Puntos), 40, #FFFFFF, fuenteBoton, LEFT, CENTER);
  textoHTP = new Texto[] {
    new Texto(width / 2, height / 2 - 250, "HOW TO PLAY", 100, #FFE600, fuenteBoton, CENTER, CENTER),
    new Texto(width / 2, height / 2 - 138, "CONTROLES", 50, #00FFFF, fuenteBoton, CENTER, CENTER),
    new Texto(width / 2 - 300, height / 2 - 33, "- Moverte: teclas W, A, S, D o flechas de dirección\n- Disparar / Acción: barra espaciadora\n- Pausar: tecla ENTER o botón || PAUSE", 25, #FFFFFF, fuenteBoton, LEFT, CENTER),
    new Texto(width / 2, height / 2 + 98, "FILTRADO DE MENSAJES\nY BIENESTAR DIGITAL", 40, #00FFFF, fuenteBoton, CENTER, CENTER),
    new Texto(width / 2, height / 2 + 191, "Pilota tu nave y filtra el contenido cibernético que llega a la pantalla:", 25, #FFFFFF, fuenteBoton, CENTER, CENTER),
    new Texto(width / 2, height / 2 + 250, "¡Mantén el equilibrio cibernético y supera el puntaje máximo!", 40, #FFE600, fuenteBoton, CENTER, CENTER)
  };
  textoSettings = new Texto[] {
    new Texto(width / 2, height / 2 - 180, "SETTINGS", 100, #FFE600, fuenteBoton, CENTER, CENTER),
    new Texto(width / 2 - 260, height / 2 - 80, "Dificultad:", 20, #FFFFFF, fuenteBoton, LEFT, CENTER),
    new Texto(width / 2 - 260, height / 2, "Velocidad:", 20, #FFFFFF, fuenteBoton, LEFT, CENTER),
    new Texto(width / 2 - 260, height / 2 + 80, "Modo de juego:", 20, #FFFFFF, fuenteBoton, LEFT, CENTER)
  };
  textoCredits = new Texto[] {
    new Texto(width / 2, height / 2 - 150, "CREDITS", 100, #FFE600, fuenteBoton, CENTER, CENTER),
    new Texto(width / 2, height / 2 - 70, "BYTE INVADERS - Equipo 6", 50, #00FFFF, fuenteBoton, CENTER, CENTER),
    new Texto(width / 2, height / 2 + 50, "Stephania Lamadrid\nMatías Guarín\nNatalia Herrera", 40, #FFFFFF, fuenteBoton, CENTER, CENTER),
    new Texto(width / 2, height / 2 + 170, "Algoritmia y Programación II -- Uninorte 2026", 20, #888888, fuenteBoton, CENTER, CENTER)
  };
  textoGamePaused = new Texto(width / 2, height / 2 - 75, "GAME PAUSED", 32, #FFE600, fuenteBoton, CENTER, CENTER);
  textoEquilibrioRestaurado = new Texto[] {
    new Texto(width / 2, height / 2 - 100, "¡EQUILIBRIO RESTAURADO!", 90, #FFE600, fuenteBoton, CENTER, CENTER),
    new Texto(width / 2, height / 2, "THE NETWORK ESTÁ A SALVO", 40, #00FF66, fuenteBoton, CENTER, CENTER),
    new Texto(width / 2, height / 2 + 100, "No todo mensaje merece una respuesta. \nElegir qué bloqueas, qué apoyas y qué ignoras también \nes cuidar a los demás.", 35, #FFFFFF, fuenteBoton, CENTER, CENTER)
  };
  textoGameOver = new Texto[] {
    new Texto(width / 2, height / 2 - 100, "GAME OVER", 100, #FF0808, fuenteBoton, CENTER, CENTER),
    new Texto(width / 2, height / 2 - 5, "Las señales hostiles ganaron terreno.", 50, #FCFFA2, fuenteBoton, CENTER, CENTER),
    new Texto(width / 2, height / 2 + 80, "¿Jugar de nuevo?", 35, #FFFFFF, fuenteBoton, CENTER, CENTER)
  };
}
