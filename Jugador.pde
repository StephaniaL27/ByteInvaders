int Arriba;
int Izquierda;
int Abajo;
int Derecha;
float v = 3;

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
