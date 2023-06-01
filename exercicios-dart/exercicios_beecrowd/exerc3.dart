import 'dart:io';
import 'dart:math';

void main(List<String> args) {
  String raioOld = stdin.readLineSync().toString();
  const PI = 3.14159;
  double raioNew = double.parse(raioOld);
  double area = (pow(raioNew, 2) * PI);

  print('A=${area.toStringAsFixed(4)}');
}
