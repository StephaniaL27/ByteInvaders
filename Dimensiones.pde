// ---------- Escala ----------

// Todo el diseño se mide sobre un lienzo de 1920 × 1080, desde la esquina superior izquierda.
// escalar() pasa esas medidas a la pantalla real.
float escala;

// ---------- Medidas del diseño (cuadrícula de 8 px) ----------

// Letras
int letraN = 24;
int letraS = 32;
int letraT3 = 40;
int letraT2 = 48;
int letraT1 = 56;

// Espacios
int espacioP = 16;
int espacioM = 32;

// Botones (radio = alto)
int wBotonP = 160;
int hBotonP = 40;
int wBotonM = 256;
int hBotonM = 48;
int wBotonG = 512;
int hBotonG = 64;

// Paneles
int wPanel = 1280;
int hPanel = 720;
int radioPanel = 32;

// ---------- Funciones del diseño ----------

float escalar(float pixeles) {
  return pixeles * escala;
}

// Posición del elemento i de un grupo: el primero va en inicio y cada uno suma una separación.
float posicion(int i, float inicio, float separacion) {
  return inicio + i * separacion;
}
