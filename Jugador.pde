// ---------- Jugador ----------

boolean escudoActivo;
float inicioInvulnerable;
float inicioLento;
Nave AUG;

// ---------- Disparos del jugador ----------

int cargadorAUG = 15;
int indiceDisparoAUG = 0;
int balasPendientesAUG = 0;
float velocidadBalaAUG = 20;
boolean[] balaAUGActiva = new boolean[cargadorAUG];
float[] balaAUGX = new float[cargadorAUG];
float[] balaAUGY = new float[cargadorAUG];

void dispararJugador() {
  if (espacio && balasPendientesAUG == 0) {
    balasPendientesAUG = 3;
  }
  if (balasPendientesAUG > 0 && !balaAUGActiva[indiceDisparoAUG]) {
    sonarSFX(sfxAUG);
    balaAUGActiva[indiceDisparoAUG] = true;
    balaAUGX[indiceDisparoAUG] = AUG.x;
    balaAUGY[indiceDisparoAUG] = AUG.y;
    balasPendientesAUG--;
    indiceDisparoAUG++;
    if (indiceDisparoAUG == cargadorAUG) {
      AUG.cooldown = 2000;
      indiceDisparoAUG = 0;
    } else if (indiceDisparoAUG % 3 == 0) {
      AUG.cooldown = 800;
    } else {
      AUG.cooldown = 100;
    }
    AUG.inicioCooldown = millis();
  }
}

void moverJugador() {
  float velocidad = AUG.v;
  // Tras chocar con una roja, la nave va a la mitad de velocidad durante 3 s.
  if (millis() - inicioLento < 3000) {
    velocidad /= 2;
  }
  if (arriba) {
    AUG.y -= velocidad;
  }
  if (izquierda) {
    AUG.x -= velocidad;
  }
  if (abajo) {
    AUG.y += velocidad;
  }
  if (derecha) {
    AUG.x += velocidad;
  }
  if (AUG.x < 64) {
    AUG.x += velocidad;
  } else if (AUG.x > width - 64) {
    AUG.x -= velocidad;
  }
  if (AUG.y < 64) {
    AUG.y += velocidad;
  } else if (AUG.y > height - 64) {
    AUG.y -= velocidad;
  }
}
