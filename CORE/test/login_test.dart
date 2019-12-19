import 'package:test/test.dart';
import 'package:core/screens/login.dart';

void main()  {
  group("String", () {
    test('Testing successful login', () async {
      Future<String> response = logUser('rochapatricia20@gmail.com', 'testing123', url:'http://localhost:5000/users/login');
      expect(await response, equals('User logged in successfully.'));
    });

    test('Testing invalid password', () async {
      Future<String> response = logUser('rochapatricia20@gmail.com', 'testing123456', url:'http://localhost:5000/users/login');
      expect(await response, equals('Invalid password'));
    });

    test('Testing invalid email', () async {
      Future<String> response = logUser('rochapatricia@gmail.com', 'testing123', url:'http://localhost:5000/users/login');
      expect(await response, equals('Invalid email'));
    });
  });
}