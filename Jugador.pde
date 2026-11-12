// ---------- Jugador ----------

Nave AUG;

// ---------- Disparos del jugador ----------

int cargadorAUG = 15;
int indiceDisparoAUG = 0;
int balasPendientesAUG = 0;
float velocidadDisparos = 20;
float[] balasAUGX = new float[cargadorAUG];
float[] balasAUGY = new float[cargadorAUG];
boolean[] balaAUGExiste = new boolean[cargadorAUG];

void AUG() {
  if (espacio && balasPendientesAUG == 0) {
    balasPendientesAUG = 3;
  }
  if (balasPendientesAUG > 0 && !balaAUGExiste[indiceDisparoAUG]) {
    sfxLaserShoot.play();
    balaAUGExiste[indiceDisparoAUG] = true;
    balasAUGX[indiceDisparoAUG] = AUG.x;
    balasAUGY[indiceDisparoAUG] = AUG.y;
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
  if (arriba) {
    AUG.y -= AUG.v;
  }
  if (izquierda) {
    AUG.x -= AUG.v;
  }
  if (abajo) {
    AUG.y += AUG.v;
  }
  if (derecha) {
    AUG.x += AUG.v;
  }
  if (AUG.x < 64) {
    AUG.x += AUG.v;
  } else if (AUG.x > width - 64) {
    AUG.x -= AUG.v;
  }
  if (AUG.y < 64) {
    AUG.y += AUG.v;
  } else if (AUG.y > height - 64) {
    AUG.y -= AUG.v;
  }
}
