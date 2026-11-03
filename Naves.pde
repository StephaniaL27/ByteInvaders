PImage imagenNave;
int cantidadVidas = 3;
int direccionEnemigo[] = {1, -1, 1};
float velocidadEnemigo;

boolean existe[] = new boolean[maxEnemigos];
Naves enemigo[] = new Naves[maxEnemigos];
Naves vidas[] = new Naves[cantidadVidas];

// Clase para crear las naves como objetos

class Naves {
  int FrameActual = 0;
  PImage[] Frames = new PImage[8];
  int tipo;  //Para definir si es enemiga o no y utilizarla en las colisiones (0: Jugador 1: enemigo 2: aliado 3: distraccion)
  float x, y;

  Naves(PImage Imagen, int nTipo, float nx, float ny) {
    for (int i = 0; i < Frames.length; i++) {
      Frames[i] = Imagen.get(i * 64, 0, 64, 64);  // recorta cada cuadro de 64x64
    }
    tipo = nTipo;
    x = nx;
    y = ny;
  }

  void dibujarNave() {  //Dibuja una nave animada en 8 frames
    if (!JuegoPausado && frameCount % 8 == 0) {
      FrameActual = (FrameActual + 1) % Frames.length;
    }
    image(Frames[FrameActual], x, y, 64 * 2, 64 * 2);
  }
}

void crearEnemigos() { // Función para crear la lista que contien a los enemigos
  int  k = 0;
  int colorNave;
  float enemigoX, enemigoY;

  for (int i = 0; i < 3; i++) {
    for (int j = 0; j < 9; j++) {
      colorNave = int(random(1, 4));  // Para que las naves aparezcan de manera aleatoria en la pantalla
      switch(colorNave) {
      case 1:
        imagenNave = naveRoja;
        break;
      case 2:
        imagenNave = naveVerde;
        break;
      default:
        imagenNave = naveGris;
      }

      enemigoX  = width / 2 - 4 * 128 + j * 128;
      enemigoY = 200 + i * 128;

      enemigo[k] = new Naves(imagenNave, colorNave, enemigoX, enemigoY);
      existe[k] = true;
      k++;  // Para pasar a la siguiente nave
    }
  }
}

void moverEnemigos() {
  switch(dificultad) {
  case 1:
    velocidadEnemigo = 6;
    break;
  case 2:
    velocidadEnemigo = 9;
    break;
  default:
    velocidadEnemigo = 12;
  }
  if (!JuegoPausado) {
    float minX = 64;
    float maxX = width - 64;
    int fila;

    for (int i = 0; i < maxEnemigos; i++) {
      fila = i / 9;
      if (existe[i]) {
        if (direccionEnemigo[fila] == -1 && enemigo[i].x <= minX) {
          direccionEnemigo[fila] = 1;
        } else if (direccionEnemigo[fila] == 1 && enemigo[i].x >= maxX) {
          direccionEnemigo[fila] = -1;
        }
      }
    }

    for (int i = 0; i < maxEnemigos; i++) {
      fila = i / 9;
      if (existe[i])
        enemigo[i].x += velocidadEnemigo * direccionEnemigo[fila];
    }
  }
}

int nahIdWin(int i, int t) {
  int gojoWon = 1;
  if (i < t) {
    if (existe[i] && enemigo[i].tipo == 1) {
      gojoWon = 0;
    } else {
      gojoWon = nahIdWin(i + 1, t);
    }
  }
  return gojoWon;
}



int FrameActualC = 0;
float Xinicial = 100;
float Y = 70;
float distanciaC = 50;
PImage FramesC[] = new PImage[8];

void dibujarVidas() {
  for (int j = 0; j < FramesC.length; j++) {
    FramesC[j] = corazones.get(j * 32, 0, 32, 32);  // recorta cada cuadro de 32x32
  }
  for (int i = 0; i < cantidadVidas; i++) {
    if (!JuegoPausado && frameCount % 8 == 0) {
      FrameActualC = (FrameActualC + 1) % FramesC.length;
    }
    image(FramesC[FrameActualC], Xinicial + distanciaC*i, Y, 32  *  2, 32  *  2);
  }
}

float radioChoque = 70;   // aprox. mitad de la nave dibujada (128/2);
void perderVida() {
  cantidadVidas -= 1;
  if (cantidadVidas <= 0) {
    cantidadVidas = 0;
    gameOver = true;
  }
}

void gameOver() {
}

void choqueNaves() {
  for (int i = 0; i < maxEnemigos; i++) {
    if (existe[i] &&
      abs(enemigo[i].x - Jugador.x) < radioChoque &&
      abs(enemigo[i].y - Jugador.y) < radioChoque) {

      switch (enemigo[i].tipo) {
      case 1:  // roja: pierdes una vida
        sfxExplosion.play();
        perderVida();
        break;
      case 2:  // verde: puntos y vida (máximo 3)
        Puntos += 50;
        cantidadVidas = min(cantidadVidas + 1, 3);
        break;
      case 3:  // gris: distracción, no puedes disparar 2 s
        inicioCooldown = millis();
        duracionCooldown = 2000;
        break;
      }
      existe[i] = false;  // la nave tocada desaparece
    }
  }
}


void dibujarJuego() {
  if (!JuegoGanado && !gameOver) {
    Jugador.dibujarNave();
    for (int i = 0; i < maxEnemigos; i++) {
      if (existe[i]) {
        enemigo[i].dibujarNave();
      }
    }

    if (!JuegoPausado) {
      moverJugador();
      moverEnemigos();

      if (espacio && millis() - inicioCooldown >= duracionCooldown) {
        disparar();
      }

      dibujarDisparos();
      derribarEnemigo();
      choqueNaves();

      dibujarVidas();
      fill(#ffffff);
      textSize(40);
      text(Puntos, width/2 - 500, 70);

      if (nahIdWin(0, maxEnemigos) == 1 && !victoriaSonada) {
        JuegoGanado = true;
        musicaJuego.stop();
        sfxVictory.play();
        victoriaSonada = true;
      }
    }
  }

  if (JuegoGanado) {
    GestorPantallas.dibujarVictoria();
  } else if (gameOver) {
    GestorPantallas.dibujarGameOver();
  } else {
    GestorPantallas.dibujarBotonPausaHUD();

    if (JuegoPausado) {
      GestorPantallas.dibujarVentanaPausa();
    }
  }
}
