boolean Arriba;
boolean Izquierda;
boolean Abajo;
boolean Derecha;
boolean Espacio = false;
boolean EspacioBloqueado = false;

float v = 3;

int maxDisparos = 12;
float[] disparosX = new float[maxDisparos];
float[] disparosY = new float[maxDisparos];
float velDisp = 20;
boolean[] balaAct = new boolean[maxDisparos];

int ultimapos = 0;
int Cooldown = -5000;

void keyPressed() {
  // Tecla para pausar el juego
  if (keyCode == ENTER && pantalla == 2)
    JuegoPausado = !JuegoPausado;
  
  if (key == 'w' || key == 'W' || keyCode == UP)
    Arriba = true;
  if (key == 'a' || key == 'A' || keyCode == LEFT)
    Izquierda = true;
  if (key == 's' || key == 'S' || keyCode == DOWN)
    Abajo = true;
  if (key == 'd' || key == 'D' || keyCode == RIGHT)
    Derecha = true;
  
  if (key == ' ' && !EspacioBloqueado && millis() - Cooldown >= 5000)
    Espacio = true;
}

void Disparar() {
  boolean puedeDisparar = true;
  int i = 0;

  while (i < maxDisparos && puedeDisparar) {
    if (balaAct[i] && disparosY[i] > Jugador.y - 400) {
      puedeDisparar = false;
    }
    i++;
  }

  if (puedeDisparar && !balaAct[ultimapos]) {
    balaAct[ultimapos] = true;
    disparosX[ultimapos] = Jugador.x;
    disparosY[ultimapos] = Jugador.y + 10;

    ultimapos++;

    if (ultimapos == maxDisparos) {
      Cooldown = millis();
      EspacioBloqueado = true;
      ultimapos = 0;
    }
  }
}

void DibujarDisparos() {
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

void impacto() {
  int i = 0, j = 0, sw = 0;
  while (i < maxDisparos && sw == 0) {
    if (balaAct[i]) {
      j = 0;
      while (j < MaxEnemigos && sw == 0) {
        if (Existe[j]) {
          if (abs(disparosX[i] - enemigo[j].x) <= 50 && abs(disparosY[i] - enemigo[j].y) <= 50){
            Existe[j] = false;
            balaAct[i] = false;
            sw = 1;
          }
        }
        j += 1;
      }
    }
    i += 1;
  }
}

void keyReleased()  {
  if (key == 'w' || key == 'W' || keyCode == UP)
    Arriba = false;
  if (key == 'a' || key == 'A' || keyCode == LEFT)
    Izquierda = false;
  if (key == 's' || key == 'S' || keyCode == DOWN)
    Abajo = false;
  if (key == 'd' || key == 'D' || keyCode == RIGHT)
    Derecha = false;
  
  if(key == ' ')
    Espacio = false;
}

void MoverNave() {
  if (Arriba)
    Jugador.y -= v;
  if (Izquierda)
    Jugador.x -= v;
  if (Abajo)
    Jugador.y += v;
  if (Derecha)
    Jugador.x += v;

  // límites de pantalla
  if (Jugador.y <= 64)
    Jugador.y += v;
  if (Jugador.x <= 64)
    Jugador.x += v;
  if (Jugador.y >= height - 64)
    Jugador.y -= v;
  if (Jugador.x >= width - 64)
    Jugador.x -= v;
}
