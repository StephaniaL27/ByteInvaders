// ---------- Audio ----------

SoundFile ostMenu;
SoundFile ostOpeningCrawl;
SoundFile ostJuego;
SoundFile sfxAUG;
SoundFile sfxAliado;
SoundFile sfxGris;
SoundFile sfxEnemigo;
SoundFile sfxHurt;
SoundFile sfxExplosion;
SoundFile sfxVictoria3;
boolean musicaJuegoPausada;
float[] volumen = {1, 1};

void cargarSonidos() {
  ostMenu = new SoundFile(this, "Ice Path.wav");
  ostOpeningCrawl = new SoundFile(this, "Star Wars - Main Theme.wav");
  ostJuego = new SoundFile(this, "byte_invaders_theme.wav");
  sfxAUG = new SoundFile(this, "laserShoot0.wav");
  sfxAliado = new SoundFile(this, "laserShoot1.wav");
  sfxGris = new SoundFile(this, "laserShoot2.wav");
  sfxEnemigo = new SoundFile(this, "laserShoot3.wav");
  sfxHurt = new SoundFile(this, "hitHurt.wav");
  sfxExplosion = new SoundFile(this, "explosion.wav");
  sfxVictoria3 = new SoundFile(this, "Victory! (Wild Pokémon).wav");
}

void ecualizador() {
  ostMenu.amp(volumen[0]);
  ostOpeningCrawl.amp(volumen[0]);
  ostJuego.amp(volumen[0]);
  sfxAUG.amp(volumen[1]);
  sfxAliado.amp(volumen[1]);
  sfxGris.amp(volumen[1]);
  sfxEnemigo.amp(volumen[1]);
  sfxHurt.amp(volumen[1]);
  sfxExplosion.amp(volumen[1]);
  sfxVictoria3.amp(volumen[1]);
}

void controlarOSTs() {
  if (pantalla == 0 || pantalla > 1.2) {
    sfxVictoria3.stop();
    ostJuego.stop();
    ostOpeningCrawl.stop();
    musicaJuegoPausada = false;
    if (!ostMenu.isPlaying()) {
      ostMenu.loop();
      ostMenu.amp(volumen[0]);
    }
  } else if (pantalla == 1.1) {
    ostMenu.stop();
    if (!ostOpeningCrawl.isPlaying()) {
      ostOpeningCrawl.play();
      ostOpeningCrawl.amp(volumen[0]);
    }
  } else {
    ostMenu.stop();
    ostOpeningCrawl.stop();
    if (juegoGanado || gameOver) {
      ostJuego.stop();
      musicaJuegoPausada = false;
    } else if (juegoPausado) {
      if (ostJuego.isPlaying()) {
        ostJuego.pause();
        musicaJuegoPausada = true;
      }
    } else {
      if (!ostJuego.isPlaying()) {
        if (musicaJuegoPausada) {
          ostJuego.play();
          ostJuego.amp(volumen[0]);
          musicaJuegoPausada = false;
        } else {
          ostJuego.loop();
          ostJuego.amp(volumen[0]);
        }
      }
    }
  }
}

void sonarSFX(SoundFile sonido) {
  sonido.stop();
  sonido.play();
  sonido.amp(volumen[1]);
}
