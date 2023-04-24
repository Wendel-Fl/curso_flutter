main() {
  /*
    var nomes = ['João', 'Maria', 'José', 'Pedro', 'Ana'];
    nomes.add('Carlos');
    nomes.add('Carlos');
    nomes.add('Carlos');
    print(nomes.length);
    print(nomes.elementAt(0));
    print(nomes[7]);
  */

  /*
    Set<int> conjunto = {0, 1, 2, 3, 4, 4, 4};
    print(conjunto.length);
    print(conjunto is Set);
  */

  /*
    dynamic x = 'Teste';
    x = 123;
    x = false;
    print(x);
  */

  Map<String, double> notasAlunos = {
    'Ana': 9.7,
    'Bia': 9.2,
    'Carlos': 7.8,
    'Daniel': 6.9,
    'Gui': 8.1,
    'Rebeca': 9.6,
  };

  for (var chave in notasAlunos.keys) {
    print('chave = $chave');
  }

  for (var valor in notasAlunos.values) {
    print('valor = $valor');
  }

  for (var registro in notasAlunos.entries) {
    print('${registro.key} = ${registro.value}');
  }
}
