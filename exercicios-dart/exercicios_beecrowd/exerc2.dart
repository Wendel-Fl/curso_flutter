import 'dart:io';

void main(List<String> args) {
  String a = (stdin.readLineSync()).toString();
  String b = (stdin.readLineSync()).toString();

  int aNovo = int.parse(a);
  int bNovo = int.parse(b);

  int soma = aNovo + bNovo;

  print('SOMA = ${soma}');
}
