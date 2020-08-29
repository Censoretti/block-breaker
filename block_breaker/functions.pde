//---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
//fundo
void drawBg() {
  rectMode(CORNER);
  background(0);
  stroke(255);
  noFill();

  strokeWeight(20);
  image(skype, 0, 0);
  hearts();
  image(skype, 0, 0);
}

//---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
//pad
void pad() {
  rectMode(CORNER);
  stroke(0);
  strokeWeight(3);
  fill(255);
  image(pinup, posXP, posYP);
  //mechendo o pad
  if (pR) posXP += soma;
  if (pL) posXP -= soma;
  //criando barreiras :P
  if (posXP >= width - 122  ) {
    posXP = width - 122;
  }
  if (posXP <= 18) {
    posXP = 18;
  }
}

//---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
void keyPressed() {
  //para mecher o pad
  if (keyCode == RIGHT || key == 'd') pR = true;
  if (keyCode == LEFT || key == 'a') pL = true;
  //teste
  if (key == 'i') count = true;
  if (key == 'k') count1 = true;
  if (key == 'j') count2 = true;
  if (key == 'l') count3 = true;
  if (key == 'e') shyv = true;
  //start game
  if (keyCode == ENTER) startGame = true;
  if (testeFase2 && keyCode == ENTER) {
    startPhase2 = true;
  }
  if (key == 'r') reset = true;
}



//---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
void keyReleased() {
  //para mecher o pad
  if (keyCode == RIGHT || key == 'd') pR = false;
  if (keyCode == LEFT || key == 'a') pL = false;
  //teste
  if (key == 'i') count = false;
  if (key == 'k') count1 = false;
  if (key == 'j') count2 = false;
  if (key == 'l') count3 = false;
  if (key == 'e') shyv = false;
}

//---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
//criando a posiçao dos blocks
void contVar() {
  i = 0;
  for (int a = 0; a < blocksX.length; a++) {
    if (i == 12) {
      i = 0;
      j ++;
    }
    blocksX[a] = i * 52 + 90;
    blocksY[a] = j * 20 + 50;
    blocksX2[a] = i * 52 + 90;
    blocksY2[a] = j * 20 + 50;
    i ++;
    kata[a] = 0;
    print(a, "blocksX", blocksX[a]);
    println(" blocksY", blocksY[a]);
  }
}

//---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
//criando os blocks
void block() {
  rectMode(CORNER);
  stroke(0);
  strokeWeight(1);
  fill(255, 0, 0);
  for (int i = 0; i < blocksX.length; i++) {   
    image(beard, blocksX[i], blocksY[i]);
  }
  if (shyv) {
    for (int i = 0; i < blocksX.length - 1; i++) {  
      blocksX[i] = 900;
      blocksY[i] = 900;
      kata[i] = 1;
    }
  }
}

//---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
//bolinha
void ball() {
  rectMode(CORNER);
  noStroke();
  fill(0, 0, 255);
  image(ironman, posXB, posYB);
  posXB += ballSpeedX;
  posYB += ballSpeedY;
  //teste
  if (count ) {
    ballSpeedY =  -1;
  }
  if (count1 ) {
    ballSpeedY =  1;
  }
  if (count2 ) {
    ballSpeedX =  -1;
  }
  if (count3 ) {
    ballSpeedX =  1;
  }

  //comparaçoes com o pad
  if (posYB + 15 >= posYP && posXB + 15 >= posXP && posXB <= posXP + 100 && posYB <= posYP + 18) {
    ballSpeedY *=  -1;
    hit.rewind();
    hit.play();
    if (posXB + 15 >= posXP && posXB <= posXP + 50) {
      ballSpeedX =  -1;
      hit.rewind();
      hit.play();
    } 
    else if (posXB + 15 >= posXP + 50 && posXB <= posXP + 100) {
      ballSpeedX =   1;
      hit.rewind();
      hit.play();
    }
  }

  //comparaçoes com os blocos
  for (int i = 0; i < blocksX.length; i ++) {
    //parte de baixo do bloco
    if (posYB == blocksY[i] + 18 && posXB + 15 >= blocksX[i] && posXB <= blocksX[i] + 50) {
      blocksX[i] = 900;
      blocksY[i] = 900;
      kata[i] = 1;
      score += 10;
      ballSpeedY =  1;
      hit.rewind();
      hit.play();
    }

    //parte da direita do bloco
    if (posXB == blocksX[i] + 50 && posYB + 15 >= blocksY[i] && posYB <= blocksY[i] + 18) {
      blocksX[i] = 900;
      blocksY[i] = 900;
      kata[i] = 1;
      score += 10;
      ballSpeedX =  1;
      hit.rewind();
      hit.play();
    }

    //parte da esquerda do bloco
    if (posXB + 15 == blocksX[i] && posYB + 15 >= blocksY[i] && posYB <= blocksY[i] + 18) {
      blocksX[i] = 900;
      blocksY[i] = 900;
      kata[i] = 1;
      score += 10;
      ballSpeedX =  -1;
      hit.rewind();
      hit.play();
    }

    //parte de cima do bloco
    if (posYB + 15 == blocksY[i] && posXB + 15 >= blocksX[i] && posXB <= blocksX[i] + 50) {
      blocksX[i] = 900;
      blocksY[i] = 900;
      kata[i] = 1;
      ballSpeedY =  -1;
      score += 10;
      hit.rewind();
      hit.play();
    }
  }

  //comparaçoes com a borda
  if (posXB >= width - 30 || posXB <= 15) {
    ballSpeedX *= - 1;
    hit.rewind();
    hit.play();
  }
  if (posYB <= 15) {
    ballSpeedY *= - 1;
    hit.rewind();
    hit.play();
  }
  if (posYB >= height - 35) {
    testeVida = 1;
    ballSpeedY *= - 1;
    posXB = int(posXP + 50 - 7);
    posYB = 480;
    out.rewind();
    out.play();
  }
}

//---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
//msg inicial
void startMsg() {
  font = createFont("visitor2.ttf", 40); 
  fill(0);
  rect(0, 0, 800, 600);
  fill(255);
  textFont(font);
  String msg = "        block breaker \nmexa o pad com 'a' ou '<' e 'd' ou '>' \n inicie o jogo pressionando enter \n \n \n \n \n    feito por \n    Rodrigo Berti \n    Bruno Papa e \n    Thayna Santos";
  text( msg, 107, 140);
}

//---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
//funçao da vida
void vida() {
  if (testeVida == 1) {
    vida --;
    testeVida = 0;
  }
  //quadrados da vida
  fill(255, 0, 0);
  image(ironman, recV1, 550);
  image(ironman, recV2, 550);
  image(ironman, recV3, 550);

  if (vida == 2) {
    recV3 = 1000;
  }
  if (vida == 1) {
    recV2 = 1000;
  }
  if (vida == 0) {
    recV1 = 1000;
  }
  //game over
  if (vida <= 0) {
    String msg = "        GAME OVER \n         score: ";
    text(msg + score, 150, 400);
    ballSpeedY = 0;
    ballSpeedX = 0;
    soma = 0;
    end.rewind();
    end.play();
  }
}

//---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
//checa 2 fase
void checkPhase() {
  xablau = 0;
  beringela = 0;
  for (int i = 0; i < kata.length; i ++) {
    if (startPhase2) {
      beringela += kata[i];
    } 
    else {
      xablau += kata[i];
    }
  }
  if (xablau >= 144) {
    text(msgs, 150, 400);
    ballSpeedY = 0;
    ballSpeedX = 0;
    soma = 0;
    testeFase2 = true;
  }
  if (beringela >= 144) {
    msgs = "         FIM DE JOGO \n         PRECIONE 'r' PARA REINICIAR O JOGO\n         score: ";
    text(msgs + score, 150, 400);
    ballSpeedY = 0;
    ballSpeedX = 0;
    soma = 0;
    end.rewind();
    end.play();
  }
}

void phase2() {
  if (testeFase2) {
    for (int i = 0; i < blocksY.length; i++) {
      blocksX[i] = blocksX2[i];
      blocksY[i] = blocksY2[i];
      kata[i] = 0;
    }
    xablau = 0;
    msgs = " ";
    ballSpeedY = 1;
    ballSpeedX = 1;
    soma = 1.75;
    posYB = posYBI;
    posXP = posXPI;
    posXB = posXBI;
    blocksX[39] = 900;
    blocksX[44] = 900;
    blocksX[51] = 900;
    blocksX[56] = 900;
    blocksX[63] = 900;
    blocksX[68] = 900;
    blocksX[75] = 900;
    blocksX[80] = 900;
    blocksX[87] = 900;
    blocksX[92] = 900;
    blocksX[99] = 900;
    blocksX[100] = 900;
    blocksX[101] = 900;
    blocksX[102] = 900;
    blocksX[103] = 900;
    blocksX[104] = 900;
    blocksY[39] = 900;
    blocksY[44] = 900;
    blocksY[51] = 900;
    blocksY[56] = 900;
    blocksY[63] = 900;
    blocksY[68] = 900;
    blocksY[75] = 900;
    blocksY[80] = 900;
    blocksY[87] = 900;
    blocksY[92] = 900;
    blocksY[99] = 900;
    blocksY[100] = 900;
    blocksY[101] = 900;
    blocksY[102] = 900;
    blocksY[103] = 900;
    blocksY[104] = 900;
    kata[39] = 1;
    kata[44] = 1;
    kata[51] = 1;
    kata[56] = 1;
    kata[63] = 1;
    kata[68] = 1;
    kata[75] = 1;
    kata[80] = 1;
    kata[87] = 1;
    kata[92] = 1;
    kata[99] = 1;
    kata[100] = 1;
    kata[101] = 1;
    kata[102] = 1;
    kata[103] = 1;
    kata[104] = 1;

    if (blocksX[143] == blocksX2[143]) {
      testeFase2 = false;
    }
  }
}
void farmando() {
  float[] comacim = new float[16];
  float[] comacim2 = new float[16];
  comacim[0] = blocksX2[39];
  comacim[1] = blocksX2[44];
  comacim[2] = blocksX2[51];
  comacim[3] =  blocksX2[56];
  comacim[4] = blocksX2[63];
  comacim[5] = blocksX2[68];
  comacim[6] = blocksX2[75];
  comacim[7] = blocksX2[80];
  comacim[8] = blocksX2[87];
  comacim[9] = blocksX2[92];
  comacim[10] = blocksX2[99];
  comacim[11] = blocksX2[100];
  comacim[12] = blocksX2[101];
  comacim[13] = blocksX2[102];
  comacim[14] = blocksX2[103];
  comacim[15] = blocksX2[104] ;
  comacim2[0] = blocksY2[39] ;
  comacim2[1] = blocksY2[44] ;
  comacim2[2] = blocksY2[51] ;
  comacim2[3] = blocksY2[56] ;
  comacim2[4] = blocksY2[63] ;
  comacim2[5] = blocksY2[68] ;
  comacim2[6] = blocksY2[75] ;
  comacim2[7] = blocksY2[80] ;
  comacim2[8] = blocksY2[87] ;
  comacim2[9] = blocksY2[92] ;
  comacim2[10] = blocksY2[99] ;
  comacim2[11] = blocksY2[100] ;
  comacim2[12] = blocksY2[101] ;
  comacim2[13] = blocksY2[102] ;
  comacim2[14] = blocksY2[103] ;
  comacim2[15] = blocksY2[104] ;
  for (int i = 0; i < comacim.length; i ++) {
    fill(0, 255, 0);
    image(beard2, comacim[i], comacim2[i]);
  }

  for (int i = 0; i < comacim.length; i ++) {
    //parte de baixo do bloco
    if (posYB == comacim2[i] + 18 && posXB + 15 >= comacim[i] && posXB <= comacim[i] + 50) {
      kata[i] = 1;
      ballSpeedY =  1;
    }

    //parte da direita do bloco
    if (posXB == comacim[i] + 50 && posYB + 15 >= comacim2[i] && posYB <= comacim2[i] + 18) {
      kata[i] = 1;
      ballSpeedX =  1;
    }

    //parte da esquerda do bloco
    if (posXB + 15 == comacim[i] && posYB + 15 >= comacim2[i] && posYB <= comacim2[i] + 18) {
      kata[i] = 1;
      ballSpeedX =  -1;
    }

    //parte de cima do bloco
    if (posYB + 15 == comacim2[i] && posXB + 15 >= comacim[i] && posXB <= comacim[i] + 50) {
      kata[i] = 1;
      ballSpeedY =  -1;
    }
  }
}

//---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
//reset
void reset() {
  if (reset) {
    vida = 3;
    testeVida = 0;
    recV1 = 700;
    recV2 = 712;
    recV3 = 724;
    startGame = false;
    startPhase2 = false;
    testeFase2 = false;
    msgs = "         PHASE TWO \n   tecle ENTER para iniciar";
    posXB = int(posXP + 50 - 7);
    posXBI = int(posXP + 50 - 7);
    posYB = 480;
    posYBI = 480;
    ballSpeedX = 1;
    ballSpeedY = 1;
    i = 0;
    j = 0;
    beringela = 0;
    xablau = 0;
    count = false;
    count1 = false;
    count2 = false;
    count3 = false;
    shyv = false;
    posXP = 350;
    posYP = 500;
    posXPI = 350;
    pR = false;
    pL = false;
    soma = 1.75;
    reset = false;
    i = 0;
    for (int a = 0; a < blocksX.length; a++) {
      if (i == 12) {
        i = 0;
        j ++;
      }
      blocksX[a] = i * 52 + 90;
      blocksY[a] = j * 20 + 50;
      blocksX2[a] = i * 52 + 90;
      blocksY2[a] = j * 20 + 50;
      i ++;
      kata[a] = 0;
      print(a, "blocksX", blocksX[a]);
      println(" blocksY", blocksY[a]);
    }
  }
}

//---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
//background

void heart() {
  noStroke();
  for (int i= 0; i<posX.length; i++) {
    posX[i] = i;
    speedX[i] = random(10);
  }
}

void hearts() {
  for (int i=0; i<posX.length; i++) {
    fill(255);
    noStroke();
    rect(posX[i], i, 1, 1);
    posX[i] += speedX[i];
    if (posX[i] > width) posX[i] = 0;
  }
}

