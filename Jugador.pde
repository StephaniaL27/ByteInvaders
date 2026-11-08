// ---------- Jugador ----------

Naves jugador;
int velocidadNave = 6;

// ---------- Disparos ----------

int maxDisparos = 4;
int ultimoDisparo = 0;
int inicioCooldown = 0;
int duracionCooldown = 0;

float[] disparosX = new float[maxDisparos];
float[] disparosY = new float[maxDisparos];
float velocidadDisparos = 20;

boolean[] balaActiva = new boolean[maxDisparos];

void disparar() {
  boolean puedeDisparar = true;
  i = 0;

  while (i < maxDisparos && puedeDisparar) {
    if (balaActiva[i] && disparosY[i] > jugador.y - 300) {
      puedeDisparar = false;
    }
    i++;
  }

  if (puedeDisparar && !balaActiva[ultimoDisparo]) {
    sfxLaserShoot.play();
    balaActiva[ultimoDisparo] = true;
    disparosX[ultimoDisparo] = jugador.x;
    disparosY[ultimoDisparo] = jugador.y;
    ultimoDisparo++;

    if (ultimoDisparo == maxDisparos) {
      inicioCooldown = millis();
      duracionCooldown = 2000;
      ultimoDisparo = 0;
    } else if (ultimoDisparo % 2 == 0) {
      inicioCooldown = millis();
      duracionCooldown = 1000;
    }
  }
}

void dibujarDisparos() {
  for (i = 0; i < maxDisparos; i++) {
    if (balaActiva[i]) {
      stroke(#80C0FF);
      strokeWeight(2);
      fill(#4080D2);
      rect(disparosX[i], disparosY[i], 5, 20);
      if (!juegoPausado) {
        disparosY[i] -= velocidadDisparos;
      }
    }
    if (disparosY[i] < 0) balaActiva[i] = false;
  }
}

void derribarEnemigo() {
  boolean impacto = false;
  i = 0;

  while (i < maxDisparos && !impacto) {
    if (balaActiva[i]) {
      j = 0;
      while (j < maxEnemigos && !impacto) {
        if (existe[j] && abs(disparosX[i] - enemigo[j].x) <= 48 &&
          abs(disparosY[i] - enemigo[j].y) <= 48) {
          sfxExplosion.play();
          if (enemigo[j].tipo == 1) {
            Puntos += 100;
          } else if (enemigo[j].tipo == 2) {
            if (Puntos >= 100) Puntos -= 100;
            aliadosCaidos++;
            if (aliadosCaidos % 2 == 0) perderVida();
          }
          existe[j] = false;
          balaActiva[i] = false;
          impacto = true;
        }
        j++;
      }
    }
    i++;
  }
}

void moverJugador() {
  if (arriba) jugador.y -= velocidadNave;
  if (izquierda) jugador.x -= velocidadNave;
  if (abajo) jugador.y += velocidadNave;
  if (derecha) jugador.x += velocidadNave;

  if (jugador.y < 64) jugador.y = 64;
  if (jugador.y > height - 64) jugador.y = height - 64;
  if (jugador.x < 64) jugador.x = 64;
  if (jugador.x > width - 64) jugador.x = width - 64;
}
