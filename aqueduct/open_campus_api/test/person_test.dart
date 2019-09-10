import 'package:open_campus_api/model/base/person.dart';

import 'harness/app.dart';

void main() {
  final harness = Harness()..install();

  test('insert new person', () async {
    final query = Query<Person>(harness.application.channel.context)
      ..values.name = "Adam";

    final person = await query.insert();

    expect(person.id, isNotNull);
  });
}
