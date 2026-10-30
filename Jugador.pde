int Arriba;
int Izquierda;
int Abajo;
int Derecha;

float v = 20;
int maxDisparos = 20;
float[] disparosX = new float[maxDisparos];
float[] disparosY = new float[maxDisparos];
float velDisp = 20;

boolean[] balaAct = new boolean[maxDisparos];

void keyPressed() {
  // Tecla para pausar el juego
  if (keyCode == ENTER) {
    if (pantalla == 2) {
      juegoPausado = !juegoPausado;
    }
  }
  if (key == 'w' || key == 'W' || keyCode == UP) {
    Arriba = 1;
  }
  if (key == 'a' || key == 'A' || keyCode == LEFT) {
    Izquierda = 1;
  }
  if (key == 's' || key == 'S' || keyCode == DOWN) {
    Abajo = 1;
  }
  if (key == 'd' || key == 'D' || keyCode == RIGHT) {
    Derecha = 1;
  }
  if (key == ' ') {
    for (int i = 0; i< maxDisparos; i++) {
      if (balaAct[i] == false) {
        balaAct[i] = true;
        disparosX[i] = jugador.x;
        disparosY[i] = jugador.y + 10;
        break;
      }
    }
  }
}

void keyReleased() {
  if (key == 'w' || key == 'W' || keyCode == UP) {
    Arriba = 0;
  }
  if (key == 'a' || key == 'A' || keyCode == LEFT) {
    Izquierda = 0;
  }
  if (key == 's' || key == 'S' || keyCode == DOWN) {
    Abajo = 0;
  }
  if (key == 'd' || key == 'D' || keyCode == RIGHT) {
    Derecha = 0;
  }
}

void moverNave() {
  if (Arriba == 1) {
    jugador.y -= v;
  }
  if (Izquierda == 1) {
    jugador.x -= v;
  }
  if (Abajo == 1) {
    jugador.y += v;
  }
  if (Derecha == 1) {
    jugador.x += v;
  }

  // límites de pantalla
  if (jugador.y <= 32) {
    jugador.y += v;
  }
  if (jugador.x <= 32) {
    jugador.x += v;
  }
  if (jugador.y >= height - 32) {
    jugador.y -= v;
  }
  if (jugador.x >= width - 32) {
    jugador.x -= v;
  }
}

void dibujarDisparos() {
  for (int i = 0; i < maxDisparos; i++) {
    if (balaAct[i]) {
      fill(#4080d2);
      rect(disparosX[i], disparosY[i], 5, 20);
      disparosY[i] -= velDisp;
    }
    if (disparosY[i] < 0) {
      balaAct[i] = false;
    }
  }
}
