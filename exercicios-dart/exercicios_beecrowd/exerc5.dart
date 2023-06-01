import 'dart:io';

void main(List<String> args) {
  String valueA = (stdin.readLineSync()).toString();
  String valueB = (stdin.readLineSync()).toString();

  int valueANew = int.parse(valueA);
  int valueBNew = int.parse(valueB);

  int prod = valueANew * valueBNew;

  print('PROD = ${prod}');
}
