// Import the test package and booking clas
import 'package:flutter_test/flutter_test.dart';
import 'package:registration/pages/login_page.dart';
void main() {
  group('login register email password test', () {
    test('Empty email return error string', () {
      var result = EmailFieldValidator.validate('');
      expect(result, 'Email can\'t be empty');
    });
    test('Non empty email return error string', () {
      var result = EmailFieldValidator.validate('anup@gmail.com');
      expect(result, null);
    });
    // It test if password is empty or not
    test('Empty password return error string', () {
      var result = PasswordValidator.validate('');
      expect(result, 'Password can\'t be empty');
    });
    test('Non empty password return error string', () {
      var result = PasswordValidator.validate('anup@123');
      expect(result, null);
    });
  });
  // It test if email is empty or not
}