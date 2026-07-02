import 'package:flutter_test/flutter_test.dart';
import 'package:api_integration_testing/models/user_model.dart'; // TODO: replace with your pubspec.yaml "name:"

void main() {
  test('UserModel.fromJson converts JSON into UserModel object', () {
    final json = {
      'id': 1,
      'name': 'Leanne Graham',
      'email': 'leanne@example.com',
    };

    final user = UserModel.fromJson(json);

    expect(user.id, 1);
    expect(user.name, 'Leanne Graham');
    expect(user.email, 'leanne@example.com');
  });

  test('UserModel.fromJson handles a second user correctly', () {
    final json = {
      'id': 2,
      'name': 'Ervin Howell',
      'email': 'ervin@example.com',
    };

    final user = UserModel.fromJson(json);

    expect(user.id, 2);
    expect(user.name, isNotEmpty);
    expect(user.email, contains('@'));
  });
}
