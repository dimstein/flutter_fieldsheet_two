import 'package:flutter_test/flutter_test.dart';
import 'package:cloud_firestore_mocks/cloud_firestore_mocks.dart';
import 'odour_model_mock.dart';

main() {
  group('Test firestore stream for <Odour>', () {
    final instance = MockFirestoreInstance().collection('odour');
    const List<String> _zearch = [
      'ref.text',
      'client.text',
      'site.text',
      'bag1.text',
      'bag2.text',
      'bag3.text',
      'extra1.text',
      'extra2.text',
      'extra3.text',
      'ui.text'
    ];

    OdourMock odourMock = OdourMock(
        reference: 'refTest',
        client: 'clientTest',
        site: 'siteTest',
        spare1: 'spareOne',
        spare2: 'spareTwo',
        spare3: 'spareThree',
        bag1: '1Test',
        bag2: '2Test',
        bag3: '3Test',
        uid: '1000',
        zearch: _zearch);

    instance.add(odourMock.toMap());

    test('Check that it contain something', () {
      instance
          .getDocuments()
          .then((value) => expect(value.documents.length, 1));
    });

    test('Spare3 grab', () {
      instance.getDocuments().then(
          (value) => expect(value.documents.last['spare3'], 'spareThree'));
    });

    test('UID retrieval', () {
      instance.getDocuments().then((value) =>
          expect(value.documents.first['uid'], odourMock.uid.toString()));
    });

    test('grab from Array', () {
      instance.getDocuments().then(
          (value) => expect(value.documents.first['zearch'][3], 'bag1.text'));
    });
  });
}
