PImage imagen_nave;
int cantVidas = 3;
int direccionEnemigos = 1;
float velocidadEnemigos = 2;
float Ex, Ey;
Naves nav_enemigas[] = new Naves[maxEnemigos];
Naves vidas[] = new Naves[cantVidas];

// Clase para crear las naves como objetos
class Naves {
  int frameActual = 0;
  PImage[] frames = new PImage[8];
  float x, y;
  int tipo; //Para definir si es enemiga o no y utilizarla en las colisiones (0: jugador 1: enemigo 2: aliado 3: distraccion

  Naves(PImage imagen, float nx, float ny, int tipoN) {
    for (int i = 0; i < 8; i++) {
      frames[i] = imagen.get(i * 64, 0, 64, 64);  // recorta cada cuadro de 64x64
    }
    x = nx;
    y = ny;
    tipo = tipoN;
  }

  void dibujarNaves() { //Dibuja una nave animada en 8 frames
    if (!juegoPausado) {
      if (frameCount % 6 == 0) {
        frameActual = (frameActual + 1) % 8;
      }
    }
    image(frames[frameActual], x, y, 64*2, 64*2);
  }
}

void crearEnemigos() { // Función para crear la lista que contien a los enemigos
  float espacio = 110;
  float margen = 200;
  int  i = 0;
  for (int bloque = 0; bloque < 2; bloque++) { // Vamos a dibujar dos bloques de enemigos
    float inicioX = (bloque == 0) ? margen : width - margen - 4 * espacio; // Para definir la posición inicial de cada bloque

    // Cada bloque es una matriz
    for (int fila = 0; fila < 2; fila++) {
      for (int col = 0; col < 5; col++) {
        int tipo = int(random(1, 4)); // Para que las naves aparezcan de manera aleatoria en la pantalla
        switch(tipo) {
        case 1:
          imagen_nave = nave_roja;
          break;
        case 2:
          imagen_nave = nave_verde;
          break;
        case 3:
          imagen_nave = nave_gris;
          break;
        }

        float Ex  = inicioX + col * espacio;
        float Ey = 200 + fila * espacio;

        nav_enemigas[i] = new Naves(imagen_nave, Ex, Ey, tipo);
        i++; // Para pasar a la siguiente nave
      }
    }
  }
}

void moverEnemigos() {
  if (!juegoPausado) {
    float minX = 64;
    float maxX = width - 64;

    for (int i = 0; i < maxEnemigos; i++) {
      if (nav_enemigas[i].x == minX) {
        direccionEnemigos = 1;
      } else if ( nav_enemigas[i].x == maxX) {
        direccionEnemigos = -1;
      }
    }

    for (int i = 0; i < maxEnemigos; i++) {
      nav_enemigas[i].x += velocidadEnemigos * direccionEnemigos;
    }
  }
}
