// ---------- Teclas ----------

boolean arriba;
boolean izquierda;
boolean abajo;
boolean derecha;
boolean espacio = false;
boolean[] arrastrandoVolumen = new boolean[2];

void mousePressed() {
  if (pantalla == 0) {
    boolean buscando = true;
    int i = 0;
    while (i < botonMenu.length && buscando) {
      if (botonMenu[i].cursorEncima) {
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
      if (botonVolver.cursorEncima) {
        pantalla = 0;
      }
    } else if (gameOver) {
      if (botonSi.cursorEncima) {
        iniciarPartida();
      } else if (botonNo.cursorEncima) {
        pantalla = 0;
      }
    } else if (juegoPausado) {
      if (botonContinuar.cursorEncima || botonInicio.cursorEncima) {
        juegoPausado = false;
      }
      if (botonInicio.cursorEncima) {
        pantalla = 0;
      }
    } else if (botonPausa.cursorEncima) {
      juegoPausado = true;
    }
  } else if (pantalla > 1.2) {
    if (pantalla == 3) {
      for (int i = 0; i < controlVolumen.length; i++) {
        arrastrandoVolumen[i] = controlVolumen[i].cursorEncima;
      }
      for (int i = 0; i < botonDificultad.length; i++) {
        if (botonDificultad[i].cursorEncima) {
          dificultad = i;
          for (int j = 0; j < botonDificultad.length; j++) {
            botonDificultad[j].seleccionado = i == j;
          }
        }
      }
    }
    if (botonVolver.cursorEncima) {
      pantalla = 0;
    }
  }
}

void mouseDragged() {
  if (pantalla == 3) {
    if (arrastrandoVolumen[0]) {
      controlVolumen[0].x = constrain(mouseX, recuadroAjustes[1].x - recuadroAjustes[1].w / 2, recuadroAjustes[1].x + recuadroAjustes[1].w / 2);
      volumen[0] = map(controlVolumen[0].x, recuadroAjustes[1].x - recuadroAjustes[1].w / 2, recuadroAjustes[1].x + recuadroAjustes[1].w / 2, 0, 1);
    }
    if (arrastrandoVolumen[1]) {
      controlVolumen[1].x = constrain(mouseX, recuadroAjustes[2].x - recuadroAjustes[2].w / 2, recuadroAjustes[2].x + recuadroAjustes[2].w / 2);
      volumen[1] = map(controlVolumen[1].x, recuadroAjustes[2].x - recuadroAjustes[2].w / 2, recuadroAjustes[2].x + recuadroAjustes[2].w / 2, 0, 1);
    }
  }
}

void mouseReleased() {
  arrastrandoVolumen[0] = false;
  arrastrandoVolumen[1] = false;
}

void keyPressed() {
  // Las teclas de movimiento se registran en cualquier pantalla para que la nave responda
  // aunque ya estuvieran presionadas al empezar la partida.
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
  if (pantalla == 1.1 && key == ' ') {
    pantalla = 1.2;
  } else if (pantalla == 1.2 && !gameOver && !juegoGanado) {
    if (keyCode == ENTER) {
      juegoPausado = !juegoPausado;
    } else if (!juegoPausado && key == ' ') {
      espacio = true;
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
