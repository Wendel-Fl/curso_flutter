import 'dart:io';
import 'dart:math';

void main(List<String> args) {
  int? number = int.parse(stdin.readLineSync()!);

  print('A raiz de ${number} é ${sqrt(number)}');
}
