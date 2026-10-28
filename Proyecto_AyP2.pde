// ---------- Imágenes del menú ----------
PImage titulo_menu;

// ---------- Fondo animado (el del juego) ----------
PImage fondo;
PImage[] estrellas = new PImage[8];
float fondoY = 0;
float velFondo = 0.5;        // más alto = más rápido
int frameEstrellas = 0;
int velTitileo = 10;         // menor = titileo más rápido

// ---------- Nave ----------
PImage nave;
PImage[] frames = new PImage[8];
int frameActual = 0;
float x, y;

// ---------- Interfaz ----------
Pantallas gestorPantallas;

// --- Variables de Ajustes y pausa---
int dificultad = 2;     // 1: Facil, 2: Normal, 3: Dificil
int velocidadNave = 2;  // 1: Lenta, 2: Normal, 3: Rapida
String modoJuego = "HISTORIA"; // Fijo
boolean juegoPausado = false;

float pantalla = 1;

void setup() {
  fullScreen();
  imageMode(CENTER);
  noSmooth();  // evita que el pixel art se vea borroso
  frameRate(60);
  gestorPantallas = new Pantallas();
  cargarImagenes();

  font_botones_r = createFont("font_botones_r.ttf", 42);
  x = width / 2;
  y = height - 200;
  
  //Botones del menú
  float distancia = 80;
  for (int i = 0; i < textoBotones.length; i++) {
    botones_menu[i] = new Boton();
    botonX[i] = width/2;
    botonY[i] = 480  +  i*distancia;
  }
}

void cargarImagenes() {
  titulo_menu = loadImage("titulo_byteinvaders.png");
  
  nave = loadImage("nave.png");
  for (int i = 0; i < 8; i++) {
    frames[i] = nave.get(i * 64, 0, 64, 64);  // recorta cada cuadro de 64x64
  }
  
  fondo = loadImage("fondo_loop_1920x1080.png");
  for (int i = 0; i < estrellas.length; i++) {
    estrellas[i] = loadImage("estrellas_" + i + ".png");
  }
}

void draw() {
  background(#010005);
  
  if (pantalla == 2 && !juegoPausado) {
    fondoY += velFondo;
  } else if (pantalla != 2 ){
    fondoY = height / 2;
  }
  dibujarFondo(fondoY);
  
  // contenido de cada pantalla
  if (pantalla == 1) {
    apariencia_menu();
  } else if (pantalla == 2) {
    dibujarNave();
    moverNave();
    dibujarDisparos();
    gestorPantallas.dibujarBotonPausaHUD();
       if (juegoPausado) {
       gestorPantallas.dibujarVentanaPausa();
       }
 } else if (pantalla == 3) {
  gestorPantallas.dibujarHowToPlay();
 } else if (pantalla == 4) {
  gestorPantallas.dibujarSettings();
 } else if (pantalla == 5) {
  gestorPantallas.dibujarCredits();
 }
}

void dibujarFondo(float fondoY) {
  imageMode(CORNER);
  if (fondoY >= height) fondoY -= height;
  int yy = int(fondoY);

  if (frameCount % velTitileo == 0) {
    frameEstrellas = (frameEstrellas + 1) % estrellas.length;
  }

  image(fondo, 0, yy, width, height);
  image(fondo, 0, yy - height, width, height);
  image(estrellas[frameEstrellas], 0, yy, width, height);
  image(estrellas[frameEstrellas], 0, yy - height, width, height);

  imageMode(CENTER);   // vuelve al modo que usa todo lo demás
}

void dibujarNave() {
if (!juegoPausado){
  if (frameCount % 6 == 0) {
    frameActual = (frameActual + 1) % 8;
  }
}
  image(frames[frameActual], x, y, 64*2, 64*2);
}

void moverNave() {
if (juegoPausado)return;
    if (Arriba == 1) {
    y = y - v;
  }
  if (Izquierda == 1) {
    x = x - v;
  }
  if (Abajo == 1) {
    y = y + v;
  }
  if (Derecha == 1) {
    x = x + v;
  }

  // límites de pantalla
  if (y <= 32) {
    y = y + v;
  }
  if (x <= 32) {
    x = x + v;
  }
  if (y >= height - 32) {
    y = y - v;
  }
  if (x >= width - 32) {
    x = x - v;
  }
}

void dibujarDisparos() {
  for (int i = 0; i < maxDisparos; i++) {
    if (balaAct[i]) {
      fill(#4080d2);
      rect(disparosX[i], disparosY[i], 5, 20);
      if (!juegoPausado){
      disparosY[i] -= velDisp;
      }
    }
    if (disparosY[i] < 0) {
      balaAct[i] = false;
    }
  }
}

void mousePressed() {
  if (pantalla == 1) {
    for (int i=0; i<textoBotones.length; i++) {
      boolean overButton = (
        mouseX >= botonX[i] - ancho / 2 &&
        mouseX <= botonX[i] + ancho / 2 &&
        mouseY >= botonY[i] - alto / 2 &&
        mouseY <= botonY[i] + alto / 2
        );

      if (overButton == true) {
        switch(i) {
        case 0:
          pantalla = 2;
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
  }else if (pantalla == 2) {
    float bx = width - 70;
    float by = 45;
    
    // Clic en el botón || PAUSE
    if (mouseX >= bx - 45 && mouseX <= bx + 45 && mouseY >= by - 20 && mouseY <= by + 20) {
      juegoPausado = !juegoPausado;
      return;
    }

    if (juegoPausado) {
      float btnY1 = height/2 + 5;
      float btnY2 = height/2 + 65;

      if (mouseX >= width/2 - 100 && mouseX <= width/2 + 100 && mouseY >= btnY1 - 22 && mouseY <= btnY1 + 22) {
        juegoPausado = false; // CONTINUE
      }
      
      if (mouseX >= width/2 - 100 && mouseX <= width/2 + 100 && mouseY >= btnY2 - 22 && mouseY <= btnY2 + 22) {
        juegoPausado = false;
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
        velocidadNave = 1;
        v = 10;
      }
      if (mouseX >= startX + 295 - 55 && mouseX <= startX + 295 + 55) {
        velocidadNave = 2;
        v = 20;
      }
      if (mouseX >= startX + 420 - 55 && mouseX <= startX + 420 + 55) {
        velocidadNave = 3;
        v = 30;
      }
    }
    
    // Botón BACK
    if (mouseX >= width/2 - 80 && mouseX <= width/2 + 80 && mouseY >= height - 125 && mouseY <= height - 75) {
      pantalla = 1; 
    }
  } else if (pantalla == 3 || pantalla == 5) {
    // Botón BACK
    if (mouseX >= width/2 - 80 && mouseX <= width/2 + 80 && mouseY >= height - 125 && mouseY <= height - 75) {
      pantalla = 1; 
    }
  }
}
