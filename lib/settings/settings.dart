const String DATABASE_LOJA = "loja.db";

//Usuário
const String TB_USUARIO = "tb_usuario";
const String CREATE_TB_USUARIO =
    "CREATE TABLE tb_usuario(id INTEGER PRIMARY KEY AUTOINCREMENT, nome TEXT, email TEXT, senha TEXT)";

//Pessoa
const String TB_PESSOA = "tb_pessoa";
const String CREATE_TB_PESSOA =
    "CREATE TABLE tb_pessoa(id INTEGER PRIMARY KEY AUTOINCREMENT, nome TEXT, cpf TEXT, celular TEXT, telefone TEXT, email TEXT, cep TEXT, numero TEXT, rua TEXT, bairro TEXT, cidade TEXT, uf TEXT, tipoPessoa TEXT)";
