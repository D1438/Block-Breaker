void show_blockP(int n) {
  fill(255);
  rect(b_w * n + 100 + n * 250, 100, b_w, b_h, 5);
}

int checkHitBlockP(int n, float x, float y) {
  float left   = b_w * n + 100 + n * 250;
  float right  = b_w * (n + 1) + 100 + n * 250;
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

void gamePlay_Practice() {
  int ref2 = 0;  

  background(0);
  textSize(30);
  text("Back To Press 'BACK SPACE'", 10, 30);
  
  x = x + dx;
  y = y + dy;

  fill(255);
  ellipse(x, y, b_dia, b_dia);  

  //racket HitCheck S
  if (racket_count>0) {
    rect(mouseX-75, height*13/16, r_w, r_h, 20);

    for (int n=30; n<=75; n++) {
      if ((mouseX+n<=x)&&(x<mouseX+1+n)&&
        (height*13/16-10<=y)&&(y<height*13/16)) {
        dx = n/10;
        dy = -dy;
        racket_count = racket_count - 1;
      }
    }
    for (int n=-75; n<=-30; n++) {
      if ((mouseX+n<=x)&&(x<mouseX+1+n)&&
        (height*13/16-10<=y)&&(y<height*13/16)) {
        dx = n/10;
        dy = -dy;
        racket_count = racket_count - 1;
      }
    }
    if ((mouseX-30<x)&&(x<mouseX-10)&&
      (height*13/16-10<=y)&&(y<height*13/16)) {
      dx = -2;
      dy = -dy;
      racket_count = racket_count - 1;
    }
    if ((mouseX+10<x)&&(x<mouseX+30)&&
      (height*13/16-10<=y)&&(y<height*13/16)) {
      dx = 2;
      dy = -dy;
      racket_count = racket_count - 1;
    }
    for (int n=-10; n<=10; n++) {  
      if ((mouseX+n<=x)&&(x<mouseX+1+n)&&
        (height*13/16-10<=y)&&(y<height*13/16)) {
        dx = n/5;
        dy = -dy;
        racket_count = racket_count - 1;
      }
    }
    if ((mouseX-85<=x)&&(x<mouseX)&&
      (height*13/16<=y)&&(y<height*13/16+20)) {
      dx = -dx;
      racket_count = racket_count - 1;
    }
    if ((x<mouseX)&&(x>=mouseX+85)&&
      (height*13/16<=y)&&(y<height*13/16+20)) {
      dx = -dx;
      racket_count = racket_count - 1;
    }
    if (mouseX-75<0) {
      rect(0, height*13/16, r_w, r_h, 20);
      mouseX = 75;
    }
    if (mouseX+75>width) {
      rect(width-r_w, height*13/16, r_w, r_h, 20);
      mouseX = width-75;
    }
  }
  //racket HitCheck E
  if (x<10) {
    dx=-dx;
  }
  if (width-10<x) {
    dx=-dx;
  }
  if (y<10) {
    dy=-dy;
  }


  for (int i = 0; i<hit6.length; i++) {
    if (hit6[i] > 0) {
      show_blockP(i);
      ref2 = checkHitBlockP(i, x, y);
      switch (ref2) {
      case 1:
      case 2:
      case 8:
        dy = sy;
        hit6[i]--;
        break;
      case 5:
      case 4:
      case 6:
        dy = -sy;
        hit6[i]--;
        break;
      }
      switch (ref2) {
      case 2:
      case 3:
      case 4:
        dx = sx;
        hit6[i]--;
        break;
      case 6:
      case 7:
      case 8:
        dx = -sx;
        hit6[i]--;
        break;
      }
    }
  }


  if (y>height) {
    x = 200;//start ballX
    y = 400;//start ballY
  }
}
