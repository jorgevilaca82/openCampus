import 'package:open_campus_api/open_campus_api.dart';
import 'package:cpf/cpf.dart';
import 'pessoa.dart';

class ValidateCpf extends Validate {
  const ValidateCpf({bool onUpdate = true, bool onInsert = true})
      : super(onUpdate: onUpdate, onInsert: onInsert);

  @override
  void validate(ValidationContext ctx, dynamic value) {
    if (!validarCPF(value.toString())) ctx.addError("CPF inválido");
  }
}

enum EstadoCivil {
  Solteiro, Casado, Divorciado, UniaoEstavel
}

class PessoaFisica extends ManagedObject<_PessoaFisica>
    implements _PessoaFisica {}

class _PessoaFisica {
  @primaryKey
  int id;

  @Column(indexed: true)
  String nome;

  @ValidateCpf()
  @Column(indexed: true)
  String cpf;

  @Validate.oneOf(['M', 'F', 'T', 'I'])
  String sexo;

  EstadoCivil estadoCivil;

  @Relate(#pessoaFisica)
  Pessoa pessoa;
}
