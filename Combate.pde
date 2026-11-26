// ---------- Vidas y puntuación ----------

int Puntos = 0;

// indice: posición del enemigo alcanzado; -1 si el que recibe el golpe es el jugador.
void perderVida(int i) {
  if (i == -1) {
    // Todo daño al jugador: pierde el escudo o una vida, va lento 3 s y queda invulnerable 1 s.
    if (millis() - inicioInvulnerable >= 1000) {
      sonarSFX(sfxHurt);
      if (escudoActivo) {
        escudoActivo = false;
      } else {
        AUG.vidas--;
      }
      inicioInvulnerable = millis();
      inicioLento = millis();
    }
  } else {
    enemigo[i].vidas--;
    if (enemigo[i].vidas <= 0) {
      existe[i] = false;
      for (int j = i / 12 * 12; j < i / 12 * 12 + 12; j++) {
        enemigo[j].v *= pow(3, 1.0 / 11.0);
      }
      if (enemigo[i].tipo == 1 || enemigo[i].tipo == 2 && enemigo[i].hiddenValue == 9) {
        if (Puntos >= 100) {
          Puntos -= 100;
        }
        perderVida(-1);
      } else if (enemigo[i].tipo == 3 || enemigo[i].tipo == 2 && enemigo[i].hiddenValue == 10) {
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

void actualizarDisparos() {
  strokeWeight(2);
  for (int i = 0; i < cargadorAUG; i++) {
    if (balaAUGActiva[i]) {
      stroke(#80C0FF);
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
  for (int i = 0; i < maxEnemigos; i++) {
    if (balaEnemigoActiva[i]) {
      if (enemigo[i].tipo == 1) {
        // Círculo: cura.
        stroke(#80FF80);
        fill(#40D240);
        circle(balaEnemigoX[i], balaEnemigoY[i], 12);
      } else if (enemigo[i].tipo == 2) {
        // Cuadrado: bloquea el arma.
        stroke(#C0C0C0);
        fill(#808080);
        square(balaEnemigoX[i], balaEnemigoY[i], 10);
      } else {
        // Triángulo hacia abajo: daño.
        stroke(#FF8080);
        fill(#D24040);
        triangle(balaEnemigoX[i] - 6, balaEnemigoY[i] - 4, balaEnemigoX[i] + 6, balaEnemigoY[i] - 4, balaEnemigoX[i], balaEnemigoY[i] + 8);
      }
      if (!juegoPausado) {
        balaEnemigoY[i] += velocidadBalaEnemigo[i];
      }
      if (balaEnemigoX[i] < 0 || balaEnemigoX[i] > width || balaEnemigoY[i] < 0 || balaEnemigoY[i] > height) {
        balaEnemigoActiva[i] = false;
      }
    }
  }
}

void detectarImpactos() {
  // Balas del jugador
  for (int i = 0; i < cargadorAUG; i++) {
    if (balaAUGActiva[i]) {
      boolean impacto = false;
      int j = 0;
      while (j < maxEnemigos && !impacto) {
        if (existe[j] && abs(balaAUGX[i] - enemigo[j].x) <= 48 && abs(balaAUGY[i] - enemigo[j].y) <= 48) {
          sonarSFX(sfxExplosion);
          impacto = true;
          perderVida(j);
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
  for (int i = 0; i < maxEnemigos; i++) {
    if (balaEnemigoActiva[i] && abs(balaEnemigoX[i] - AUG.x) <= 48 && abs(balaEnemigoY[i] - AUG.y) <= 48) {
      if (enemigo[i].tipo == 1) {
        AUG.vidas = min(3, AUG.vidas + 1);
      } else if (enemigo[i].tipo == 2 && enemigo[i].hiddenValue == 10) {
        if (escudoActivo) {
          escudoActivo = false;
        } else {
          AUG.inicioCooldown = millis();
          AUG.cooldown = 4000;
        }
      } else if (enemigo[i].tipo == 3) {
        perderVida(-1);
      }
      balaEnemigoActiva[i] = false;
    }
  }
}

// Ningún choque destruye la nave enemiga. La verde da escudo, la gris inocente no hace nada
// y la roja y la gris encubierta hacen daño.
void detectarChoques() {
  for (int i = 0; i < maxEnemigos; i++) {
    if (existe[i] && abs(enemigo[i].x - AUG.x) <= 64 && abs(enemigo[i].y - AUG.y) <= 64) {
      if (enemigo[i].tipo == 1) {
        escudoActivo = true;
      } else if (enemigo[i].tipo == 3 || enemigo[i].tipo == 2 && enemigo[i].hiddenValue == 10) {
        perderVida(-1);
      } else {
        verificada[i] = true;
      }
    }
  }
}
