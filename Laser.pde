void Laser() {                                                         //custom resolution complete
  fill (#FF0000);  //red
  if (lx >= 161){
  rect (lx, ly, width/20, width/125);  //laser
  }

  if (status == 0 && mousePressed && (mouseButton == LEFT)) {
    shot = true;
  }
  if (shot == true) {
    lx = lx + speed * laserspeed;
  }
  if (lx > width) {
    lx = 160;
    shot = false;
  }
  if (lx == 160) {
    ly = y + entitySize/2; 
  }
  if (status == 0 && mousePressed && (mouseButton == LEFT) && !laserfire.isPlaying()) {  //so that sound effect doesnt repeat, because the sound would loop at the same time producing lag and it wouldnt sound good
    laserfire.play();
  }
}
