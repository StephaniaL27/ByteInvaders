void howToPlay() {
  panelHTP.dibujarPanel();
  for (i = 0; i < textoHTP.length; i++) {
    textoHTP[i].dibujarTexto();
  }
  botonBack.dibujarBoton();
}

void Settings() {
  panelSettings.dibujarPanel();
  for (i = 0; i < textoSettings.length; i++) {
    textoSettings[i].dibujarTexto();
  }
  for (i = 0; i < botonesDificultad.length; i++) {
    botonesDificultad[i].dibujarBoton();
  }
  for (i = 0; i < botonesVelocidad.length; i++) {
    botonesVelocidad[i].dibujarBoton();
  }
  botonHistoria.dibujarBoton();
  botonBack.dibujarBoton();
}

void Credits() {
  panelCredits.dibujarPanel();
  for (i = 0; i < textoCredits.length; i++) {
    textoCredits[i].dibujarTexto();
  }
  botonBack.dibujarBoton();
}

void gamePaused() {
  fill(0, 180);
  rect(width / 2, height / 2, width, height);
  panelGamePaused.dibujarPanel();
  textoGamePaused.dibujarTexto();
  botonContinue.dibujarBoton();
  botonHome.dibujarBoton();
}

void EquilibrioRestaurado() {
  panelEquilibrioRestaurado.dibujarPanel();
  for (i = 0; i < textoEquilibrioRestaurado.length; i++) {
    textoEquilibrioRestaurado[i].dibujarTexto();
  }
  botonBack.dibujarBoton();
}

void gameOver() {
  panelGameOver.dibujarPanel();
  for (i = 0; i < textoGameOver.length; i++) {
    textoGameOver[i].dibujarTexto();
  }
  botonSi.dibujarBoton();
  botonNo.dibujarBoton();
}
