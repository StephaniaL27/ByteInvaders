// ---------- Vidas y puntuación ----------

int Puntos = 0;
float radioChoque = 70;

// ---------- HUD ----------

int FrameActualC = 0;
float Xinicial = 100;
float Y = 70;
float distanciaC = 50;
PImage[] FramesC = new PImage[8];

void dibujarVidas() {
  if (!juegoPausado && frameCount % FPS == 0) {
    FrameActualC = (FrameActualC + 1) % FramesC.length;
  }
  for (i = 0; i < AUG.vidas; i++) {
    image(FramesC[FrameActualC], Xinicial + distanciaC * i, Y, 64, 64);
  }
}

void perderVida(int tipo, int indice) {
  if (tipo == 0) {
    AUG.vidas -= dañoEnemigos;
  } else {
    enemigo[indice].vidas -= AUG.damage;
    if (enemigo[indice].vidas <= 0) {
      existe[indice] = false;
      balaEnemigoExiste[indice] = false;
      if (enemigo[indice].tipo == 1 || enemigo[indice].tipo == 2 && enemigo[indice].hiddenValue == 9) {
        if (Puntos >= 100) {
          Puntos -= 100;
        }
        AUG.vidas--;
      } else if (enemigo[indice].tipo == 3 || enemigo[indice].tipo == 2 && enemigo[indice].hiddenValue == 10) {
        Puntos += 100;
      }
    }
  }
  if (AUG.vidas <= 0) {
    AUG.vidas = 0;
    gameOver = true;
  }
}

// ---------- Disparos y colisiones ----------

void dibujarDisparos(int tipo, int indice) {
  if (tipo == 0) {
    for (i = 0; i < cargadorAUG; i++) {
      if (balaAUGExiste[i]) {
        stroke(#80C0FF);
        strokeWeight(2);
        fill(#4080D2);
        ellipse(balasAUGX[i], balasAUGY[i], 6, 12);
        if (!juegoPausado) {
          balasAUGY[i] -= velocidadDisparos;
        }
      }
      if (balasAUGY[i] < 0) {
        balaAUGExiste[i] = false;
      }
    }
  } else if (balaEnemigoExiste[indice]) {
    strokeWeight(2);
    if (tipo == 1) {
      stroke(#80FF80);
      fill(#40D240);
      quad(balasEnemigoX[indice], balasEnemigoY[indice] - 6,
           balasEnemigoX[indice] + 6, balasEnemigoY[indice],
           balasEnemigoX[indice], balasEnemigoY[indice] + 6,
           balasEnemigoX[indice] - 6, balasEnemigoY[indice]);
    } else if (tipo == 2) {
      stroke(#C0C0C0);
      fill(#808080);
      square(balasEnemigoX[indice], balasEnemigoY[indice], 12);
    } else {
      stroke(#FF8080);
      fill(#D24040);
      circle(balasEnemigoX[indice], balasEnemigoY[indice], 12);
    }
    if (!juegoPausado) {
      balasEnemigoY[indice] += balasEnemigoVel[indice];
    }
    if (balasEnemigoX[indice] < 0 || balasEnemigoX[indice] > width || balasEnemigoY[indice] < 0 || balasEnemigoY[indice] > height) {
      balaEnemigoExiste[indice] = false;
    }
  }
}

void colisiones() {
  boolean impacto;

  // Balas del jugador

  for (i = 0; i < cargadorAUG; i++) {
    if (balaAUGExiste[i]) {
      j = 0;
      impacto = false;
      while (j < maxEnemigos && !impacto) {
        if (existe[j] && abs(balasAUGX[i] - enemigo[j].x) <= 48 && abs(balasAUGY[i] - enemigo[j].y) <= 48) {
          sfxExplosion.play();
          impacto = true;
          perderVida(enemigo[j].tipo, j);
          balaAUGExiste[i] = false;
        } else if (balaEnemigoExiste[j] && abs(balasEnemigoX[j] - balasAUGX[i]) <= 16 && abs(balasEnemigoY[j] - balasAUGY[i]) <= 16) {
          balaEnemigoExiste[j] = false;
          balaAUGExiste[i] = false;
          impacto = true;
        }
        j++;
      }
    }
  }

  // Balas de los enemigos

  for (i = 0; i < maxEnemigos; i++) {
    if (balaEnemigoExiste[i] && abs(balasEnemigoX[i] - AUG.x) <= 48 && abs(balasEnemigoY[i] - AUG.y) <= 48) {
      if (enemigo[i].tipo == 1 && AUG.vidas < 3) {
        AUG.vidas++;
      } else if (enemigo[i].tipo == 2 && enemigo[i].hiddenValue == 10) {
        AUG.inicioCooldown = millis();
        AUG.cooldown = 8000;
      } else if (enemigo[i].tipo == 3) {
        sfxExplosion.play();
        perderVida(AUG.tipo, -1);
      }
      balaEnemigoExiste[i] = false;
    }
  }
}

void choqueNaves() {
  for (i = 0; i < maxEnemigos; i++) {
    if (existe[i] && abs(enemigo[i].x - AUG.x) <= radioChoque && abs(enemigo[i].y - AUG.y) < radioChoque) {
      switch (enemigo[i].tipo) {
        case 1:
          Puntos += 100;
          if (AUG.vidas < 3) {
            AUG.vidas++;
          }
          break;
        case 2:
          AUG.inicioCooldown = millis();
          AUG.cooldown = 8000;
          break;
        case 3:
          sfxExplosion.play();
          perderVida(AUG.tipo, -1);
      }
      existe[i] = false;
    }
  }
}
