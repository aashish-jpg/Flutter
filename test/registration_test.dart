import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:registration/pages/registrationform.dart';
void main() {
  group("Register Form Widget Test", () {
    testWidgets('Check if all Fields and Button are built',
        (WidgetTester tester) async {
      // ignore: todo

      // find text field
      final firstNameField = find.byKey(const ValueKey('firstNameKey'));
      final lastNameField = find.byKey(const ValueKey('lastNameKey'));
      final userNameField = find.byKey(const ValueKey('usernameKey'));
      final passwordField = find.byKey(const ValueKey('passwordKey'));
      final confirmPasswordField = find.byKey(const ValueKey('confirmPasswordKey'));
      final regButton = find.byKey(const ValueKey('regButtonKey'));
      // execute test
      await tester.pumpWidget(const MaterialApp(home: RegistrationForm()));
      await tester.pump();
      // check result
      expect(firstNameField, findsOneWidget);
      expect(lastNameField, findsOneWidget);
      expect(userNameField, findsOneWidget);
      expect(passwordField, findsOneWidget);
      expect(confirmPasswordField, findsOneWidget);
      expect(regButton, findsOneWidget);
    });
    testWidgets('Check if no error message is shown after built',
        (WidgetTester tester) async {
      // ignore: todo
      // TODO: Implement test
      // execute test
      await tester.pumpWidget(const MaterialApp(home: RegistrationForm()));
      await tester.pump();
      // check result
      expect(find.text("Password is required for login"), findsNothing);
      expect(find.text("Enter Valid Password(Min. 6 Character)"), findsNothing);
      expect(find.text("Last Name cannot be Empty"), findsNothing);
      expect(find.text("Password don't match"), findsNothing);
    });
  });
}