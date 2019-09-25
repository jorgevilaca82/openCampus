import 'package:aqueduct/aqueduct.dart';
import 'package:open_campus_api/open_campus_api.dart';
import 'package:open_campus_api/model/base/pessoa.dart';

class PessoaEnderecoController extends ManagedObjectController<Endereco> {
  PessoaEnderecoController(ManagedContext context) : super(context);

  Query<Endereco> beforeFind(Query<Endereco> query) {
    final int pessoaId = int.tryParse(request.path.variables['pessoaId']);
    query.where((o) => o.pessoa.id).equalTo(pessoaId);
    return query;
  }

  @override
  FutureOr<Query<Endereco>> willFindObjectWithQuery(Query<Endereco> query) {
    return super.willFindObjectWithQuery(beforeFind(query));
  }

  @override
  FutureOr<Query<Endereco>> willFindObjectsWithQuery(Query<Endereco> query) {
    // TODO: implement willFindObjectsWithQuery
    return super.willFindObjectsWithQuery(beforeFind(query));
  }
}