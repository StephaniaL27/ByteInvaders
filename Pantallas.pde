class Pantallas {

  // ---------- Pantalla: How to Play ----------

  void DibujarHowToPlay() {
    dibujarPanel(0.82, 0.72);
    dibujarTitulo("HOW TO PLAY", height/2 - 250);

    fill(#00FFFF);
    textSize(50);
    text("CONTROLES", width/2, height/2 - 170);

    textAlign(LEFT, CENTER);
    fill(255);
    textSize(25);
    text("- Moverte: teclas W, A, S, D o flechas de dirección", width/2 - 300, height/2 - 120);
    text("- Disparar / Acción: barra espaciadora", width/2 - 300, height/2 - 90);
    text("- Pausar: tecla ENTER o botón || PAUSE", width/2 - 300, height/2 - 60);

    textAlign(CENTER, CENTER);
    fill(#00FFFF);
    textSize(40);
    text("FILTRADO DE MENSAJES\nY BIENESTAR DIGITAL", width/2, height/2 + 20);

    fill(255);
    textSize(25);
    text("Pilota tu nave y filtra el contenido cibernético que llega a la pantalla:", width/2, height/2 + 90);

    textAlign(LEFT, CENTER);
    fill(#00FF66);
    text("NAVES VERDES -> Intercéptalas para sumar puntos.", width/2 - 300, height/2 + 130);
    fill(#FF4444);
    text("NAVES ROJAS -> Bloquear o reportar disparando.", width/2 - 300, height/2 + 160);
    fill(#AAAAAA);
    text("NAVES GRISES -> Esquívalas para evitar distracciones.", width/2 - 300, height/2 + 190);

    textAlign(CENTER, CENTER);
    fill(#FFE600);
    textSize(40);
    text("¡Mantén el equilibrio cibernético y supera el puntaje máximo!", width/2, height/2 + 250);

    dibujarBotonAtras();
  }

  // ---------- Pantalla: Settings ----------

  void dibujarConfiguracion() {
    dibujarPanel(0.75, 0.65);
    dibujarTitulo("SETTINGS", height/2 - 180);

    float inicioX = width/2 - 260;

    // Dificultad

    dibujarEtiqueta("Dificultad:", inicioX, height/2 - 80);
    dibujarBotonOpcion(inicioX + 180, height/2 - 80, 100, 38, "FÁCIL", dificultad == 1);
    dibujarBotonOpcion(inicioX + 295, height/2 - 80, 110, 38, "NORMAL", dificultad == 2);
    dibujarBotonOpcion(inicioX + 420, height/2 - 80, 110, 38, "DIFÍCIL", dificultad == 3);

    // Velocidad

    dibujarEtiqueta("Velocidad:", inicioX, height/2);
    dibujarBotonOpcion(inicioX + 180, height/2, 100, 38, "LENTA", velocidadNave == 3);
    dibujarBotonOpcion(inicioX + 295, height/2, 110, 38, "NORMAL", velocidadNave == 6);
    dibujarBotonOpcion(inicioX + 420, height/2, 110, 38, "RÁPIDA", velocidadNave == 9);

    // Modo de juego (fijo)

    dibujarEtiqueta("Modo de juego:", inicioX, height/2 + 80);
    stroke(#FF7700);
    strokeWeight(2);
    fill(#FF7700, 80);
    rect(inicioX + 220, height/2 + 80, 160, 38, 10);
    fill(#FF7700);
    textAlign(CENTER, CENTER);
    textSize(16);
    text("HISTORIA", inicioX + 220, height/2 + 80);

    dibujarBotonAtras();
  }

  // ---------- Pantalla: Credits ----------

  void dibujarCreditos() {
    dibujarPanel(0.70, 0.58);
    dibujarTitulo("CREDITS", height/2 - 150);

    fill(#00FFFF);
    textSize(50);
    text("BYTE INVADERS - Equipo 6", width/2, height/2 - 70);

    fill(255);
    textSize(40);
    text("Stephania Lamadrid", width/2, height/2 - 15);
    text("Matías Guarín", width/2, height/2 + 30);
    text("Natalia Herrera", width/2, height/2 + 75);

    fill(#888888);
    textSize(20);
    text("Algoritmia y Programación II -- Uninorte 2026", width/2, height/2 + 130);

    dibujarBotonAtras();
  }

  // ---------- Componentes auxiliares ----------

  void dibujarPanel(float proporcionAncho, float proporcionAlto) {
    fill(10, 15, 30, 230);
    stroke(#00FFFF);
    strokeWeight(2);
    rect(width/2, height/2 - 20, width * proporcionAncho, height * proporcionAlto, 20);
    noStroke();
  }

  void dibujarTitulo(String titulo, float y) {
    textAlign(CENTER, CENTER);
    fill(#FFE600);
    textSize(100);
    text(titulo, width/2, y);
  }

  void dibujarEtiqueta(String texto, float x, float y) {
    fill(255);
    textSize(20);
    textAlign(LEFT, CENTER);
    text(texto, x, y);
  }

  void dibujarBotonPausaHUD() {
    float bx = width - 70;
    float by = 45;
    float bw = 90;
    float bh = 40;

    boolean mouseSobre =
      mouseX >= bx - bw/2 && mouseX <= bx + bw/2 &&
      mouseY >= by - bh/2 && mouseY <= by + bh/2;

    stroke(#00FFFF);
    strokeWeight(2);
    if (mouseSobre) {
      fill(#00FFFF, 80);
    } else {
      fill(10, 15, 30, 200);
    }
    rect(bx, by, bw, bh, 10);

    fill(#00FFFF);
    textAlign(CENTER, CENTER);
    textSize(18);
    text("|| PAUSE", bx, by - 2);
  }

  void dibujarVentanaPausa() {
    fill(0, 180);
    rect(width/2, height/2, width, height);

    stroke(#FFE600);
    strokeWeight(3);
    fill(10, 15, 30, 240);
    rect(width/2, height/2, 380, 260, 20);

    fill(#FFE600);
    textAlign(CENTER, CENTER);
    textSize(32);
    text("GAME PAUSED", width/2, height/2 - 75);

    float btnY1 = height/2 + 5;
    boolean overContinue =
      mouseX >= width/2 - 100 && mouseX <= width/2 + 100 &&
      mouseY >= btnY1 - 22 && mouseY <= btnY1 + 22;

    stroke(#00FF66);
    strokeWeight(2);
    if (overContinue) {
      fill(0, 255, 102, 100);
    } else {
      fill(10, 30, 20, 200);
    }
    rect(width/2, btnY1, 200, 44, 10);
    fill(#00FF66);
    textSize(20);
    text("CONTINUE", width/2, btnY1 - 2);

    float btnY2 = height/2 + 65;
    boolean overHome =
      mouseX >= width/2 - 100 && mouseX <= width/2 + 100 &&
      mouseY >= btnY2 - 22 && mouseY <= btnY2 + 22;

    stroke(#FF4444);
    strokeWeight(2);
    if (overHome) {
      fill(255, 68, 68, 100);
    } else {
      fill(30, 10, 10, 200);
    }
    rect(width/2, btnY2, 200, 44, 10);
    fill(#FF4444);
    textSize(20);
    text("HOME", width/2, btnY2 - 2);
  }

  void dibujarBotonOpcion(float bx, float by, float bw, float bh, String label, boolean seleccionado) {
    boolean mouseSobre =
      mouseX >= bx - bw/2 && mouseX <= bx + bw/2 &&
      mouseY >= by - bh/2 && mouseY <= by + bh/2;

    if (seleccionado) {
      stroke(#00FFFF);
      strokeWeight(2);
      fill(#00FFFF, 100);
    } else if (mouseSobre) {
      stroke(255);
      strokeWeight(1);
      fill(255, 40);
    } else {
      stroke(100);
      strokeWeight(1);
      fill(20, 25, 45);
    }
    rect(bx, by, bw, bh, 8);

    textAlign(CENTER, CENTER);
    textSize(16);
    if (seleccionado) {
      fill(#00FFFF);
    } else {
      fill(200);
    }
    text(label, bx, by);
  }

  void dibujarBotonAtras() {
    fill(#0F0F0B);
    rect(width/2, height - 100, 160, 50, 12);

    fill(255);
    textAlign(CENTER, CENTER);
    textSize(24);
    text("BACK", width/2, height - 102);
  }

  void dibujarVictoria() {
    stroke(#00FFFF);
    strokeWeight(3);
    fill(10,15,30,230);
    rect(width/2,height/2,700,230,20);

    textAlign(CENTER,CENTER);
    fill(#FFE600);
    textSize(55);
    text("¡EQUILIBRIO RESTAURADO!", width / 2, height / 2 - 45);

    fill(#00FF66);
    textSize(30);
    text("THE NETWORK ESTÁ A SALVO", width / 2, height / 2 + 15);

    dibujarBotonAtras();
  }
}
