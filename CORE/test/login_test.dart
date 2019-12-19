import 'package:test/test.dart';
import 'package:core/screens/login.dart';

void main()  {
  test('Testing successful login', () async {
    Future<String> response = logUser('rochapatricia20@gmail.com', 'testing123');
    String msg = await response;
    expect(msg, equals('User logged in successfully.'));
  });
}