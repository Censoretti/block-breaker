import ddf.minim.*;

Minim minim;
AudioSnippet hit;
AudioSnippet out;
AudioSnippet end;
AudioSnippet finalcore;

//pad
float posXP = 350;
float posYP = 500;
int posXPI = 350;
boolean pR = false;
boolean pL = false;
float soma = 1.75;

//blocks
int[] blocksX = new int[144];
int[] blocksY = new int[144];

//verifica quantos blocos sumiram
int[] kata = new int[144];

//backup
int[] blocksX2 = new int[144];
int[] blocksY2 = new int[144];


//variaves de testes / aleatorias / HACKS
boolean count = false;
boolean count1 = false;
boolean count2 = false;
boolean count3 = false;
boolean shyv = false;

//contadores
//verifica se o jogo na PHASE 1 terminou
float xablau = 0;
//verifica se o jogo na PHASE 2 terminou
int beringela = 0;


//contadores da posição dos blocks
int i = 0;
int j = 0;

//bolinha
int posXB = int(posXP + 50 - 7);
int posXBI = int(posXP + 50 - 7);
float posYB = 480;
int posYBI = 480;
float ballSpeedX = 1;
float ballSpeedY = 1;


//font
PFont font;

//start game
boolean startGame = false;
boolean startPhase2 = false;
boolean testeFase2 = false;
String msgs = "         PHASE TWO \n   tecle ENTER para iniciar";


//vida
int vida = 3;
int testeVida = 0;
int recV1 = 700;
int recV2 = 712;
int recV3 = 724;

//imagens
PImage ironman;
PImage pinup;
PImage beard;
PImage beard2;
PImage skype;

//heart
float[] posX = new float[800];
float[] speedX = new float[800];

//reset
boolean reset = false; 
boolean resetTeste = false;

//score
int score = 0;
