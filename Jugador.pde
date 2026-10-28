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
        disparosX[i] = x;
        disparosY[i] =y;
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
    y = y - v;
  }
  if (Izquierda == 1) {
    x = x - v;
  }
  if (Abajo == 1) {
    y = y + v;
  }
  if (Derecha == 1) {
    x = x + v;
  }

  // límites de pantalla
  if (y <= 32) {
    y = y + v;
  }
  if (x <= 32) {
    x = x + v;
  }
  if (y >= height - 32) {
    y = y - v;
  }
  if (x >= width - 32) {
    x = x - v;
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
