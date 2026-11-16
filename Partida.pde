float pantalla = 0;
boolean juegoPausado = false;
boolean juegoGanado = false;
boolean gameOver = false;

void iniciarPartida() {
  juegoGanado = false;
  gameOver = false;
  juegoPausado = false;
  espacio = false;
  arriba = false;
  abajo = false;
  izquierda = false;
  derecha = false;
  for (i = 0; i < botonDificultad.length; i++) {
    if (botonDificultad[i].seleccionado) {
      dañoEnemigos = (i + 2) / 3.0;
      AUG.daño = (-i + 4) / 3.0;
      velocidadEnemigo = (i + 1) * 3;
      AUG.v = (-i + 3) * 3;
    }
  }
  AUG.vidas = 3;
  AUG.x = width / 2;
  AUG.y = height + 128;
  AUG.frameActual = 0;
  AUG.cooldown = 0;
  AUG.inicioCooldown = 0;
  for (i = 0; i < cargadorAUG; i++) {
    balaAUGActiva[i] = false;
  }
  indiceDisparoAUG = 0;
  balasPendientesAUG = 0;
  for (i = 0; i < direccionEnemigo.length; i++) {
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
      for (i = 0; i < maxEnemigos; i++) {
        enemigo[i].inicioCooldown = millis();
      }
    }
    AUG.dibujarNave();
    for (i = 0; i < maxEnemigos; i++) {
      if (existe[i]) {
        enemigo[i].dibujarNave();
      }
      if (enemigo[i].tipo != 2 || enemigo[i].hiddenValue == 10) {
        actualizarDisparos(enemigo[i].tipo, i);
      }
    }
    actualizarDisparos(AUG.tipo, -1);
    dibujarHUD();
    if (!juegoPausado) {
      colisiones();
      choqueNaves();
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
