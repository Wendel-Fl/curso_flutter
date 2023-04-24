imprimirPrduto(qtd, {String? nome, double? preco}) {
  for (var i = 0; i < qtd; i++) {
    print('O produto ${nome} custa R\$ ${preco}');    
  }
}

class Produto {
  String? nome;
  double? preco;

  // Produto(this.nome, this.preco);
  Produto({this.nome, this.preco});

  // Produto(String nome, double preco) {
  //   this.nome = nome;
  //   this.preco = preco;
  // }
}

main() {
  // var p1 = new Produto('Caneta', 4.99);
  // Na versão 2.0 do Dart, o new é opcional
  var p1 = Produto(nome: 'Caneta', preco: 4.99);
  var p2 = Produto(nome: 'Lapiseira', preco: 5.99);
  // p1.nome = 'Lápis';
  // p1.preco = 4.35;

  // print('O produto ${p1.nome} custa R\$ ${p1.preco}');
  // print('O produto ${p2.nome} custa R\$ ${p2.preco}');

  imprimirPrduto(1, preco: p1.preco, nome: p1.nome);
  imprimirPrduto(20, preco: p2.preco, nome: p2.nome);
}
