PImage ImagenNave;

int Cantidad_vidas = 3;
int DireccionEnemigos = 1;
float VelocidadEnemigos = 2;
float Ex, Ey;

boolean Existe[] = new boolean[MaxEnemigos];

Naves enemigo[] = new Naves[MaxEnemigos];
Naves Vidas[] = new Naves[Cantidad_vidas];

// Clase para crear las naves como objetos
class Naves {
  int FrameActual = 0;
  PImage[] Frames = new PImage[8];
  float x, y;
  int Tipo; //Para definir si es enemiga o no y utilizarla en las colisiones (0: jugador 1: enemigo 2: aliado 3: distraccion)

  Naves(PImage Imagen, float nx, float ny, int TipoNave) {
    for (int i = 0; i < Frames.length; i++) {
      Frames[i] = Imagen.get(i * 64, 0, 64, 64);  // recorta cada cuadro de 64x64
    }

    x = nx;
    y = ny;
    Tipo = TipoNave;
  }

  void DibujarNaves() { //Dibuja una nave animada en 8 frames
    if (!JuegoPausado && frameCount % 8 == 0) {
      FrameActual = (FrameActual + 1) % Frames.length;
    }

    image(Frames[FrameActual], x, y, 64  *  2, 64  *  2);
  }
}

void crearEnemigos() { // Función para crear la lista que contien a los enemigos
  float EspacioEntreNaves = 110;
  float Margen = 200;
  int  i = 0;

  for (int Bloque = 0; Bloque < 2; Bloque++) { // Vamos a dibujar dos bloques de enemigos
    float Inicio_x;
    if (Bloque == 0) {
      Inicio_x = Margen;
    } else {
      Inicio_x = width - Margen - 4 * EspacioEntreNaves;
    }
    // Cada bloque es una matriz
    for (int Fila = 0; Fila < 2; Fila++) {
      for (int Columna = 0; Columna < 5; Columna++) {
        int ColorNave = int(random(1, 4)); // Para que las naves aparezcan de manera aleatoria en la pantalla
        switch(ColorNave) {
        case 1:
          ImagenNave = NaveRoja;
          break;
        case 2:
          ImagenNave = NaveVerde;
          break;
        case 3:
          ImagenNave = NaveGris;
          break;
        }

        float Enemigo_x  = Inicio_x + Columna * EspacioEntreNaves;
        float Enemigo_y = 200 + Fila * EspacioEntreNaves;

        enemigo[i] = new Naves(ImagenNave, Enemigo_x, Enemigo_y, ColorNave);
        Existe[i] = true;
        i++; // Para pasar a la siguiente nave
      }
    }
  }
}

void MoverEnemigos() {
  if (!JuegoPausado) {
    float min_x = 64;
    float Max_x = width - 64;

    for (int i = 0; i < MaxEnemigos; i++) {
      if (enemigo[i].x == min_x) {
        DireccionEnemigos = 1;
      } else if ( enemigo[i].x == Max_x) {
        DireccionEnemigos = -1;
      }
    }

    for (int i = 0; i < MaxEnemigos; i++) {
      enemigo[i].x += VelocidadEnemigos * DireccionEnemigos;
    }
  }
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
  for (int i = 0; i < 3; i++) {
    if (!JuegoPausado && frameCount % 8 == 0) {
      FrameActualC = (FrameActualC + 1) % FramesC.length;
    }
    image(FramesC[FrameActualC], Xinicial + distanciaC*i, Y, 32  *  2, 32  *  2);
  }
}

void DibujarJuego() {
  Jugador.DibujarNaves();
  MoverNave();

  for (int i = 0; i < MaxEnemigos; i++) {
    if (Existe[i]) {
      enemigo[i].DibujarNaves();
    }
  }

  MoverEnemigos();

  if (millis() - Cooldown >= 5000) {
    EspacioBloqueado = false;
  }
  if (!JuegoPausado && Espacio && !EspacioBloqueado) {
    Disparar();
  }
  DibujarDisparos();
  impacto();

  GestorPantallas.DibujarBotonPausaHUD();
  if (JuegoPausado) {
    GestorPantallas.dibujarVentanaPausa();
  }

  dibujarVidas();
  fill(#ffffff);
  textSize(40);
  text(Puntos, width/2 - 500, 70);
}
