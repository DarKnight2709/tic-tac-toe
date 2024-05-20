String? checkWinner(List<String> list){
  // checking straight 
  for(int i = 0; i < 3; i++){
    if(list[i * 3] == list[i * 3 + 1] && list[i * 3 + 1] ==  list[i * 3 + 2] && list[i * 3] != ''){
      return list[i * 3];
    } 
    if(list[i] == list[i + 3] && list[i + 3] == list[i + 6] && list[i] != ''){
      return list[i];
    }
    
  }

  //checking 
  if(list[0] == list[4] && list[4] == list[8] && list[0] != ''){
    return list[0];
  }
  if(list[2] == list[4] && list[4] == list[6] && list[2] != ''){
    return list[2];
  }
  return null;
}