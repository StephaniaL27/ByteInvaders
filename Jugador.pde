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
