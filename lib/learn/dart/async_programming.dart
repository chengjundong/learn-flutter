void main() {
  printNews();
  printWeather();
  printLotto();
}

void printWeather() {
  print('Weather: 25°C');
}

void printLotto() {
  print('Lotto: 1, 2, 3, 4, 5, 6');
}

void printNews() async {
  print(await _getNews());
}

Future<String> _getNews() {
  return Future.delayed(const Duration(milliseconds: 300), () {
    return 'Juventus news';
  });
}