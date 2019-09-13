import 'package:open_campus_api/model/base/pessoa_fisica.dart';

import '../../open_campus_api.dart';

class Pessoa extends ManagedObject<_Pessoa> implements _Pessoa {}

class _Pessoa {
  @primaryKey
  int id;

  PessoaFisica pessoaFisica;
}
