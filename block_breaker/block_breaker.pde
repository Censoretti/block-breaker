void setup() {
  size(800, 600);
  contVar();
  frameRate(180);
  heart();
  ironman = loadImage("Bola.png");
  pinup = loadImage("Pad.jpg");
  beard = loadImage("Brick1.jpg");
  beard2 = loadImage("Brick2.jpg");
  skype = loadImage("Moldura(1).png");
  minim = new Minim(this);
  hit = minim.loadSnippet("hit.mp3");
  out = minim.loadSnippet("out.mp3");
  end = minim.loadSnippet("end.mp3");
  finalcore = minim.loadSnippet("finalcore.mp3");
  finalcore.rewind();
  finalcore.play();
}

void draw() {
  if (!reset) {
    if (startGame) {
      if (startPhase2) {
        phase2();
        phase();
        farmando();
      } 
      else {
        phase();
      }
    } 
    else {
      startMsg();
    }
  }
  else {
    reset();
  }
}

void phase() {
  drawBg();
  pad();
  block();
  ball();
  vida();
  checkPhase();
}

