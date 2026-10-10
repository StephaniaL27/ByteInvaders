PImage fondo_estrellas;
int pantalla = 1;
float x;
float y;

void setup() {
  fullScreen();
  background(#010005);
  x = width / 32;
  y = height / 2;

  imageMode(CENTER);
  fondo_estrellas = loadImage("fondo_estrellas.png");
  titulo = loadImage("titulo_byteinvaders.png");
  font_botones = createFont("font_botones.ttf", 40); 
}

void draw() {
   
   switch(pantalla) {
   case 1:
   image(fondo_estrellas, width/2, height/2, width-10, height-10);
   apariencia_menu();
   break;
   case 2:
   circle(x, y, 50);
   
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
   
   // Para definir el espacio en el que la nave pueda moverse,
   
   if (y == 0) {
   y = y + v;
   }
   if (x == 0) {
   x = x + v;
   }
   if (y == height) {
   y = y - v;
   }
   if (x == width) {
   x = x - v;
   }
   break;
   }
}
