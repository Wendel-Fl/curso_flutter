import 'dart:io';

void main(List<String> args) {
  int num1 = int.parse(stdin.readLineSync()!);
  int num2 = int.parse(stdin.readLineSync()!);

  print('O valor de num1 é ${num1} e o valor de num2 é ${num2}');

  int aux = num1;
  num1 = num2;
  num2 = aux;

  print('O valor de num1 é ${num1} e o valor de num2 é ${num2}');
}
