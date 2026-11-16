void dibujarInstrucciones() {
  recuadroInstrucciones.dibujarRecuadro();
  for (i = 0; i < textoInstrucciones.length; i++) {
    textoInstrucciones[i].dibujarTexto();
  }
  botonVolver.dibujarBoton();
}

void dibujarAjustes() {
  for (i = 0; i < recuadroAjustes.length; i++) {
    recuadroAjustes[i].dibujarRecuadro();
  }
  textoAjustes[5].contenido = str(int(volumen[0] * 100)) + "%";
  textoAjustes[7].contenido = str(int(volumen[1] * 100)) + "%";
  for (i = 0; i < textoAjustes.length; i++) {
    textoAjustes[i].dibujarTexto();
  }
  for (i = 0; i < botonDificultad.length; i++) {
    botonDificultad[i].dibujarBoton();
  }
  for (i = 0; i < controlVolumen.length; i++) {
    controlVolumen[i].dibujarBoton();
  }
  botonHistoria.dibujarBoton();
  botonVolver.dibujarBoton();
}

void dibujarCreditos() {
  recuadroCreditos.dibujarRecuadro();
  for (i = 0; i < textoCreditos.length; i++) {
    textoCreditos[i].dibujarTexto();
  }
  botonVolver.dibujarBoton();
}

void dibujarPausa() {
  for (i = 0; i < recuadroPausa.length; i++) {
    recuadroPausa[i].dibujarRecuadro();
  }
  textoPausa.dibujarTexto();
  botonContinuar.dibujarBoton();
  botonInicio.dibujarBoton();
}

void dibujarVictoria() {
  recuadroVictoria.dibujarRecuadro();
  for (i = 0; i < textoVictoria.length; i++) {
    textoVictoria[i].dibujarTexto();
  }
  botonVolver.dibujarBoton();
}

void dibujarDerrota() {
  recuadroDerrota.dibujarRecuadro();
  for (i = 0; i < textoDerrota.length; i++) {
    textoDerrota[i].dibujarTexto();
  }
  botonSi.dibujarBoton();
  botonNo.dibujarBoton();
}

void dibujarHUD() {
  recuadroHUD.dibujarRecuadro();
  dibujarVidas();
  textoJuego.contenido = str(Puntos);
  textoJuego.dibujarTexto();
  if (!juegoPausado) {
    botonPausa.dibujarBoton();
  }
}
