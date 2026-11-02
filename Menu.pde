Boton botonesMenu[] = new Boton[4];

float radioEsquinas = 50;

class Boton {
  float x, y, w, h;
  String contenido;
  float nivelBrillo = 0;
  float velocidadBrillo = 250;
  boolean sobreBoton = false;
  
  Boton(float nx, float ny, float nw, float nh, String ncontenido) {
    x = nx;
    y = ny;
    w = nw;
    h = nh;
    contenido = ncontenido;
  }

  void dibujarBoton() {
    rectMode(CENTER);
    textAlign(CENTER, CENTER);
    textFont(fuenteBoton, 42);

    sobreBoton = (
      mouseX >= x - w / 2 && mouseX <= x + w / 2 &&
      mouseY >= y - h / 2 && mouseY <= y + h / 2
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
    rect(x, y, w, h, radioEsquinas);
    
    if (sobreBoton) {
      fill(0);
    } else {
      fill(#ffed00);
    }
    text(contenido, x, y);
  }
}

void apariencia_menu() {
  image(tituloMenu, width/2, height*0.25, 1100, 300);

  for (int i = 0; i < botonesMenu.length; i++) {
    botonesMenu[i].dibujarBoton();
  }
}

/* Dibuja el fondo y las estrellas dos veces (una encima de otra)
   para que el desplazamiento vertical no deje huecos */

void dibujarFondo(float desplazamiento) {
  imageMode(CORNER);

  if (frameCount % Velocidad_titileo == 0) {
    Frame_estrellas = (Frame_estrellas + 1) % estrellas.length;
  }

  image(fondo, 0, int(desplazamiento), width, height);
  image(fondo, 0, int(desplazamiento) - height, width, height);
  image(estrellas[Frame_estrellas], 0, int(desplazamiento), width, height);
  image(estrellas[Frame_estrellas], 0, int(desplazamiento) - height, width, height);

  imageMode(CENTER);   // vuelve al modo que usa todo lo demás
}
