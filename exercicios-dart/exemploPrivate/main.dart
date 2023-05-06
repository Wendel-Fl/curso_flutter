import './pessoa.dart';

main() {
  var p1 = Pessoa();
  p1.nome = 'Wendel';
  p1.cpf = '081.748.581-30';

  print('${p1.nome} possui o CPF ${p1.novoCpf}');
}
