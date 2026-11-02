PFont fuenteBoton;
float Radio_esquinas = 51;

class Boton {
  float nivelBrillo = 0;
  float velocidadBrillo = 250;

  void dibujarBoton(float x, float y, float ancho, float alto, String contenido) {
    rectMode(CENTER);
    textAlign(CENTER, CENTER);
    textFont(fuenteBoton, 42);

    boolean sobreBoton = (
      mouseX >= x - ancho / 2 && mouseX <= x + ancho / 2 &&
      mouseY >= y - alto / 2 && mouseY <= y + alto / 2
    );

    if (sobreBoton) {
      nivelBrillo += velocidadBrillo;
    } else {
      nivelBrillo -= velocidadBrillo;
    }
    if (nivelBrillo > 255) {
      nivelBrillo = 255;
    }
    if (nivelBrillo < 0) {
      nivelBrillo = 0;
    }

    stroke(#ffed00);
    strokeWeight(3);
    fill(255, 237, 0, nivelBrillo);
    rect(x, y, ancho, alto, Radio_esquinas);
    
    if (sobreBoton) {
      fill(0);
    } else {
      fill(#ffed00);
    }
    text(contenido, x, y);
  }
}

void mousePressed() {
  // ---------- MENU PRINCIPAL ----------
  if (pantalla == 1) {
    for (int i=0; i<Botones_menu.length; i++) {
      boolean overButton = (
        mouseX >= boton_x[i] - ancho / 2 && mouseX <= boton_x[i] + ancho / 2 &&
        mouseY >= boton_y[i] - alto / 2 && mouseY <= boton_y[i] + alto / 2
      );

      if (overButton) {
        switch(i) {
        case 0:
          pantalla = 1.5;
          break;
        case 1:
          pantalla = 3;
          break;
        case 2:
          pantalla = 4;
          break;
        case 3:
          pantalla = 5;
          break;
        }
      }
    }
  } else if (pantalla == 2) {
    float bx = width - 70;
    float by = 45;

    // Clic en el botón || PAUSE
    if (mouseX >= bx - 45 && mouseX <= bx + 45 &&
        mouseY >= by - 20 && mouseY <= by + 20) {
      JuegoPausado = !JuegoPausado;
      return;
    }

    if (JuegoPausado) {
      float btnY1 = height/2 + 5;
      float btnY2 = height/2 + 65;

      if (mouseX >= width/2 - 100 && mouseX <= width/2 + 100 &&
          mouseY >= btnY1 - 22 && mouseY <= btnY1 + 22) {
        JuegoPausado = false; // CONTINUE
      }

      if (mouseX >= width/2 - 100 && mouseX <= width/2 + 100 &&
          mouseY >= btnY2 - 22 && mouseY <= btnY2 + 22) {
        JuegoPausado = false;
        pantalla = 1; // HOME
      }
    }
  } else if (pantalla == 4) {
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
        Velocidad_nave = 1;
        v = 10;
      }
      if (mouseX >= startX + 295 - 55 && mouseX <= startX + 295 + 55) {
        Velocidad_nave = 2;
        v = 20;
      }
      if (mouseX >= startX + 420 - 55 && mouseX <= startX + 420 + 55) {
        Velocidad_nave = 3;
        v = 30;
      }
    }

    // Botón BACK
    if (mouseX >= width/2 - 80 && mouseX <= width/2 + 80 &&
        mouseY >= height - 125 && mouseY <= height - 75) {
      pantalla = 1;
    }
  } else if (pantalla == 3 || pantalla == 5) {
    // Botón BACK
    if (mouseX >= width/2 - 80 && mouseX <= width/2 + 80 && mouseY >= height - 125 && mouseY <= height - 75) {
      pantalla = 1;
    }
  }
}
