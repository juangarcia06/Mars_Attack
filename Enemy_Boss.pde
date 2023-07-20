void EnemyBoss() {
  image(boss, alienx3, alieny3, width/25*3, entitySize);
  if (alienx3 <= 0-100) {
    alienreset3 = true;
  }
  if (alive == true) {
    alienx3 -= speed * 4;
  }
  //hitbox detection with laser
  if (lx > alienx3 && lx< alienx3 + width/25*3 && ly > alieny3 && ly < alieny3 + entitySize) {
    lx = 160;
    shot = false;
    bosslifes++;
  }

  if (bosslifes == 3) {
    alienreset3 = true;
    coins += int(random(10, 25));
    lx = 160;
    shot = false;
    bosslifes = 0;
  }
  if (alienx3 >= playerx && alienx3 <= playerx + width/25*2+10 && y >= alieny3 && y <= alieny3 + width/25*2) {
    status = 2;
    alienreset3 = true;
  }
  if (playerx+10 > alienx3 && playerx+10 < alienx3 + entitySize && alieny3 > y && alieny3 < y + entitySize) {
      status = 2;
      alienreset3 = true;
    }
  if (alienreset3 == true) {
    alienx3 = int(random(width*6, width*8));
    alieny3 = int(random(80, height/5*4-entitySize));
    alienreset3 = false;
  }
}
