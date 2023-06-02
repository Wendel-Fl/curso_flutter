import 'dart:io';

void main(List<String> args) {
  print('Digite seu primeiro nome:');
  String? firstName = stdin.readLineSync();

  print('Digite seu segundo nome:');
  String? lastName = stdin.readLineSync();

  print('Seu nome completo é: ${firstName} ' + '${lastName}');
}
