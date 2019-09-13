import 'package:open_campus_api/model/base/pessoa_fisica.dart';

import 'harness/app.dart';

void main() {
  final harness = Harness()..install();

  test('inseri uma nova pessoa fisica', () async {
    final query = Query<PessoaFisica>(harness.application.channel.context)
      ..values.nome = "Adam"
      ..values.cpf = "70434239291";

    final pessoaFisica = await query.insert();

    expect(pessoaFisica.id, isNotNull);
  });
}
