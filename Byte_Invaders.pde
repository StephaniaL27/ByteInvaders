import processing.sound.*;

// ---------- Imágenes del menú ----------

PImage tituloMenu;

// ---------- Fondo animado ----------

PImage fondo;                        // Imagen de fondo (se repite en bucle vertical)
PImage[] estrellas = new PImage[8];  // Frames de las estrellas que titilan
float velocidadFondo = 5;           // Velocidad vertical del fondo (px por frame)
float fondoY = -velocidadFondo;    // Posición vertical actual del fondo
int Frame_estrellas = 0;             // Frame actual del titileo de las estrellas
int Velocidad_titileo = 7;           // Cada cuántos frames cambia el titileo

// ---------- Interfaz ----------

PFont fuenteBoton;
Pantallas GestorPantallas;  // Gestor que dibuja las pantallas secundarias
float pantalla = 1;           // 1: Menú, 1.5: Historia, 2: Juego, 3: How to play, 4: Settings, 5: Credits

// ---------- Ajustes y pausa ----------

int dificultad = 2;            // 1: Fácil, 2: Normal, 3: Difícil
int velocidadNave = 6;        // 1: Lenta, 2: Normal, 3: Rápida
String Modo_juego = "HISTORIA";
boolean juegoPausado = false;  // true si el juego está en pausa
boolean juegoGanado = false;
boolean victoriaSonada = false;

// ---------- Naves ----------

PImage Nave_jugador;
PImage naveRoja;
PImage naveVerde;
PImage naveGris;
int maxEnemigos = 27;
Naves jugador;

// ---------- Vidas ----------

PImage corazones;
int Puntos = 0;

// ---------- Sonidos ----------

SoundFile sfxLaserShoot;
SoundFile sfxExplosion;
SoundFile sfxVictory;
SoundFile musicaFondo;

void setup() {
  fullScreen();
  imageMode(CENTER);
  rectMode(CENTER);
  noSmooth();  // Evita que el pixel art se vea borroso
  frameRate(60);

  fuenteBoton = createFont("font_botones_r.ttf", 42);
  fuenteHistoria = createFont("font_historia.ttf", 40);
  cargarImagenes();
  cargarSonidos();

  capaTexto = createGraphics(width, height);
  capaTexto.smooth(3);

  textFont(fuenteBoton);

  GestorPantallas = new Pantallas();
  jugador = new Naves(Nave_jugador, width / 2, height + 64, 0);  // La nave del jugador inicia bajo la pantalla y sube hasta su posición
  crearEnemigos();

  // Botones del menú, uno debajo del otro

  float distancia = 80;
  String temporal;
  for (int i = 0; i < botonesMenu.length; i++) {
    switch(i) {
      case 0:
        temporal = "START GAME";
      break;
      case 1:
        temporal = "HOW TO PLAY";
      break;
      case 2:
        temporal = "SETTINGS";
      break;
      default:
        temporal = "CREDITS";
    }
    botonesMenu[i] = new Boton(width / 2, 480 + i * distancia, 400, 50, temporal);
  }
}

void cargarImagenes() {
  tituloMenu = loadImage("titulo_byteinvaders.png");
  corazones = loadImage("corazones.png");
  Nave_jugador = loadImage("nave.png");
  naveRoja = loadImage("nave_roja.png");
  naveVerde = loadImage("nave_verde.png");
  naveGris = loadImage("nave_npc.png");
  fondo = loadImage("fondo_loop_1920x1080.png");

  for (int i = 0; i < estrellas.length; i++) {
    estrellas[i] = loadImage("estrellas_" + i + ".png");
  }
}

void cargarSonidos() {
  sfxLaserShoot = new SoundFile(this, "laserShoot.wav");
  sfxExplosion = new SoundFile(this, "explosion.wav");
  sfxVictory = new SoundFile(this, "byte_invaders_victory.wav");
  musicaFondo = new SoundFile(this, "byte_invaders_theme.wav");
}

void draw() {

  // Fondo: se desplaza en el juego y queda quieto en las demás pantallas

  if (pantalla == 2 && !juegoPausado && !juegoGanado) {
    fondoY += velocidadFondo;
    if (fondoY >= height) {
      fondoY -= height;  // vuelve al inicio del bucle
    }
  } else if (pantalla != 2) {
    fondoY = height / 2;
  }
  dibujarFondo(fondoY);

  // Contenido de cada pantalla

  if (pantalla == 1) {
    aparienciaMenu();
  } else if (pantalla == 1.5) {
    dibujarHistoria();
  } else if (pantalla == 2) {
    dibujarJuego();
  } else if (pantalla == 3) {
    GestorPantallas.DibujarHowToPlay();
  } else if (pantalla == 4) {
    GestorPantallas.dibujarConfiguracion();
  } else {
    GestorPantallas.dibujarCreditos();
  }

  switch (dificultad){
  }
}

void mousePressed() {

  // ---------- MENU PRINCIPAL ----------

  if (pantalla == 1) {
    for (int i = 0; i < botonesMenu.length; i++) {
      if (botonesMenu[i].sobreBoton) {

        // Reiniciar la partida al pulsar START GAME

        if (i == 0) {
          musicaFondo.loop();
          musicaFondo.amp(0.3);
          juegoGanado = false;
          victoriaSonada = false;

          jugador.x = width/2;
          jugador.y = height - 100;

          for (int j = 0; j < maxDisparos; j++) {
            balaActiva[j] = false;
          }

          direccionEnemigo[0] = 1;
          direccionEnemigo[1] = -1;
          direccionEnemigo[2] = 1;
          crearEnemigos();
        }
        if (i == 0) {
          pantalla = 1.5;
        } else {
          pantalla = i + 2;
        }
      }
    }
  } else if (pantalla == 2) {

    // ---------- VICTORIA ----------

    if (juegoGanado) {
      if (mouseX >= width/2 - 80 && mouseX <= width/2 + 80 &&
        mouseY >= height - 125 && mouseY <= height - 75) {
        pantalla = 1;
      }
    } else {

      float bx = width - 70;
      float by = 45;

      // Clic en el botón || PAUSE
      if (mouseX >= bx - 45 && mouseX <= bx + 45 &&
        mouseY >= by - 20 && mouseY <= by + 20) {
        juegoPausado = !juegoPausado;
      } else if (juegoPausado) {

        float btnY1 = height/2 + 5;
        float btnY2 = height/2 + 65;

        // CONTINUE
        if (mouseX >= width/2 - 100 && mouseX <= width/2 + 100 &&
          mouseY >= btnY1 - 22 && mouseY <= btnY1 + 22) {
          juegoPausado = false;
        }

        // HOME
        if (mouseX >= width/2 - 100 && mouseX <= width/2 + 100 &&
          mouseY >= btnY2 - 22 && mouseY <= btnY2 + 22) {
          juegoPausado = false;
          musicaFondo.stop();
          pantalla = 1;
        }
      }
    }
  } else {
    if (pantalla == 4) {
      float startX = width/2 - 260;

      // Clics Dificultad
      if (mouseY >= height/2 - 80 - 19 && mouseY <= height/2 - 80 + 19) {
        if (mouseX >= startX + 180 - 50 && mouseX <= startX + 180 + 50) dificultad = 1;
        if (mouseX >= startX + 295 - 55 && mouseX <= startX + 295 + 55) dificultad = 2;
        if (mouseX >= startX + 420 - 55 && mouseX <= startX + 420 + 55) dificultad = 3;
      }

      // Clics Velocidad
      if (mouseY >= height/2 - 19 && mouseY <= height/2 + 19) {
        if (mouseX >= startX + 180 - 50 && mouseX <= startX + 180 + 50) {
          velocidadNave = 3;
        }
        if (mouseX >= startX + 295 - 55 && mouseX <= startX + 295 + 55) {
          velocidadNave = 6;
        }
        if (mouseX >= startX + 420 - 55 && mouseX <= startX + 420 + 55) {
          velocidadNave = 9;
        }
      }
    }
    // Botón BACK
    if (mouseX >= width/2 - 80 && mouseX <= width/2 + 80 &&
      mouseY >= height - 125 && mouseY <= height - 75) {
      pantalla = 1;
    }
  }
}
