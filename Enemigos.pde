int maxEnemigos = 36;
boolean[] existe = new boolean[maxEnemigos];
boolean[] verificada = new boolean[maxEnemigos];
int[] direccionEnemigo = {1, -1, 1};
Nave[] enemigo = new Nave[maxEnemigos];

// ---------- Disparos de los enemigos ----------

boolean[] balaEnemigoActiva = new boolean[maxEnemigos];
float[] balaEnemigoX = new float[maxEnemigos];
float[] balaEnemigoY = new float[maxEnemigos];
float[] velocidadBalaEnemigo = new float[maxEnemigos];

// ---------- Picada ----------

// 0: sin picada, 1: bajando, 2: esperando, 3: subiendo.
int fasePicada = 0;
int enemigoPicando;
int inicioFase = 0;
float alturaOriginal;

void crearEnemigos() {
  int k;
  for (int i = 0; i < 3; i++) {
    // Cada fila tiene exactamente 4 naves de cada tipo, en orden aleatorio.
    int[] tipos = {1, 1, 1, 1, 2, 2, 2, 2, 3, 3, 3, 3};
    for (int j = tipos.length - 1; j > 0; j--) {
      k = int(random(j + 1));
      int t = tipos[j];
      tipos[j] = tipos[k];
      tipos[k] = t;
    }
    for (int j = 0; j < tipos.length; j++) {
      k = i * tipos.length + j;
      // Las 12 naves de la fila, pegadas una a la otra, cubren la pantalla de borde a borde.
      enemigo[k] = new Nave(posicion(j, 64, 128), posicion(i, 64, 128), 3 * direccionEnemigo[i], tipos[j], int(random(9, 11)), 3, random(2000, 8000) * pow(sqrt(2), 1 - dificultad), millis());
      existe[k] = true;
      verificada[k] = false;
      balaEnemigoActiva[k] = false;
    }
  }
}

void moverEnemigosX() {
  for (int i = 0; i < maxEnemigos; i++) {
    if (existe[i]) {
      enemigo[i].x += enemigo[i].v;
      // Al salir por un borde, la nave vuelve a entrar por el otro.
      if (enemigo[i].x > width + 64) {
        enemigo[i].x -= width + 128;
      } else if (enemigo[i].x < -64) {
        enemigo[i].x += width + 128;
      }
    }
  }
}

void moverEnemigosY() {
  switch (fasePicada) {
    case 0:
      if (millis() - inicioFase >= 2000 * pow(sqrt(2), 1 - dificultad)) {
        enemigoPicando = int(random(0, 36));
        if (existe[enemigoPicando] && !verificada[enemigoPicando]) {
          alturaOriginal = enemigo[enemigoPicando].y;
          fasePicada = 1;
        }
      }
      break;
    case 1:
      if (enemigo[enemigoPicando].y < AUG.y) {
        enemigo[enemigoPicando].y += 6;
      } else {
        fasePicada = 2;
        inicioFase = millis();
      }
      break;
    case 2:
      if (millis() - inicioFase >= 1000) {
        fasePicada = 3;
      }
      break;
    default:
      if (enemigo[enemigoPicando].y > alturaOriginal) {
        enemigo[enemigoPicando].y -= 6;
      } else {
        enemigo[enemigoPicando].y = alturaOriginal;
        fasePicada = 0;
        inicioFase = millis();
      }
      break;
  }
}

void dispararEnemigo() {
  for (int i = 0; i < maxEnemigos; i++) {
    if ((enemigo[i].tipo != 2 || enemigo[i].hiddenValue == 10) && existe[i] && !balaEnemigoActiva[i] && millis() - enemigo[i].inicioCooldown >= enemigo[i].cooldown) {
      velocidadBalaEnemigo[i] = random(8, 16);
      balaEnemigoActiva[i] = true;
      balaEnemigoX[i] = enemigo[i].x;
      balaEnemigoY[i] = enemigo[i].y;
      enemigo[i].inicioCooldown = millis();
      switch (enemigo[i].tipo) {
        case 1:
          sonarSFX(sfxAliado);
          break;
        case 2:
          sonarSFX(sfxGris);
          break;
        case 3:
          sonarSFX(sfxEnemigo);
          break;
      }
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
