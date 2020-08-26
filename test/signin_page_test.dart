import 'package:flutter/material.dart';
import 'package:flutter_fieldsheet/sign_in_page.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('SignIn Page widget test', () {
    testWidgets('Email TextFormField', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(home: SignInPage(appTitle: 'test')),
      );
      expect(find.byKey(Key('emailTFF')), findsOneWidget);
    });

    testWidgets('Password TextFormField', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(home: SignInPage(appTitle: 'test')),
      );
      expect(find.byKey(Key('passwordTFF')), findsOneWidget);
    });

    testWidgets('Login Button', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(home: SignInPage(appTitle: 'test')),
      );
      expect(find.byKey(Key('loginButton')), findsOneWidget);
      expect(find.text('Login'), findsOneWidget);
    });

    testWidgets('Register Button', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(home: SignInPage(appTitle: 'test')),
      );
      expect(find.byKey(Key('registerButton')), findsOneWidget);
    });
  });
}
