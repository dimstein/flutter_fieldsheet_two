import 'package:flutter/material.dart';
import 'package:flutter_fieldsheet/models/odour.dart';
import 'package:flutter_fieldsheet/services/api_path.dart';
import 'package:flutter_fieldsheet/services/firestore_service.dart';

abstract class Database {
  Stream<List<Odour>> odoursStream();

  Stream<List<Odour>> odourStream({@required String odourUID});

  Stream<List<Odour>> filterOdourStream({@required List<String> searchUID});

  Future<void> setOdour(Odour odour);

  Future<void> logOut();

  Future<String> lastUID();
}

class FirestoreDatabase implements Database {
  final _service = FirestoreService.instance;

  @override
  Stream<List<Odour>> odoursStream() => _service.collectionStream(
    path: APIPath.odour(),
    builder: (data) => Odour.fromMap(data),
  );

  @override
  Stream<List<Odour>> odourStream({@required String odourUID}) =>
      _service.docStream(
          path: APIPath.odour(),
          builder: (data) => Odour.fromMap(data),
          docUID: odourUID
      );

  @override
  Future<void> setOdour(Odour odour) async =>
      await _service.setOdour(
        path: 'odour/${odour.uid}',
        data: odour.toMap(),
      );

  @override
  Future<void> logOut() async => await _service.logOut();

  @override
  Future<String> lastUID() async =>
      await _service.lastUID(
          path: APIPath.odour()
      );

  @override
  Stream<List<Odour>> filterOdourStream({List<String> searchUID}) =>
      _service.filteredStream(
          path: APIPath.odour(),
          builder: (data) => Odour.fromMap(data),
          searchedUIDs: searchUID
      );


}
