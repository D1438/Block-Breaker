void gameclear_2(){
  textSize(130);
  text("Game Clear!!",135,height/3);
  textSize(80);
  text("Score : " +score,width/3-40,height/2+40);
  text("Score2 : " +score2,width/3-40,height/2+130);
  text("Total : ",width/3-40,height/2+220);
  text(score+score2,width/3+230,height/2+220);

  if ((width/2-30<mouseX)&&(mouseX<width/2+90)&&
    (height*9/10-50<mouseY)&&(mouseY<height*9/10)) {
    textSize(50);
    text("Title", width/2-30, height*9/10);
  } else {
    textSize(60);
    text("Title", width/2-30, height*9/10);
  }
}
