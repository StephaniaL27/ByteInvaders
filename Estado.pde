// ---------- Estado general ----------

float pantalla = 0;
boolean juegoPausado = false;
boolean juegoGanado = false;
boolean gameOver = false;

void dibujarJuego() {
  if (!juegoGanado && !gameOver) {
    if (!juegoPausado) {
      moverJugador();
      moverEnemigos();
      if (millis() - AUG.inicioCooldown >= AUG.cooldown) {
        AUG();
      }
      dispEnemigo();
    }
    AUG.dibujarNave();
    for (i = 0; i < maxEnemigos; i++) {
      if (existe[i]) {
        enemigo[i].dibujarNave();
      }
    }
    dibujarDisparos(AUG.tipo, -1);
    for (i = 0; i < maxEnemigos; i++) {
      if (enemigo[i].tipo == 1 || enemigo[i].tipo == 2 && enemigo[i].hiddenValue == 10 || enemigo[i].tipo == 3) {
        dibujarDisparos(enemigo[i].tipo, i);
      }
    }
    dibujarVidas();
    textoJuego.Contenido = str(Puntos);
    textoJuego.dibujarTexto();
    if (!juegoPausado) {
      colisiones();
      choqueNaves();
      if (nahIdWin(0, maxEnemigos) == 1 && !gameOver) {
        juegoGanado = true;
        sfxVictory.play();
      }
    }
  }
  if (juegoGanado) {
    EquilibrioRestaurado();
  } else if (gameOver) {
    gameOver();
  } else if (juegoPausado) {
    gamePaused();
  } else {
    botonPause.dibujarBoton();
  }
}

void iniciarPartida() {
  juegoGanado = false;
  gameOver = false;
  juegoPausado = false;
  espacio = false;
  arriba = false;
  abajo = false;
  izquierda = false;
  derecha = false;
  for (i = 0; i < botonesDificultad.length; i++) {
    if (botonesDificultad[i].seleccionado) {
      dañoEnemigos = (i + 2) / 3.0;
      AUG.damage = (-i + 4) / 3.0;
    }
  }
  for (i = 0; i < botonesVelocidad.length; i++) {
    if (botonesVelocidad[i].seleccionado) {
      velocidad = (i + 1) * 2;
    }
  }
  AUG.v = velocidad;
  AUG.vidas = 3;
  AUG.x = width / 2;
  AUG.y = height + 128;
  AUG.FrameActual = 0;
  AUG.cooldown = 0;
  AUG.inicioCooldown = 0;
  for (i = 0; i < cargadorAUG; i++) {
    balaAUGExiste[i] = false;
  }
  indiceDisparoAUG = 0;
  balasPendientesAUG = 0;
  for (i = 0; i < direccionEnemigo.length; i++) {
    if (i % 2 == 0) {
      direccionEnemigo[i] = 1;
    } else {
      direccionEnemigo[i] = -1;
    }
  }
  crearEnemigos();
  Puntos = 0;
  FrameActualC = 0;
  scroll = -interlineado / 2;
}
