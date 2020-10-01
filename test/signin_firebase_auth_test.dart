import 'package:firebase_auth_mocks/firebase_auth_mocks.dart';
import 'package:flutter_test/flutter_test.dart';

main() {
  group('firestore Auth test', () {
    final auth = MockFirebaseAuth();

    test('find the user displayName', () {
      auth
          .signInWithEmailAndPassword(
              email: 'test@test.com', password: '123456')
          .then((value) => expect(value.user.displayName, 'Bob'));
    });

    test('find the user uid', () {
      auth
          .signInWithEmailAndPassword(
              email: 'test@test.com', password: '123456')
          .then((value) => expect(value.user.uid, 'aabbcc'));
    });
  });
}
