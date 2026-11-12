// ---------- Recursos gráficos ----------

PImage tituloMenu;
PImage fondo;
PImage[] estrellas = new PImage[8];
PImage corazones;
PImage Nave_jugador;
PImage naveRoja;
PImage naveVerde;
PImage naveGris;

// ---------- Fondo animado ----------

int Frame_estrellas = 0;
int FPS = 6;
float velocidadFondo = 5;
float fondoY = -velocidadFondo;

// ---------- Audio ----------

SoundFile sfxLaserShoot;
SoundFile sfxExplosion;
SoundFile sfxVictory;
SoundFile musicaJuego;
SoundFile musicaMenu;
boolean musicaJuegoPausada;

// Carga y presentación de recursos audiovisuales

void cargarImagenes() {
  tituloMenu = loadImage("titulo_byteinvaders.png");
  corazones = loadImage("corazones.png");
  Nave_jugador = loadImage("nave.png");
  naveRoja = loadImage("nave_roja.png");
  naveVerde = loadImage("nave_verde.png");
  naveGris = loadImage("nave_npc.png");
  fondo = loadImage("fondo_loop_1920x1080.png");
  for (i = 0; i < estrellas.length; i++) {
    estrellas[i] = loadImage("estrellas_" + i + ".png");
  }
}

void cargarFramesNaves() {
  PImage[] imagenes = {Nave_jugador, naveVerde, naveGris, naveRoja};
  for (j = 0; j < imagenes.length; j++) {
    for (i = 0; i < framesNaves[j].length; i++) {
      framesNaves[j][i] = imagenes[j].get(i * 64, 0, 64, 64);
    }
  }
}

void cargarSonidos() {
  sfxLaserShoot = new SoundFile(this, "laserShoot.wav");
  sfxExplosion = new SoundFile(this, "explosion.wav");
  sfxVictory = new SoundFile(this, "byte_invaders_victory.wav");
  musicaJuego = new SoundFile(this, "byte_invaders_theme.wav");
  musicaMenu = new SoundFile(this, "byte_invaders_menu_chill.wav");
}

void cargarFramesVidas() {
  for (i = 0; i < FramesC.length; i++) {
    FramesC[i] = corazones.get(i * 32, 0, 32, 32);
  }
}

void actualizarFondo() {
  if (pantalla != 1.2) {
    fondoY = height / 2;
  } else if (!juegoPausado && !juegoGanado && !gameOver) {
    fondoY += velocidadFondo;
    if (fondoY >= height) {
      fondoY -= height;
    }
  }
}

void dibujarFondo(float desplazamiento) {
  imageMode(CORNER);
  if (!juegoPausado && frameCount % FPS == 0) {
    Frame_estrellas = (Frame_estrellas + 1) % estrellas.length;
  }
  image(fondo, 0, int(desplazamiento), width, height);
  image(fondo, 0, int(desplazamiento) - height, width, height);
  image(estrellas[Frame_estrellas], 0, int(desplazamiento), width, height);
  image(estrellas[Frame_estrellas], 0, int(desplazamiento) - height, width, height);
  imageMode(CENTER);
}

void controlarMusica() {
  if (pantalla == 0 || pantalla > 1.2) {
    sfxVictory.stop();
    musicaJuego.stop();
    musicaJuegoPausada = false;
    if (!musicaMenu.isPlaying()) {
      musicaMenu.loop();
      musicaMenu.amp(0.5);
    }
  } else {
    musicaMenu.stop();
    if (juegoGanado || gameOver) {
      musicaJuego.stop();
      musicaJuegoPausada = false;
    } else if (juegoPausado) {
      if (musicaJuego.isPlaying()) {
        musicaJuego.pause();
        musicaJuegoPausada = true;
      }
    } else if (!musicaJuego.isPlaying()) {
      if (musicaJuegoPausada) {
        musicaJuego.play();
        musicaJuegoPausada = false;
      } else {
        musicaJuego.loop();
      }
    }
  }
}
