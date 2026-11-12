// ---------- Teclas ----------

boolean arriba;
boolean izquierda;
boolean abajo;
boolean derecha;
boolean espacio = false;

void mousePressed() {
  if (pantalla == 0) {
    boolean buscando = true;
    i = 0;
    while (i < botonesMenu.length && buscando) {
      if (botonesMenu[i].cursorEncima) {
        if (i == 0) {
          iniciarPartida();
          pantalla = 1.1;
        } else {
          pantalla = i + 1;
        }
        buscando = false;
      }
      i++;
    }
  } else if (pantalla == 1.2) {
    if (juegoGanado) {
      if (botonBack.cursorEncima) {
        pantalla = 0;
      }
    } else if (gameOver) {
      if (botonSi.cursorEncima) {
        iniciarPartida();
      } else if (botonNo.cursorEncima) {
        pantalla = 0;
      }
    } else if (juegoPausado) {
      if (botonContinue.cursorEncima || botonHome.cursorEncima) {
        juegoPausado = false;
      }
      if (botonHome.cursorEncima) {
        pantalla = 0;
      }
    } else if (botonPause.cursorEncima) {
      juegoPausado = true;
    }
  } else if (pantalla > 1.2) {
    if (pantalla == 3) {
      for (i = 0; i < botonesDificultad.length; i++) {
        if (botonesDificultad[i].cursorEncima) {
          for (j = 0; j < botonesDificultad.length; j++) {
            if (i == j) {
              botonesDificultad[j].seleccionado = true;
            } else {
              botonesDificultad[j].seleccionado = false;
            }
          }
        }
      }
      for (i = 0; i < botonesVelocidad.length; i++) {
        if (botonesVelocidad[i].cursorEncima) {
          for (j = 0; j < botonesVelocidad.length; j++) {
            if (i == j) {
              botonesVelocidad[j].seleccionado = true;
            } else {
              botonesVelocidad[j].seleccionado = false;
            }
          }
        }
      }
    }
    if (botonBack.cursorEncima) {
      pantalla = 0;
    }
  }
}

void keyPressed() {
  if (pantalla == 1.1 && key == ' ') {
    pantalla = 1.2;
  } else if (pantalla == 1.2 && !gameOver && !juegoGanado) {
    if (keyCode == ENTER) {
      juegoPausado = !juegoPausado;
    } else if (!juegoPausado) {
      if (key == 'w' || key == 'W' || keyCode == UP) {
        arriba = true;
      }
      if (key == 'a' || key == 'A' || keyCode == LEFT) {
        izquierda = true;
      }
      if ((key == 's' || key == 'S' || keyCode == DOWN) && AUG.y < height) {
        abajo = true;
      }
      if (key == 'd' || key == 'D' || keyCode == RIGHT) {
        derecha = true;
      }
      if (key == ' ') {
        espacio = true;
      }
    }
  }
}

void keyReleased() {
  if (key == 'w' || key == 'W' || keyCode == UP) {
    arriba = false;
  }
  if (key == 'a' || key == 'A' || keyCode == LEFT) {
    izquierda = false;
  }
  if (key == 's' || key == 'S' || keyCode == DOWN) {
    abajo = false;
  }
  if (key == 'd' || key == 'D' || keyCode == RIGHT) {
    derecha = false;
  }
  if (key == ' ') {
    espacio = false;
  }
}
