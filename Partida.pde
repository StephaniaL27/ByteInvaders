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
  for (int i = 0; i < botonDificultad.length; i++) {
    if (botonDificultad[i].seleccionado) {
      velocidadEnemigo = (i + 1) * 3;
      AUG.v = (-i + 3) * 3;
    }
  }
  AUG.vidas = 3;
  escudoActivo = false;
  inicioInvulnerable = -1000;
  inicioLento = -3000;
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
  Puntos = 0;
  FrameActualVidas = 0;
  desplazamientoTexto = -interlineado / 2;
}

void ejecutarPartida() {
  if (!juegoGanado && !gameOver) {
    if (!juegoPausado) {
      moverJugador();
      moverEnemigos();
      if (millis() - AUG.inicioCooldown >= AUG.cooldown) {
        dispararJugador();
      }
      dispararEnemigo();
    } else {
      AUG.inicioCooldown = millis();
      for (int i = 0; i < maxEnemigos; i++) {
        enemigo[i].inicioCooldown = millis();
      }
    }
    // Mientras es invulnerable, la nave parpadea.
    if (millis() - inicioInvulnerable >= 1000 || frameCount % 10 < 5) {
      AUG.dibujarNave();
    }
    if (escudoActivo) {
      noFill();
      stroke(#80FF80);
      strokeWeight(3);
      circle(AUG.x, AUG.y, 150);
    }
    for (int i = 0; i < maxEnemigos; i++) {
      if (existe[i]) {
        enemigo[i].dibujarNave();
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
