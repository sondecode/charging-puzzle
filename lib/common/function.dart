bool mapsEqual(List<List<String>> a, List<List<String>> b) {
  if (a.length != b.length) return false;
  for (int i = 0; i < a.length; i++) {
    if (a[i].length != b[i].length) return false;
    for (int j = 0; j < a[i].length; j++) {
      if (a[i][j] != b[i][j]) return false;
    }
  }
  return true;
}

bool checkMap(List<List<String>> map1, List<List<String>> map2) {
  if (map1.length != map2.length) return false;

  for (int i = 0; i < map1.length; i++) {
    if (map1[i].length != map2[i].length) return false;

    for (int j = 0; j < map1[i].length; j++) {
      if (map1[i][j] == "0" || map2[i][j] == "0") continue;
      if (map1[i][j] != map2[i][j]) return false;
    }
  }
  return true;
}

bool isCar(String letterToCheck) {
  final letters = ["C", "T", "B"];
  return letters.contains(letterToCheck);
}
