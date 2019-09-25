import 'package:open_campus_api/open_campus_api.dart';
import 'package:cpf/cpf.dart';
import 'pessoa.dart';

class ValidateCpf extends Validate {
  const ValidateCpf({bool onUpdate = true, bool onInsert = true})
      : super(onUpdate: onUpdate, onInsert: onInsert);

  @override
  void validate(ValidationContext context, dynamic input) {
    if (!validarCPF(input.toString()))
      context.addError("CPF inválido");
  }
}

enum EstadoCivil {
  solteiro, casado, divorciado, uniaoEstavel
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
