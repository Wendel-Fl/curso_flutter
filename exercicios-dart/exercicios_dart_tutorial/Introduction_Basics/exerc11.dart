import 'dart:io';

void main(List<String> args) {
  double totalBill = double.parse(stdin.readLineSync()!);
  int numberPeople = int.parse(stdin.readLineSync()!);

  double totalPerPerson = totalBill / numberPeople;

  print('O valor da conta por pessoa ficou ${(totalPerPerson).toStringAsFixed(2)}');
}