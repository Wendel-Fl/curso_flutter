class Pessoa {
  String? nome;
  String? _cpf;

  set cpf(String novoCpf) {
    this._cpf = novoCpf;
  }

  get novoCpf {
    return _cpf;
  }
}
