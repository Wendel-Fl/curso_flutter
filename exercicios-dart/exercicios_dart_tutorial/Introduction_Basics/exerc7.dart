import 'dart:io';

void main(List<String> args) {
  int firstInt = int.parse(stdin.readLineSync()!);
  int seconInt = int.parse(stdin.readLineSync()!);

  int quotient = firstInt ~/ seconInt;
  int remainder = firstInt % seconInt;

  print(quotient);
  print(remainder);
}
