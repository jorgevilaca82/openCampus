import '../../open_campus_api.dart';

class Person extends ManagedObject<_Person> implements _Person {}

class _Person {
  @primaryKey
  int id;

  @Column(indexed: true)
  String name;
}
