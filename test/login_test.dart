import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:registration/pages/loginform.dart';
void main() {
  group("Login Form Widget Test", () {
    testWidgets('Check For Empty field error', (WidgetTester tester) async {
      // ignore: todo
      // TODO: Implement test
      // find text field
      final emailField = find.byKey(const ValueKey('emailFieldKey'));
      final passwordField = find.byKey(const ValueKey('passwordFieldKey'));
      // execute test
      await tester.pumpWidget(const MaterialApp(home: LoginForm()));
      await tester.enterText(emailField, "");
      await tester.enterText(passwordField, "");
      await tester.tap(find.byKey(const ValueKey('loginButtonKey')));
      await tester.pump();
      // check result
      expect(find.text('Please Enter Your Email or Username'), findsOneWidget);
      expect(find.text('Password is required for login'), findsOneWidget);
    });
    testWidgets('Testing Password Field validation',
        (WidgetTester tester) async {
      // ignore: todo
      // TODO: Implement test
      // find text field
      final emailField = find.byKey(const ValueKey('emailFieldKey'));
      final passwordField = find.byKey(const ValueKey('passwordFieldKey'));
      // execute test
      await tester.pumpWidget(const MaterialApp(home: LoginForm()));
      await tester.enterText(emailField, "asdfdasf");
      await tester.enterText(passwordField, "asf");
      await tester.tap(find.byKey(const ValueKey('loginButtonKey')));
      await tester.pump();
      // check result
      expect(
          find.text('Enter Valid Password(Min. 6 Character)'), findsOneWidget);
    });
  });
}