int dificultad = 1;
boolean juegoPausado = false;
boolean juegoGanado = false;
boolean gameOver = false;
float pantalla = 0;

void iniciarPartida() {
  juegoGanado = false;
  gameOver = false;
  juegoPausado = false;
  espacio = false;
  arriba = false;
  abajo = false;
  izquierda = false;
  derecha = false;
  AUG.vidas = 3;
  escudoActivo = false;
  inicioInvulnerable = 0;
  inicioLento = 0;
  AUG.x = width / 2;
  AUG.y = height + 128;
  AUG.frameActual = 0;
  AUG.cooldown = 0;
  AUG.inicioCooldown = 0;
  for (int i = 0; i < cargadorAUG; i++) {
    balaAUGActiva[i] = false;
  }
  indiceDisparoAUG = 0;
  balasPendientesAUG = 0;
  for (int i = 0; i < direccionEnemigo.length; i++) {
    direccionEnemigo[i] = i % 2 == 0 ? 1 : -1;
  }
  crearEnemigos();
  fasePicada = 0;
  inicioFase = millis();
  Puntos = 0;
  FrameActualVidas = 0;
  desplazamientoTexto = -interlineado / 2;
}

void ejecutarPartida() {
  if (!juegoGanado && !gameOver) {
    if (!juegoPausado) {
      moverJugador();
      moverEnemigosX();
      moverEnemigosY();
      if (millis() - AUG.inicioCooldown >= AUG.cooldown) {
        dispararJugador();
      }
      dispararEnemigo();
    } else {
      // Congela todos los relojes: los corre lo que dura cada frame de pausa.
      AUG.inicioCooldown += 1000 / frameRate;
      for (int i = 0; i < maxEnemigos; i++) {
        enemigo[i].inicioCooldown += 1000 / frameRate;
      }
      inicioInvulnerable += 1000 / frameRate;
      inicioLento += 1000 / frameRate;
      inicioFase += 1000 / frameRate;
    }
    // Mientras es invulnerable, la nave parpadea.
    if (juegoPausado || millis() - inicioInvulnerable >= 1000 || frameCount % 10 < 5) {
      AUG.dibujarNave();
    }
    if (escudoActivo) {
      noFill();
      stroke(#80FF80);
      strokeWeight(3);
      circle(AUG.x, AUG.y, 128);
    }
    for (int i = 0; i < maxEnemigos; i++) {
      if (existe[i]) {
        if (verificada[i]) {
          tint(255, 128);
        }
        enemigo[i].dibujarNave();
        noTint();
      }
    }
    actualizarDisparos();
    dibujarHUD();
    if (!juegoPausado) {
      detectarImpactos();
      detectarChoques();
      if (nahIdWin(0, maxEnemigos) == 1 && !gameOver) {
        juegoGanado = true;
        sonarSFX(sfxVictoria3);
      }
    }
  }
  if (juegoGanado) {
    dibujarVictoria();
  } else if (gameOver) {
    dibujarDerrota();
  } else if (juegoPausado) {
    dibujarPausa();
  }
}
