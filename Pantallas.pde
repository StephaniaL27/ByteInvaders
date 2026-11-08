// ---------- Paneles ----------

Pantalla panelHowTo;
Pantalla panelSettings;
Pantalla panelCredits;
Pantalla panelPausa;
Pantalla panelVictoria;
Pantalla panelGameOver;

class Pantalla {
  float x, y, w, h;
  float Radio;
  color Fondo, Borde;

  Pantalla(float nx, float ny, float nw, float nh, float nRadio, color nFondo, color nBorde) {
    x = nx;
    y = ny;
    w = nw;
    h = nh;
    Radio = nRadio;
    Fondo = nFondo;
    Borde = nBorde;
  }

  void dibujarPantalla() {
    rectMode(CENTER);
    fill(Fondo);
    stroke(Borde);
    strokeWeight(2);
    rect(x, y, w, h, Radio);
    noStroke();
    fill(255);
    stroke(0);
    strokeWeight(1);
    textAlign(LEFT, BASELINE);
  }
}

void crearPantallas() {
  panelHowTo = new Pantalla(width/2, height/2 - 20, width * 0.82, height * 0.72, 20, color(10, 15, 30, 230), #00FFFF);
  panelSettings = new Pantalla(width/2, height/2 - 20, width * 0.75, height * 0.65, 20, color(10, 15, 30, 230), #00FFFF);
  panelCredits = new Pantalla(width/2, height/2 - 20, width * 0.70, height * 0.58, 20, color(10, 15, 30, 230), #00FFFF);
  panelPausa = new Pantalla(width/2, height/2, 380, 260, 20, color(10, 15, 30, 240), #FFE600);
  panelVictoria = new Pantalla(width/2, height/2, 0.8 * width, 0.7 * height, 20, color(10, 15, 30, 230), #00FFFF);
  panelGameOver = new Pantalla(width/2, height/2, 0.8 * width, 0.8 * height, 20, color(10, 15, 30, 230), #00FFFF);
}

// ---------- How to Play ----------

void DibujarHowToPlay() {
  panelHowTo.dibujarPantalla();
  tituloHowToPlay.dibujarTexto();
  controles.dibujarTexto();
  instrucciones.dibujarTexto();
  subtituloHowTo.dibujarTexto();
  descripcionHowToPlay.dibujarTexto();
  mensajeHowToPlay.dibujarTexto();
  botonAtras.dibujarBoton();
}

// ---------- Settings ----------

void dibujarConfiguracion() {
  panelSettings.dibujarPantalla();
  tituloSettings.dibujarTexto();
  textoDificultad.dibujarTexto();
  for (i = 0; i < botonesDificultad.length; i++) {
    if (dificultad == i + 1) {
      botonesDificultad[i].seleccionado = true;
    } else {
      botonesDificultad[i].seleccionado = false;
    }
    botonesDificultad[i].dibujarBoton();
  }
  textoVelocidad.dibujarTexto();
  for (i = 0; i < botonesVelocidad.length; i++) {
    if (velocidadNave == (i + 1) * 3) {
      botonesVelocidad[i].seleccionado = true;
    } else {
      botonesVelocidad[i].seleccionado = false;
    }
    botonesVelocidad[i].dibujarBoton();
  }
  textoModo.dibujarTexto();
  botonHistoria.dibujarBoton();
  botonAtras.dibujarBoton();
}

// ---------- Credits ----------

void dibujarCreditos() {
  panelCredits.dibujarPantalla();
  tituloCredits.dibujarTexto();
  equipoCredits.dibujarTexto();
  integrantes.dibujarTexto();
  universidadCredits.dibujarTexto();
  botonAtras.dibujarBoton();
}

// ---------- Pausa ----------

void dibujarVentanaPausa() {
  noStroke();
  fill(0, 180);
  rect(width/2, height/2, width, height);
  panelPausa.dibujarPantalla();
  tituloPausa.dibujarTexto();
  botonContinuar.dibujarBoton();
  botonInicio.dibujarBoton();
}

// ---------- Victoria ----------

void dibujarVictoria() {
  panelVictoria.dibujarPantalla();
  tituloVictoria.dibujarTexto();
  subtituloVictoria.dibujarTexto();
  mensajeVictoria.dibujarTexto();
  botonAtras.dibujarBoton();
}

// ---------- Game Over ----------

void dibujarGameOver() {
  panelGameOver.dibujarPantalla();
  tituloGameOver.dibujarTexto();
  subtituloGameOver.dibujarTexto();
  preguntaGameOver.dibujarTexto();
  botonSi.dibujarBoton();
  botonNo.dibujarBoton();
}
