import 'package:test/test.dart';
import 'package:core/screens/signup.dart';

void main()  {
  group("String", () {
    test('Testing successful login', () async {
      Future<String>response = newUser('Johnny Light', 'johnny@light.com', 'johnnylight', url:'http://localhost:5000/users/register');
      expect(await response, equals('User registered successfully'));
    });

    test('Testing invalid email', () async {
      Future<String>response = newUser('Johnny Light', 'rochapatricia20@gmail.com', 'johnnylight', url:'http://localhost:5000/users/register');
      expect(await response, equals('Email already exists'));
    });
  });
}