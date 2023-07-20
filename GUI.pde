void GUI() {                        //custom resolution complete
  if (status == 0) {
    speed = width/1000;
    d = width/125;
  }
  if (status == 1) {
    speed = 0;
    d = 0;
    image (name, width/10, width/10, width/10*8, width/10);
  }
  if (status == 2) {
    speed = 0;
    d = 0;
    image (gameover, 0, 0, width, height);
    for (i = 0; i <= 2; i++) {
      alienreset[i] = true;
    }
    aliencount = 2;
  }
  if (status == 2 && spacePressed == true) {
    y = height/2;
    lx = 160;
    shot = false;
    status = 1;
    alienreset3 = true;
    if (ePressed == true){
  ePressed = false;
}
    spacePressed = false;
  }
  if (status == 1 && spacePressed == true) {
    status = 0;
    if (ePressed == true){
  ePressed = false;
}
    spacePressed = false;
  }
  if (status == 3) {
    speed = 0;                      //stops moving entities
    d = 0;                         //stops player movement
    image (paused, width/20*3, width/10, width/10*6, width/10);
  }
  if (status == 0 && spacePressed == true) {
    status = 3;
    if (ePressed == true){
  ePressed = false;
}
    spacePressed = false;
  }
  if (status == 3 && spacePressed == true) {
    status = 0;
    if (ePressed == true){
  ePressed = false;
}
    spacePressed = false;
  }
  if (status == 1 && ePressed == true){
    status = 4;
    ePressed = false;
  }
  if (status == 4 && ePressed == true){
    status = 1;
    ePressed = false;
    spacePressed = false;
  }
  if (status == 4){
    speed = 0;
    d = 0;
    y = height/2;
    image (shop, width/10, width/10, width/10*4, width/10);
    
    
    image (shop1, width/10*3, height/2, width/5, width/10);
    image (shop2, width/10*6, height/2, width/5, width/10);
    image (arrow, arrowX, height/40*13, 150, 250);
    
      if (rightMousePressed == true){
        shopSelection++;
        rightMousePressed = false;
      }
      if (shopSelection == 0){
        arrowX = width/40*15;
      }
      if (shopSelection == 1){
        arrowX = width/40*27;
      }
      
      
      if (shopSelection == 2){
        shopSelection = 0;
      }
      if (skin <= 2 && coins >= 50 && shopSelection == 0 && mousePressed && (mouseButton == LEFT)){
      skin++;
      coins -= 50;
      }
      if (laserspeed <= 48 && coins >= 25 && shopSelection == 1 && mousePressed && (mouseButton == LEFT)){
      laserspeed += width/500;
      coins -= 25;
      }

    
    
    
    
    if (skin >= 1){
      s1u = true;
    }
    if (skin >= 2){
      s2u = true;
    }
    if (spacePressed == true){
      skin_state++;
      spacePressed = false;
    }
    if (skin_state == 3){
      skin_state = 0;
    }
  }

  //coins
  fill (#FFFFFF);                      //black
  text("Coins:", width/10*8, height-50);
  text(coins, width/10*9, height-50);
  
  
  
  
}
