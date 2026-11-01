// ---------- Imágenes del menú ----------
PImage Titulo_menu;

// ---------- Fondo animado ----------
PImage fondo;                        // Imagen de fondo (se repite en bucle vertical)
PImage[] estrellas = new PImage[8];  // Frames de las estrellas que titilan
float Velocidad_fondo = 5;           // Velocidad vertical del fondo (px por frame)
float Fondo_y = -Velocidad_fondo;    // Posición vertical actual del fondo
int Frame_estrellas = 0;             // Frame actual del titileo de las estrellas
int Velocidad_titileo = 7;           // Cada cuántos frames cambia el titileo

// ---------- Interfaz ----------
Pantallas GestorPantallas;  // Gestor que dibuja las pantallas secundarias
int pantalla = 1;            // 1: Menú, 2: Juego, 3: How to play, 4: Settings, 5: Credits

// ---------- Ajustes y pausa ----------
int dificultad = 2;              // 1: Fácil, 2: Normal, 3: Difícil
int Velocidad_nave = 2;          // 1: Lenta, 2: Normal, 3: Rápida
String Modo_juego = "HISTORIA";
boolean JuegoPausado = false;   // true si el juego está en pausa

// ---------- Naves ----------
PImage Nave_jugador;
PImage NaveRoja;
PImage NaveVerde;
PImage NaveGris;
int MaxEnemigos = 20;
Naves Jugador;

// ---------- Vidas ----------
PImage corazones;


void setup() {
  fullScreen();
  imageMode(CENTER);
  rectMode(CENTER);
  noSmooth();  // Evita que el pixel art se vea borroso
  frameRate(60);
  
  fuenteBoton = createFont("font_botones_r.ttf", 42);
  textFont(fuenteBoton);
  
  GestorPantallas = new Pantallas();
  cargarImagenes();

  // La nave del jugador inicia bajo la pantalla y sube hasta su posición
  Jugador = new Naves(Nave_jugador, width / 2, height + 64, 0);

  // Botones del menú, uno debajo del otro
  float distancia = 80;
  for (int i = 0; i < Botones_menu.length; i++) {
    botones_menu[i] = new Boton();
    boton_x[i] = width / 2;
    boton_y[i] = 480 + i * distancia;
  }
  
  crearEnemigos();
}


void cargarImagenes() {
  Titulo_menu = loadImage("titulo_byteinvaders.png");
  corazones = loadImage("corazones.png");
  Nave_jugador = loadImage("nave.png");
  NaveRoja = loadImage("nave_roja.png");
  NaveVerde = loadImage("nave_verde.png");
  NaveGris = loadImage("nave_npc.png");
  fondo = loadImage("fondo_loop_1920x1080.png");

  for (int i = 0; i < estrellas.length; i++) {
    estrellas[i] = loadImage("estrellas_" + i + ".png");
  }
}

void draw() {
  // Fondo: se desplaza en el juego y queda quieto en las demás pantallas
  if (pantalla == 2 && !JuegoPausado) {
    Fondo_y += Velocidad_fondo;
    if (Fondo_y >= height) {
      Fondo_y -= height;   // vuelve al inicio del bucle
    }
  } else if (pantalla != 2) {
    Fondo_y = height / 2;
  }
  dibujarFondo(Fondo_y);
  
  // Contenido de cada pantalla
  switch (pantalla) {
    case 1:
      apariencia_menu();
    break;
    case 2:
      DibujarJuego();
    break;
    case 3:
      GestorPantallas.DibujarHowToPlay();
    break;
    case 4:
      GestorPantallas.dibujarConfiguracion();
    break;
    default:
      GestorPantallas.dibujarCreditos();
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
