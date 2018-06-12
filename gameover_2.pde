void gameOver_2() {
  textSize(130);
  text("Game Over", 150, height/3);


  if ((width/3-110<mouseX)&&(mouseX<width/3+55)&&
    (height*3/4-60<mouseY)&&(mouseY<height*3/4)) {
    textSize(50);
    text("Retry", width/3-100, height*3/4);
  } else {
    textSize(60);
    text("Retry", width/3-100, height*3/4);
  }
  if ((width*2/3-20<mouseX)&&(mouseX<width*2/3+115)&&
    (height*3/4-50<mouseY)&&(mouseY<height*3/4)) {
    textSize(50);
    text("Title", width*2/3-15, height*3/4);
  } else {
    textSize(60);
    text("Title", width*2/3-15, height*3/4);
  }
}
