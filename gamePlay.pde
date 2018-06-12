void gamePlay() {

  int ref = 0;
  int ref1 = 0;
  int ref2 = 0;

  background(1);

  x = x + dx;
  y = y + dy;
  
  fill(255);
  ellipse(x,y,b_dia,b_dia);
  
  //racket HitCheck S
  if (racket_count>  0) {
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
  for (int i = 0; i<hit.length; i++) {
    if (hit[i] > 0) {
      show_block(i);
      ref = checkHitBlock(i, x, y);
      switch (ref) {
      case 1:
      case 2:
      case 8:
        dy = sy;
        hit[i]--;
        score = score + 10;
        break;
      case 5:
      case 4:
      case 6:
        dy = -sy;
        hit[i]--;
        score = score + 10;
        break;
      }
      switch (ref) {
      case 2:
      case 3:
      case 4:
        dx = sx;
        hit[i]--;
        score = score + 10;
        break;
      case 6:
      case 7:
      case 8:
        dx = -sx;
        hit[i]--;
        score = score + 10;
        break;
      }
    }
  }
  for (int i = 0; i<hit1.length; i++) {
    if (hit1[i] > 0) {
      show_block1(i);
      ref1 = checkHitBlock1(i, x, y);
      switch (ref1) {
      case 1:
      case 2:
      case 8:
        dy = sy;
        hit1[i]--;
        score = score + 10;
        break;
      case 5:
      case 4:
      case 6:
        dy = -sy;
        hit1[i]--;
        score = score + 10;
        break;
      }
      switch (ref1) {
      case 2:
      case 3:
      case 4:
        dx = sx;
        hit1[i]--;
        score = score + 10;
        break;
      case 6:
      case 7:
      case 8:
        dx = -sx;
        hit1[i]--;
        score = score + 10;
        break;
      }
    }
  }
  for (int i = 0; i<hit2.length; i++) {
    if (hit2[i] > 0) {
      show_block2(i);
      ref2 = checkHitBlock2(i, x, y);
      switch (ref2) {
      case 1:
      case 2:
      case 8:
        dy = sy;
        hit2[i]--;
        score = score + 10;
        break;
      case 5:
      case 4:
      case 6:
        dy = -sy;
        hit2[i]--;
        score = score + 10;
        break;
      }
      switch (ref2) {
      case 2:
      case 3:
      case 4:
        dx = sx;
        hit2[i]--;
        score = score + 10;
        break;
      case 6:
      case 7:
      case 8:
        dx = -sx;
        hit2[i]--;
        score = score + 10;
        break;
      }

    }
      fill(255);
      textSize(50);
      text(racket_count, width-80, height-20);
  }
  
  
  text("score : "+score,width/2,height-20);
  
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
    game_control = -1;
    x = 200;//start ballX
    y = 400;//start ballY
    dx = 3;
    dy = 4;
    racket_count = 30;
    racket = 3;
    score2 = 0;
    for (int i = 0; i<hit.length; i++) {
      hit[i] = 1;
      hit1[i] = 1;
      hit2[i] = 1;
    }
    return;
  }
  if ((hit[0]==0)/*&&(hit[1]==0)&&(hit[2]==0)&&(hit[3]==0)&&(hit[4]==0)&&(hit[5]==0)&&(hit[6]==0)&&(hit[7]==0)&&
      (hit1[0]==0)&&(hit1[1]==0)&&(hit1[2]==0)&&(hit1[3]==0)&&(hit1[4]==0)&&(hit1[5]==0)&&(hit1[6]==0)&&(hit1[7]==0)&&
      (hit2[0]==0)&&(hit2[1]==0)&&(hit2[2]==0)&&(hit2[3]==0)&&(hit2[4]==0)&&(hit2[5]==0)&&(hit2[6]==0)&&(hit2[7]==0)*/) {
    x = 200;
    y = 400;
    dx = 3;
    dy = 4;
    score = score + racket_count*10;
    racket_count = 30;
    racket = 3;
    game_control = 3;
    for (int i = 0; i<hit.length; i++){
      hit[i] = 1;
      hit1[i] = 1;
      hit2[i] = 1;
    }
  }
}
