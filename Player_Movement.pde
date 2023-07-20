void Movement() {                              //custom resolution complete
  if (key == 'w') {    //movement up
    y -= d;
  }
  if (key == 's') {  //movement down
    y += d;
  }

  //borders for movement
  if (y <= height/5*4-entitySize-5) {
    wall = false;
  }
  if (wall == true) {
    y = height/5*4-entitySize-5;
  }
  if (y >= 5) {
    wallup = false;
  }
  if (wallup == true) {
    y = 5;
  }
}
