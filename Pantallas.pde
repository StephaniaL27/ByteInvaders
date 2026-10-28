class Pantallas {

  // ---------- Pantalla: How to Play ----------
  void dibujarHowToPlay() {
    rectMode(CENTER);
    fill(10, 15, 30, 230);
    stroke(#00FFFF);
    strokeWeight(2);
    rect(width/2, height/2 - 20, width * 0.82, height * 0.72, 20);
    noStroke();

    textAlign(CENTER, CENTER);
    fill(#FFE600);
    textFont(font_botones_r);
    textSize(38);
    text("HOW TO PLAY", width/2, height/2 - 210);

    fill(#00FFFF);
    textSize(20);
    text("CONTROLES", width/2, height/2 - 150);
    
    fill(255);
    textSize(17);
    text("- Moverte: Teclas W, A, S, D  o  Flechas de direccion", width/2, height/2 - 118);
    text("- Disparar / Accion: Barra Espaciadora", width/2, height/2 - 90);
    text("- Pausar: Tecla ENTER o Boton || PAUSE (Arriba a la derecha)", width/2, height/2 - 62);

    fill(#00FFFF);
    textSize(20);
    text("FILTRADO DE MENSAJES Y BIENESTAR DIGITAL", width/2, height/2 - 10);

    fill(255);
    textSize(16);
    text("Pilota tu nave y filtra el contenido cibernetico que llega a la pantalla:", width/2, height/2 + 20);

    fill(#00FF66);
    text("NAVES VERDES -> Interceptalas para sumar puntos.", width/2, height/2 + 55);

    fill(#FF4444);
    text("NAVES ROJAS -> Bloquealas o reportalas disparando.", width/2, height/2 + 88);

    fill(#AAAAAA);
    text("NAVES GRISES -> Esquivalas para no perder tiempo.", width/2, height/2 + 121);

    fill(#FFE600);
    textSize(16);
    text("¡Mantener el equilibrio cibernetico y supera el puntaje maximo!", width/2, height/2 + 160);

    dibujarBotonBack();
  }

  // ---------- Pantalla: Settings ----------
  void dibujarSettings() {
    rectMode(CENTER);
    fill(10, 15, 30, 230);
    stroke(#00FFFF);
    strokeWeight(2);
    rect(width/2, height/2 - 20, width * 0.75, height * 0.65, 20);
    noStroke();

    textAlign(CENTER, CENTER);
    fill(#FFE600);
    textFont(font_botones_r);
    textSize(38);
    text("SETTINGS", width/2, height/2 - 180);

    float startX = width/2 - 260;
    
    // Dificultad
    fill(255);
    textSize(20);
    textAlign(LEFT, CENTER);
    text("Dificultad:", startX, height/2 - 80);

    dibujarBotonOpcion(startX + 180, height/2 - 80, 100, 38, "FACIL", dificultad == 1);
    dibujarBotonOpcion(startX + 295, height/2 - 80, 110, 38, "NORMAL", dificultad == 2);
    dibujarBotonOpcion(startX + 420, height/2 - 80, 110, 38, "DIFICIL", dificultad == 3);

    // Velocidad
    fill(255);
    textSize(20);
    textAlign(LEFT, CENTER);
    text("Velocidad:", startX, height/2);

    dibujarBotonOpcion(startX + 180, height/2, 100, 38, "LENTA", velocidadNave == 1);
    dibujarBotonOpcion(startX + 295, height/2, 110, 38, "NORMAL", velocidadNave == 2);
    dibujarBotonOpcion(startX + 420, height/2, 110, 38, "RAPIDA", velocidadNave == 3);

    // Modo de Juego (Fijo)
    fill(255);
    textSize(20);
    textAlign(LEFT, CENTER);
    text("Modo Juego:", startX, height/2 + 80);

    rectMode(CENTER);
    stroke(#FF7700);
    strokeWeight(2);
    fill(#FF7700, 80);
    rect(startX + 220, height/2 + 80, 160, 38, 10);
    fill(#FF7700);
    textAlign(CENTER, CENTER);
    textSize(16);
    text("HISTORIA", startX + 220, height/2 + 80);

    dibujarBotonBack();
  }

  // ---------- Pantalla: Credits ----------
  void dibujarCredits() {
    rectMode(CENTER);
    fill(10, 15, 30, 230);
    stroke(#00FFFF);
    strokeWeight(2);
    rect(width/2, height/2 - 20, width * 0.70, height * 0.58, 20);
    noStroke();

    textAlign(CENTER, CENTER);
    fill(#FFE600);
    textFont(font_botones_r);
    textSize(38);
    text("CREDITS", width/2, height/2 - 150);

    fill(#00FFFF);
    textSize(22);
    text("BYTE INVADERS - Equipo 6", width/2, height/2 - 80);

    fill(255);
    textSize(18);
    text("Stephania Lamadrid ", width/2, height/2 - 15);
    text("Matias Guarin ", width/2, height/2 + 30);
    text("Natalia Herrera ", width/2, height/2 + 75);

    fill(#888888);
    textSize(16);
    text("Algoritmia y Programacion II -- Uninorte 2026", width/2, height/2 + 130);

    dibujarBotonBack();
  }

  // ---------- Componentes Auxiliares ----------
  void dibujarBotonPausaHUD() {
    float bx = width - 70;
    float by = 45;
    float bw = 90;
    float bh = 40;

    boolean mouseSobre = mouseX >= bx - bw/2 && mouseX <= bx + bw/2 && mouseY >= by - bh/2 && mouseY <= by + bh/2;

    rectMode(CENTER);
    stroke(#00FFFF);
    strokeWeight(2);
    fill(mouseSobre ? color(#00FFFF, 80) : color(10, 15, 30, 200));
    rect(bx, by, bw, bh, 10);

    fill(#00FFFF);
    textAlign(CENTER, CENTER);
    textSize(18);
    text("|| PAUSE", bx, by - 2);
  }

  void dibujarVentanaPausa() {
    fill(0, 180);
    rectMode(CORNER);
    rect(0, 0, width, height);

    rectMode(CENTER);
    stroke(#FFE600);
    strokeWeight(3);
    fill(10, 15, 30, 240);
    rect(width/2, height/2, 380, 260, 20);

    fill(#FFE600);
    textAlign(CENTER, CENTER);
    textSize(32);
    text("GAME PAUSED", width/2, height/2 - 75);

    float btnY1 = height/2 + 5;
    boolean overContinue = mouseX >= width/2 - 100 && mouseX <= width/2 + 100 && mouseY >= btnY1 - 22 && mouseY <= btnY1 + 22;
    stroke(#00FF66);
    strokeWeight(2);
    fill(overContinue ? color(0, 255, 102, 100) : color(10, 30, 20, 200));
    rect(width/2, btnY1, 200, 44, 10);
    fill(#00FF66);
    textSize(20);
    text("CONTINUE", width/2, btnY1 - 2);

    float btnY2 = height/2 + 65;
    boolean overHome = mouseX >= width/2 - 100 && mouseX <= width/2 + 100 && mouseY >= btnY2 - 22 && mouseY <= btnY2 + 22;
    stroke(#FF4444);
    strokeWeight(2);
    fill(overHome ? color(255, 68, 68, 100) : color(30, 10, 10, 200));
    rect(width/2, btnY2, 200, 44, 10);
    fill(#FF4444);
    textSize(20);
    text("HOME", width/2, btnY2 - 2);
  }

  void dibujarBotonOpcion(float bx, float by, float bw, float bh, String label, boolean seleccionado) {
    rectMode(CENTER);
    boolean mouseSobre = mouseX >= bx - bw/2 && mouseX <= bx + bw/2 && mouseY >= by - bh/2 && mouseY <= by + bh/2;
    
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
    fill(seleccionado ? #00FFFF : 200);
    text(label, bx, by);
  }

  void dibujarBotonBack() {
    rectMode(CENTER);
    fill(#0F0F0B);
    rect(width/2, height - 100, 160, 50, 12);
    
    fill(255);
    textAlign(CENTER, CENTER);
    textSize(24);
    text("BACK", width/2, height - 102);
  }
}
