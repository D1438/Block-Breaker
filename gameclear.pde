void gameclear(){
  textSize(130);
  text("Game Clear",150,height/3);
  textSize(80);
  text("Score : " +score,width/3-40,height/2+40);
  
  if ((width/3-160<mouseX)&&(mouseX<width/3+160)&&
    (height*3/4-60<mouseY)&&(mouseY<height*3/4)) {
    textSize(50);
    text("Next Stage", width/3-150, height*3/4);
  } else {
    textSize(60);
    text("Next Stage", width/3-150, height*3/4);
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
