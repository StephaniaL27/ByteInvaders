// ---------- Enemigos ----------

int maxEnemigos = 27;
int[] direccionEnemigo = {1, -1, 1};
float velocidad;
float dañoEnemigos;
boolean[] existe = new boolean[maxEnemigos];
Nave[] enemigo = new Nave[maxEnemigos];

// ---------- Disparos de los enemigos ----------

float velocidadDisparosEnemigos = 5;
float[] balasEnemigoX = new float[maxEnemigos];
float[] balasEnemigoY = new float[maxEnemigos];
float[] balasEnemigoVX = new float[maxEnemigos];
float[] balasEnemigoVel = new float[maxEnemigos];
boolean[] balaEnemigoExiste = new boolean[maxEnemigos];

void crearEnemigos() {
  float x, y;
  int c1, c2, c3;
  int k;
  for (i = 0; i < 3; i++) {
    do {
      k = i * 9;
      c1 = 0;
      c2 = 0;
      c3 = 0;
      for (j = 0; j < 9; j++) {
        x = width / 2 - 4 * 128 + j * 128;
        y = 64 + i * 128;
        enemigo[k] = new Nave(x, y, velocidad, int(random(1, 4)), int(random(9, 11)), 3, dañoEnemigos, random(4000, 16000), millis());
        existe[k] = true;
        balaEnemigoExiste[k] = false;
        switch (enemigo[k].tipo) {
          case 1:
            c1 += 1;
            break;
          case 2:
            c2 += 1;
            break;
          default:
            c3 += 1;
        }
        k++;
      }
    } while (c1 < 3 || c2 < 3 || c3 < 3);
  }
}

void moverEnemigos() {

  // Cambia la dirección de cada fila cuando alcanza un extremo.

  for (i = 0; i < maxEnemigos; i++) {
    int fila = i / 9;
    if (existe[i]) {
      if (direccionEnemigo[fila] == -1 && enemigo[i].x <= 64) {
        direccionEnemigo[fila] = 1;
      } else if (direccionEnemigo[fila] == 1 && enemigo[i].x >= width - 64) {
        direccionEnemigo[fila] = -1;
      }
    }
  }
  for (i = 0; i < maxEnemigos; i++) {
    int fila = i / 9;
    if (existe[i]) {
      enemigo[i].x += enemigo[i].v * direccionEnemigo[fila];
    }
  }
}

void dispEnemigo() {
  for (i = 0; i < maxEnemigos; i++) {
    if (existe[i] && !balaEnemigoExiste[i] && millis() - enemigo[i].inicioCooldown >= enemigo[i].cooldown) {
      balasEnemigoVel[i] = random(10, 20);
      balaEnemigoExiste[i] = true;
      balasEnemigoX[i] = enemigo[i].x;
      balasEnemigoY[i] = enemigo[i].y;
      enemigo[i].inicioCooldown = millis();
      sfxLaserShoot.play();
    }
  }
}

int nahIdWin(int i, int t) {
  int gojoWon = 1;
  if (i < t) {
    if (existe[i] && enemigo[i].tipo == 3) {
      gojoWon = 0;
    } else {
      gojoWon = nahIdWin(i + 1, t);
    }
  }
  return gojoWon;
}
