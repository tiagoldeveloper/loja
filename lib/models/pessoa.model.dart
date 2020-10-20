class PessoaModel {
  int id;
  String nome = "";
  String cpf = "";
  String celular = "";
  String telefone = "";
  String email = "";
  String cep = "";
  String numero = "";
  String rua = "";
  String bairro = "";
  String cidade = "";
  String uf = "";
  int tipoPessoa; //pessoa fisica 1 e juridica 2

  PessoaModel({
    this.id = 0,
    this.nome,
    this.cpf,
    this.celular,
    this.telefone,
    this.email,
    this.cep,
    this.numero,
    this.rua,
    this.bairro,
    this.cidade,
    this.uf,
    this.tipoPessoa = 1,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'nome': nome,
      'cpf': cpf,
      'celular': celular,
      'telefone': telefone,
      'email': email,
      'cep': cep,
      'numero': numero,
      'rua': rua,
      'bairro': bairro,
      'cidade': cidade,
      'uf': uf,
      'tipoPessoa': tipoPessoa,
    };
  }
}

enum TipoPessoa {
  fisica,
  juridica,
}
