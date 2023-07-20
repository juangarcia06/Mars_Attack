void Enemy() {
  for (int i = 0; i<=aliencount; i++) {
    image(enemy, alienx[i], alieny[i], entitySize, entitySize);
    if (alienx[i] <= 0-width/10) {
      alienreset[i] = true;
    }
    alienx[i] -= speed * 8;
    //hitbox detection with laser
    if (lx > alienx[i] && lx< alienx[i] + entitySize && ly > alieny[i] && ly < alieny[i] + entitySize) {
      alienreset[i] = true;
      coins++;
    }

    
    if (alienx[i] >= playerx && alienx[i] <= playerx +width/25*2+10 && y >= alieny[i] && y <= alieny[i] + width/25*2) {
      status = 2;
      alienreset[i] = true;
    }
    if (playerx+10 > alienx[i] && playerx+10 < alienx[i] + entitySize && alieny[i] > y && alieny[i] < y + entitySize) {
      status = 2;
      alienreset[i] = true;
    }
    if (alienreset[i] == true) {
      alienx[i] = int(random(width, width*2));
      alieny[i] = int(random(20, height/5*4-entitySize));
      alienreset[i] = false;
    }
  }
}
