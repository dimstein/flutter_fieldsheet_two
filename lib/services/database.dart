import 'package:flutter_fieldsheet/models/odour.dart';
import 'package:flutter_fieldsheet/services/firestore_service.dart';

abstract class Database {
  Stream<List<Odour>> odoursStream();

  Stream<Odour> odourStream({String uid});

  Future<void> setOdour(Odour odour);

  Future<String> nextUID();
}

class FirestoreDatabase implements Database {
  final _service = FirestoreService.instance;

  @override
  Stream<List<Odour>> odoursStream() => _service.collectionStream(
        path: 'odour',
        builder: (data) => Odour.fromMap(data),
      );

  @override
  Stream<Odour> odourStream({String uid}) => _service.documentStream(
        path: 'odour/$uid',
        builder: (data) => Odour.fromMap(data),
      );

  @override
  Future<void> setOdour(Odour odour) async => await _service.setOdour(
        path: 'odour/${odour.uid}',
        data: odour.toMap(),
      );

  @override
  Future<String> nextUID() async => await _service.nextUID(path: 'odour');
}
