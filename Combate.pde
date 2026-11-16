// ---------- Vidas y puntuación ----------

int Puntos = 0;

void perderVida(int tipo, int indice) {
  if (tipo == 0) {
    AUG.vidas -= dañoEnemigos;
  } else {
    enemigo[indice].vidas -= AUG.daño;
    if (enemigo[indice].vidas <= 0) {
      existe[indice] = false;
      balaEnemigoActiva[indice] = false;
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

void actualizarDisparos(int tipo, int indice) {
  if (tipo == 0) {
    for (i = 0; i < cargadorAUG; i++) {
      if (balaAUGActiva[i]) {
        stroke(#80C0FF);
        strokeWeight(2);
        fill(#4080D2);
        ellipse(balaAUGX[i], balaAUGY[i], 6, 12);
        if (!juegoPausado) {
          balaAUGY[i] -= velocidadBalaAUG;
        }
      }
      if (balaAUGY[i] < 0) {
        balaAUGActiva[i] = false;
      }
    }
  } else if (balaEnemigoActiva[indice]) {
    strokeWeight(2);
    if (tipo == 1) {
      stroke(#80FF80);
      fill(#40D240);
      quad(balaEnemigoX[indice], balaEnemigoY[indice] - 6,
           balaEnemigoX[indice] + 6, balaEnemigoY[indice],
           balaEnemigoX[indice], balaEnemigoY[indice] + 6,
           balaEnemigoX[indice] - 6, balaEnemigoY[indice]);
    } else if (tipo == 2) {
      stroke(#C0C0C0);
      fill(#808080);
      square(balaEnemigoX[indice], balaEnemigoY[indice], 12);
    } else {
      stroke(#FF8080);
      fill(#D24040);
      circle(balaEnemigoX[indice], balaEnemigoY[indice], 12);
    }
    if (!juegoPausado) {
      balaEnemigoY[indice] += velocidadBalaEnemigo[indice];
    }
    if (balaEnemigoX[indice] < 0 || balaEnemigoX[indice] > width || balaEnemigoY[indice] < 0 || balaEnemigoY[indice] > height) {
      balaEnemigoActiva[indice] = false;
    }
  }
}

void colisiones() {
  boolean impacto;
  // Balas del jugador
  for (i = 0; i < cargadorAUG; i++) {
    if (balaAUGActiva[i]) {
      j = 0;
      impacto = false;
      while (j < maxEnemigos && !impacto) {
        if (existe[j] && abs(balaAUGX[i] - enemigo[j].x) <= 48 && abs(balaAUGY[i] - enemigo[j].y) <= 48) {
          sonarSFX(sfxExplosion);
          impacto = true;
          perderVida(enemigo[j].tipo, j);
          balaAUGActiva[i] = false;
        } else if (balaEnemigoActiva[j] && abs(balaEnemigoX[j] - balaAUGX[i]) <= 16 && abs(balaEnemigoY[j] - balaAUGY[i]) <= 16) {
          balaEnemigoActiva[j] = false;
          balaAUGActiva[i] = false;
          impacto = true;
        }
        j++;
      }
    }
  }
  // Balas de los enemigos
  for (i = 0; i < maxEnemigos; i++) {
    if (balaEnemigoActiva[i] && abs(balaEnemigoX[i] - AUG.x) <= 48 && abs(balaEnemigoY[i] - AUG.y) <= 48) {
      if (enemigo[i].tipo == 1 && AUG.vidas < 3) {
        AUG.vidas = min(3, AUG.vidas + 1);
      } else if (enemigo[i].tipo == 2 && enemigo[i].hiddenValue == 10) {
        AUG.inicioCooldown = millis();
        AUG.cooldown = 8000;
      } else if (enemigo[i].tipo == 3) {
        sonarSFX(sfxHurt);
        perderVida(AUG.tipo, -1);
      }
      balaEnemigoActiva[i] = false;
    }
  }
}

void choqueNaves() {
  for (i = 0; i < maxEnemigos; i++) {
    if (existe[i] && abs(enemigo[i].x - AUG.x) <= 70 && abs(enemigo[i].y - AUG.y) <= 70) {
      switch (enemigo[i].tipo) {
        case 1:
          Puntos += 100;
          if (AUG.vidas < 3) {
            AUG.vidas = min(3, AUG.vidas + 1);
          }
          break;
        case 2:
          AUG.inicioCooldown = millis();
          AUG.cooldown = 8000;
          break;
        case 3:
          sonarSFX(sfxExplosion);
          perderVida(AUG.tipo, -1);
          break;
      }
      existe[i] = false;
    }
  }
}
