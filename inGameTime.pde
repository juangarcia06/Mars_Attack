void timeInGame(){               //custom resolution complete
  if (status == 0){
  IGT++;
  }
  if (IGT >= 60){
    time++;
    IGT = 0;
  }
  
  if (time >= 30){
    aliencount++;
    time = 0;
  }
}
