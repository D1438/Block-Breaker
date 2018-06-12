void gamePlay_2() {


  int ref = 0;
  int ref1 = 0;
  int ref2 = 0;

  background(0);

  x = x + dx;
  y = y + dy;
  
  fill(255);
  ellipse(x,y,b_dia,b_dia);
 

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
  for (int i = 0; i<hit3.length; i++) {
    if (hit3[i] > 0) {
      show_block3(i);
      ref = checkHitBlock3(i, x, y);
      switch (ref) {
      case 1:
      case 2:
      case 8:
        dy = sy;
        hit3[i]--;
        score2 = score2 + 10;
        break;
      case 5:
      case 4:
      case 6:
        dy = -sy;
        hit3[i]--;
        score2 = score2 + 10;
        break;
      }
      switch (ref) {
      case 2:
      case 3:
      case 4:
        dx = sx;
        hit3[i]--;
        score2 = score2 + 10;
        break;
      case 6:
      case 7:
      case 8:
        dx = -sx;
        hit3[i]--;
        score2 = score2 + 10;
        break;
      }
    }
  }
  for (int i = 0; i<hit4.length; i++) {
    if (hit4[i] > 0) {
      show_block4(i);
      ref1 = checkHitBlock4(i, x, y);
      switch (ref1) {
      case 1:
      case 2:
      case 8:
        dy = sy;
        hit4[i]--;
        score2 = score2 + 10;
        break;
      case 5:
      case 4:
      case 6:
        dy = -sy;
        hit4[i]--;
        score2 = score2 + 10;
        break;
      }
      switch (ref1) {
      case 2:
      case 3:
      case 4:
        dx = sx;
        hit4[i]--;
        score2 = score2 + 10;
        break;
      case 6:
      case 7:
      case 8:
        dx = -sx;
        hit4[i]--;
        score2 = score2 + 10;
        break;
      }
    }
  }
  for (int i = 0; i<hit5.length; i++) {
    if (hit5[i] > 0) {
      show_block5(i);
      ref2 = checkHitBlock5(i, x, y);
      switch (ref2) {
      case 1:
      case 2:
      case 8:
        dy = sy;
        hit5[i]--;
        score2 = score2 + 10;
        break;
      case 5:
      case 4:
      case 6:
        dy = -sy;
        hit5[i]--;
        score2 = score2 + 10;
        break;
      }
      switch (ref2) {
      case 2:
      case 3:
      case 4:
        dx = sx;
        hit5[i]--;
        score2 = score2 + 10;
        break;
      case 6:
      case 7:
      case 8:
        dx = -sx;
        hit5[i]--;
        score2 = score2 + 10;
        break;
      }
      fill(255);
      textSize(50);
      text(racket_count, width-80, height-20);
    }
  }
  
  text("score2 : "+score2,width/2,height-20);
  
  if(y>height-b_dia){
    racket--;
    x = 200;
    y = 400;
    dx = 3;
    dy = 4;
  }
  
  textSize(60);
  text("LIFE",50,height-20);
  if(racket == 3){
    for(int i = 0;i<2;i++){
      ellipse(i*40+200,height-40,b_dia,b_dia);
    }
  }
  if(racket == 2){
    for(int i = 0;i<1;i++){
      ellipse(i*40+200,height-40,b_dia,b_dia);
    }
  }

  if (racket == 0) {
    game_control = -2;
    x = 200;//start ballX
    y = 400;//start ballY
    dx = 3;
    dy = 4;
    racket_count = 30;
    racket = 3;
    score2 = 0;
    for (int i = 0; i<hit.length; i++) {
      hit3[i] = 2;
      hit4[i] = 2;
      hit5[i] = 2;
    }
    return;
  }
  if ((hit3[0]==0)&&(hit3[1]==0)&&(hit3[2]==0)&&(hit3[3]==0)&&(hit3[4]==0)&&(hit3[5]==0)&&(hit3[6]==0)&&(hit3[7]==0)&&
    (hit4[0]==0)&&(hit4[1]==0)&&(hit4[2]==0)&&(hit4[3]==0)&&(hit4[4]==0)&&(hit4[5]==0)&&(hit4[6]==0)&&(hit4[7]==0)&&
    (hit5[0]==0)&&(hit5[1]==0)&&(hit5[2]==0)&&(hit5[3]==0)&&(hit5[4]==0)&&(hit5[5]==0)&&(hit5[6]==0)&&(hit5[7]==0)) {
    game_control = 5;
    x = 200;//start ballX
    y = 400;//start ballY
    dx = 3;
    dy = 4;
    score2 = score2 + racket_count * 10;
    racket_count = 30;
    racket = 3;
    for (int i = 0; i<hit.length; i++) {
      hit3[i] = 2;
      hit4[i] = 2;
      hit5[i] = 2;
    }
  }
}
