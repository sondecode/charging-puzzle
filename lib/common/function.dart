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
