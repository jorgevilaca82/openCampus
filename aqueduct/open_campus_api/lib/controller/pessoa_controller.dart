import 'package:aqueduct/aqueduct.dart';
import 'package:open_campus_api/open_campus_api.dart';
import 'package:open_campus_api/model/base/pessoa.dart';

class PessoaEnderecoController extends ManagedObjectController<Endereco> {
  PessoaEnderecoController(ManagedContext context) : super(context);

  @Bind.path("pessoaId")
  int pessoaId;

  Query<Endereco> beforeFind(Query<Endereco> query) {
    query.where((o) => o.pessoa.id).equalTo(pessoaId);
    logger.info(pessoaId);
    return query;
  }

  @override
  FutureOr<Query<Endereco>> willFindObjectWithQuery(Query<Endereco> query) {
    return beforeFind(query);
  }

  @override
  FutureOr<Query<Endereco>> willFindObjectsWithQuery(Query<Endereco> query) {
    return beforeFind(query);
  }

  @override
  @Operation.get("pessoaId", "id")
  Future<Response> getObject(@Bind.path("id") String id) => super.getObject(id);

  @override
  @Operation.get("pessoaId")
  Future<Response> getObjects({
    @Bind.query("count") int count = 0,
    @Bind.query("offset") int offset = 0,
    @Bind.query("pageBy") String pageBy,
    @Bind.query("pageAfter") String pageAfter,
    @Bind.query("pagePrior") String pagePrior,
    @Bind.query("sortBy") List<String> sortBy}) => super.getObjects(
        count: count,
        offset: offset,
        pageBy: pageBy,
        pageAfter: pageAfter,
        pagePrior: pagePrior,
        sortBy: sortBy
    );

  @override
  @Operation.put("pessoaId", "id")
  Future<Response> updateObject(@Bind.path("id") String id) =>
      super.updateObject(id);

  @override
  @Operation.delete("pessoaId", "id")
  Future<Response> deleteObject(@Bind.path("id") String id) =>
      super.deleteObject(id);

  @override
  @Operation.post("pessoaId")
  Future<Response> createObject() =>
      super.createObject();
}