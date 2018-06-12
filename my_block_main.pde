import processing.sound.*;
SoundFile BGM;




int game_control;
float x = 200;//start ballX
float y = 400;//start ballY
float dx = 3;
float dy = 4;
float sx = dx;
float sy = dy;

int hit[] = {1, 1, 1, 1, 1, 1, 1, 1, 1, 1};
int hit1[] = {1, 1, 1, 1, 1, 1, 1, 1, 1, 1};
int hit2[] = {1, 1, 1, 1, 1, 1, 1, 1, 1, 1};
int hit3[] = {2, 2, 2, 2, 2, 2, 2, 2, 2, 2};
int hit4[] = {2, 2, 2, 2, 2, 2, 2, 2, 2, 2};
int hit5[] = {2, 2, 2, 2, 2, 2, 2, 2, 2, 2};
int hit6[] = {10000,10000,10000};

int racket = 3;

int racket_count = 25;

float r_w = 150.0; // racket width
float r_h = 20.0; // racket height
float b_w = 80.0;
float b_h = 30.0;
float b_dia = 20.0; //ball diameter
float P_b_w = 50.0;//block width(Practice)
float P_b_h = 50.0;//block height(Practice)

int score = 0;
int score2 = 0;


void setup() {
  size(1000, 800);
  gameInit();
  BGM = new SoundFile(this,"bgm_maoudamashii_cyber37 a.mp3");
  BGM.play();
}

void draw() {
  background(0);
  if (game_control==0) {
    gameTitle();
  } else if (game_control==1) {
    gamePlay();
  } else if (game_control==2) {
    gamePlay_Practice();
  } else if (game_control==3) {
    gameclear();
  } else if (game_control==4) {
    gamePlay_2();
  } else if (game_control==5) {
    gameclear_2();
  } else if (game_control==-1){
    gameOver();
  } else {
    gameOver_2();
  }
}



void gameInit() {
  game_control = 0;
}


void mouseReleased() {
  loop();
}


void mousePressed() {
  switch(game_control) {
  case 0:
    if ((590<mouseX)&&(mouseX<840)&&(460<mouseY)&&
      (mouseY<510)) {
      game_control = 1;
    } 
    if ((590<mouseX)&&(mouseX<770)&&
      (520<mouseY)&&(mouseY<570)) {
      game_control = 2;
    }
    if ((590<mouseX)&&(mouseX<685)&&
      (580<mouseY)&&(mouseY<630)) {
      exit();
    }
    noLoop();
    break;
  case 1:
  
    break;
  case 2:
    break;
  case 3:
    if ((width/3-160<mouseX)&&(mouseX<width/3+160)&&
      (height*3/4-60<mouseY)&&(mouseY<height*3/4)) {
      game_control = 4;
    }
    if ((width*2/3-20<mouseX)&&(mouseX<width*2/3+115)&&
      (height*3/4-50<mouseY)&&(mouseY<height*3/4)) {
      game_control = 0;
    }
    break;
  case 4:
    break;
  case 5:
    if ((width/2-30<mouseX)&&(mouseX<width/2+90)&&
    (height*9/10-50<mouseY)&&(mouseY<height*9/10)) {
      game_control = 0;
      score = 0;
      score2 = 0;
    }
    break;
  case -1:
    if ((width/3-110<mouseX)&&(mouseX<width/3+55)&&
      (height*3/4-60<mouseY)&&(mouseY<height*3/4)) {
      game_control = 1;
    }
    if ((width*2/3-20<mouseX)&&(mouseX<width*2/3+115)&&
      (height*3/4-50<mouseY)&&(mouseY<height*3/4)) {
      game_control = 0;
    }
    break;
  case -2:
    if((width/3-110<mouseX)&&(mouseX<width/3+55)&&
    (height*3/4-60<mouseY)&&(mouseY<height*3/4)) {
      game_control = 4;
    }
    if ((width*2/3-20<mouseX)&&(mouseX<width*2/3+115)&&
    (height*3/4-50<mouseY)&&(mouseY<height*3/4)) {
      game_control = 0;
    }
    break;
  default:
    break;
  }
}

void keyPressed() {
  switch(game_control) {
  case 0:
    break;
  case 1:
    break;
  case 2:
    if (key==BACKSPACE) {
      game_control = 0;
    }
    break;
  case -1:
    break;
  default:
    break;
  }
}
void keyReleased() {
  loop();
}

void gameTitle() {
  textSize(100);
  text("Block Breaker", 100, 250);
  if ((590<mouseX)&&(mouseX<840)&&
    (460<mouseY)&&(mouseY<510)) {
    textSize(40);
    text("Game Start", 600, 500);
  } else {
    textSize(45);
    text("Game Start", 600, 500);
  }
  if ((590<mouseX)&&(mouseX<770)&&
    (520<mouseY)&&(mouseY<570)) {
    textSize(40);
    text("Practice", 600, 560);
  } else {
    textSize(45);
    text("Practice", 600, 560);
  }
  if ((590<mouseX)&&(mouseX<685)&&
    (580<mouseY)&&(mouseY<630)) {
    textSize(40);
    text("Exit", 600, 620);
  } else {
    textSize(45);
    text("Exit", 600, 620);
  }
}


void show_block(int n) {
  fill(20*n+80, 0, 0);
  rect(b_w * n + 100, 100, b_w, b_h, 5);
}

int checkHitBlock(int n, float x, float y) {
  float left   = b_w * n + 100;
  float right  = b_w * (n + 1) + 100;
  float top    = 100;
  float bottom = 100 + b_h;
  float cx = left + b_w / 2;
  float cy = top + b_h / 2;
  float y1, y2;

  if ((x + b_dia / 2 <= left) ||
    (x >= right) ||
    (y + b_dia / 2 <= top) ||
    (y - b_dia / 2>= bottom)) {
    return 0;
  }

  x = x + b_dia / 2;
  y = y + b_dia / 2;

  y1 = y - (-(x - cx)* b_h / b_w + cy);
  y2 = y - ( (x - cx)* b_h / b_w + cy);

  if (y1 > 0) {
    if (y2 > 0) {
      return 1;
    } else if (y2 == 0) {
      return 2;
    } else {
      return 3;
    }
  } else if (y1 < 0) {
    if (y2 > 0) {
      return 7;
    } else if (y2 == 0) {
      return 6;
    } else {
      return 5;
    }
  } else {
    if (y2 > 0) {
      return 8;
    } else if (y2 == 0) {
      return -1;
    } else {
      return 4;
    }
  }
}
void show_block1(int n) {
  fill(0, 20*n+80, 0);
  rect(b_w * n + 100, 190, b_w, b_h, 5);
}

int checkHitBlock1(int n, float x, float y) {
  float left   = b_w * n + 100;
  float right  = b_w * (n + 1) + 100;
  float top    = 190;
  float bottom = 190 + b_h;
  float cx = left + b_w / 2;
  float cy = top + b_h / 2;
  float y1, y2;

  if ((x + b_dia / 2 <= left) ||
    (x >= right) ||
    (y + b_dia / 2 <= top) ||
    (y - b_dia / 2>= bottom)) {
    return 0;
  }

  x = x + b_dia / 2;
  y = y + b_dia / 2;

  y1 = y - (-(x - cx)* b_h / b_w + cy);
  y2 = y - ( (x - cx)* b_h / b_w + cy);

  if (y1 > 0) {
    if (y2 > 0) {
      return 1;
    } else if (y2 == 0) {
      return 2;
    } else {
      return 3;
    }
  } else if (y1 < 0) {
    if (y2 > 0) {
      return 7;
    } else if (y2 == 0) {
      return 6;
    } else {
      return 5;
    }
  } else {
    if (y2 > 0) {
      return 8;
    } else if (y2 == 0) {
      return -1;
    } else {
      return 4;
    }
  }
}
void show_block2(int n) {
  fill(0, 0, 20*n+80);
  rect(b_w * n + 100, 280, b_w, b_h, 5);
}

int checkHitBlock2(int n, float x, float y) {
  float left   = b_w * n + 100;
  float right  = b_w * (n + 1) + 100;
  float top    = 280;
  float bottom = 280 + b_h;
  float cx = left + b_w / 2;
  float cy = top + b_h / 2;
  float y1, y2;

  if ((x + b_dia / 2 <= left) ||
    (x >= right) ||
    (y + b_dia / 2 <= top) ||
    (y - b_dia / 2 >= bottom)) {
    return 0;
  }

  x = x + b_dia / 2;
  y = y + b_dia / 2;

  y1 = y - (-(x - cx)* b_h / b_w + cy);
  y2 = y - ( (x - cx)* b_h / b_w + cy);

  if (y1 > 0) {
    if (y2 > 0) {
      return 1;
    } else if (y2 == 0) {
      return 2;
    } else {
      return 3;
    }
  } else if (y1 < 0) {
    if (y2 > 0) {
      return 7;
    } else if (y2 == 0) {
      return 6;
    } else {
      return 5;
    }
  } else {
    if (y2 > 0) {
      return 8;
    } else if (y2 == 0) {
      return -1;
    } else {
      return 4;
    }
  }
}
void show_block3(int n) {
  if (hit3[n] == 2) {
    fill(20*n+80, 0, 0);
  } else if (hit3[n] == 1) {
    fill(100);
  }
  rect(b_w * n + 100, 100, b_w, b_h, 5);
}

int checkHitBlock3(int n, float x, float y) {
  float left   = b_w * n + 100;
  float right  = b_w * (n + 1) + 100;
  float top    = 100;
  float bottom = 100 + b_h;
  float cx = left + b_w / 2;
  float cy = top + b_h / 2;
  float y1, y2;

  if ((x + b_dia / 2 <= left) ||
    (x >= right) ||
    (y + b_dia / 2 <= top) ||
    (y - b_dia / 2 >= bottom)) {
    return 0;
  }

  x = x + b_dia / 2;
  y = y + b_dia / 2;

  y1 = y - (-(x - cx)* b_h / b_w + cy);
  y2 = y - ( (x - cx)* b_h / b_w + cy);

  if (y1 > 0) {
    if (y2 > 0) {
      return 1;
    } else if (y2 == 0) {
      return 2;
    } else {
      return 3;
    }
  } else if (y1 < 0) {
    if (y2 > 0) {
      return 7;
    } else if (y2 == 0) {
      return 6;
    } else {
      return 5;
    }
  } else {
    if (y2 > 0) {
      return 8;
    } else if (y2 == 0) {
      return -1;
    } else {
      return 4;
    }
  }
}
void show_block4(int n) {
  if (hit4[n] == 2) {
    fill(0, 20*n+80, 0);
  } else if (hit4[n] == 1) {
    fill(100);
  }
  rect(b_w * n + 100, 190, b_w, b_h, 5);
}

int checkHitBlock4(int n, float x, float y) {
  float left   = b_w * n + 100;
  float right  = b_w * (n + 1) + 100;
  float top    = 190;
  float bottom = 190 + b_h;
  float cx = left + b_w / 2;
  float cy = top + b_h / 2;
  float y1, y2;

  if ((x + b_dia / 2 <= left) ||
    (x >= right) ||
    (y + b_dia / 2 <= top) ||
    (y - b_dia / 2 >= bottom)) {
    return 0;
  }

  x = x + b_dia / 2;
  y = y + b_dia / 2;

  y1 = y - (-(x - cx)* b_h / b_w + cy);
  y2 = y - ( (x - cx)* b_h / b_w + cy);

  if (y1 > 0) {
    if (y2 > 0) {
      return 1;
    } else if (y2 == 0) {
      return 2;
    } else {
      return 3;
    }
  } else if (y1 < 0) {
    if (y2 > 0) {
      return 7;
    } else if (y2 == 0) {
      return 6;
    } else {
      return 5;
    }
  } else {
    if (y2 > 0) {
      return 8;
    } else if (y2 == 0) {
      return -1;
    } else {
      return 4;
    }
  }
}
void show_block5(int n) {
  if (hit5[n] == 2) {
    fill(0, 0, 20*n+80);
  } else if (hit5[n] == 1) {
    fill(100);
  }
  rect(b_w * n + 100, 280, b_w, b_h, 5);
}

int checkHitBlock5(int n, float x, float y) {
  float left   = b_w * n + 100;
  float right  = b_w * (n + 1) + 100;
  float top    = 280;
  float bottom = 280 + b_h;
  float cx = left + b_w / 2;
  float cy = top + b_h / 2;
  float y1, y2;

  if ((x + b_dia / 2 <= left) ||
    (x >= right) ||
    (y + b_dia / 2 <= top) ||
    (y - b_dia / 2 >= bottom)) {
    return 0;
  }

  x = x + b_dia / 2;
  y = y + b_dia / 2;

  y1 = y - (-(x - cx)* b_h / b_w + cy);
  y2 = y - ( (x - cx)* b_h / b_w + cy);

  if (y1 > 0) {
    if (y2 > 0) {
      return 1;
    } else if (y2 == 0) {
      return 2;
    } else {
      return 3;
    }
  } else if (y1 < 0) {
    if (y2 > 0) {
      return 7;
    } else if (y2 == 0) {
      return 6;
    } else {
      return 5;
    }
  } else {
    if (y2 > 0) {
      return 8;
    } else if (y2 == 0) {
      return -1;
    } else {
      return 4;
    }
  }
}
