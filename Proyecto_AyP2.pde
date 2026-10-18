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

float pantalla = 1;

void setup() {
  fullScreen();
  imageMode(CENTER);
  noSmooth();  // evita que el pixel art se vea borroso
  frameRate(60);
  
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
  
  if (pantalla == 2) {
    fondoY += velFondo;
  } else {
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
  if (frameCount % 6 == 0) {
    frameActual = (frameActual + 1) % 8;
  }
  image(frames[frameActual], x, y, 64*2, 64*2);
}

void moverNave() {
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
      disparosY[i] -= velDisp;
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
  }
}
