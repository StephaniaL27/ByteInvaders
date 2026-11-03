boolean arriba;
boolean izquierda;
boolean abajo;
boolean derecha;
boolean espacio = false;
int maxDisparos = 4;
float[] disparosX = new float[maxDisparos];
float[] disparosY = new float[maxDisparos];
float velocidadDisparos = 20;
boolean[] balaActiva = new boolean[maxDisparos];
int ultimoDisparo = 0;
int inicioCooldown = 0;
int duracionCooldown = 0;
int aliadosCaidos = 0;

void keyPressed() {

  // Tecla para pausar el juego

  if (keyCode == ENTER && pantalla == 2)
    JuegoPausado = !JuegoPausado;

  if (key == 'w' || key == 'W' || keyCode == UP)
    arriba = true;
  if (key == 'a' || key == 'A' || keyCode == LEFT)
    izquierda = true;
  if (key == 's' || key == 'S' || keyCode == DOWN)
    abajo = true;
  if (key == 'd' || key == 'D' || keyCode == RIGHT)
    derecha = true;
  if (key == ' ')
    espacio = true;
  if (key == 's' && pantalla == 1.5)
    pantalla = 2;
}

void disparar() {
  boolean puedeDisparar = true;
  int i = 0;

  while (i < maxDisparos && puedeDisparar) {
    if (balaActiva[i] && disparosY[i] > Jugador.y - 300) {
      puedeDisparar = false;
    }
    i++;
  }

  if (puedeDisparar && !balaActiva[ultimoDisparo]) {
    sfxLaserShoot.play();

    balaActiva[ultimoDisparo] = true;
    disparosX[ultimoDisparo] = Jugador.x;
    disparosY[ultimoDisparo] = Jugador.y;
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
  for (int i = 0; i < maxDisparos; i++) {
    if (balaActiva[i]) {
      fill(#4080d2);
      rect(disparosX[i], disparosY[i], 5, 20);
      disparosY[i] -= velocidadDisparos;
    }

    if (disparosY[i] < 0) {
      balaActiva[i] = false;
    }
  }
}

void derribarEnemigo() {
  int i = 0, j = 0, sw = 0;

  while (i < maxDisparos && sw == 0) {
    if (balaActiva[i]) {
      j = 0;
      while (j < maxEnemigos && sw == 0) {
        if (existe[j]) {
          if (abs(disparosX[i] - enemigo[j].x) <= 48 && abs(disparosY[i] - enemigo[j].y) <= 48) {
            sfxExplosion.play();
            if (enemigo[j].tipo == 1) {
              Puntos += 100;
            } else if (enemigo[j].tipo == 2) {
              if (Puntos >= 100) {
                Puntos -= 100;
              }
              aliadosCaidos += 1;
              if (aliadosCaidos == 2) {
                perderVida();
                aliadosCaidos = 0;
              }
            }
            existe[j] = false;
            balaActiva[i] = false;
            sw = 1;
          }
        }
        j += 1;
      }
    }
    i += 1;
  }
}

void keyReleased() {
  if (key == 'w' || key == 'W' || keyCode == UP)
    arriba = false;
  if (key == 'a' || key == 'A' || keyCode == LEFT)
    izquierda = false;
  if (key == 's' || key == 'S' || keyCode == DOWN)
    abajo = false;
  if (key == 'd' || key == 'D' || keyCode == RIGHT)
    derecha = false;

  if (key == ' ')
    espacio = false;
}

void moverJugador() {
  if (arriba)
    Jugador.y -= velocidadNave;
  if (izquierda)
    Jugador.x -= velocidadNave;
  if (abajo)
    Jugador.y += velocidadNave;
  if (derecha)
    Jugador.x += velocidadNave;

  // límites de pantalla

  if (Jugador.y <= 64)
    Jugador.y += velocidadNave;
  if (Jugador.x <= 64)
    Jugador.x += velocidadNave;
  if (Jugador.y >= height - 64)
    Jugador.y -= velocidadNave;
  if (Jugador.x >= width - 64)
    Jugador.x -= velocidadNave;
}
