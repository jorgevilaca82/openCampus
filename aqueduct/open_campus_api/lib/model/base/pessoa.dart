import 'package:open_campus_api/model/base/pessoa_fisica.dart';

import '../../open_campus_api.dart';

class Pessoa extends ManagedObject<_Pessoa> implements _Pessoa {}

class _Pessoa {
  @primaryKey
  int id;

  PessoaFisica pessoaFisica;

  // https://aqueduct.io/docs/db/json_columns/
  Document telefones;

  Document documentos;

  ManagedSet<Endereco> enderecos;
}

enum EnderecoTipo {
  residencial,
  comercial,
  rural
}

class Endereco extends ManagedObject<_Endereco> implements _Endereco {}

class _Endereco {
  @primaryKey
  int id;
  
  @Column()
  String cep;
  
  EnderecoTipo tipo;

  @Relate(#endereco)
  Pessoa pessoa;
}