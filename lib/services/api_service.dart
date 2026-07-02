import 'dart:convert';
import 'package:http/http.dart' as http;
import '../../models/user_model.dart';

class ApiService {
  // Working endpoint (Part D)
  static const String usersUrl = 'https://jsonplaceholder.typicode.com/users';

  // Swap the line above for this one when doing the Part G error test:
  // static const String usersUrl = 'https://jsonplaceholder.typicode.com/wrong-url';

  Future<List<UserModel>> fetchUsers() async {
    final url = Uri.parse(usersUrl);

    late final http.Response response;
    try {
      response = await http.get(url);
    } catch (e) {
      // Covers no internet / DNS failure / timeout
      throw Exception('Network error: could not reach the server.');
    }

    if (response.statusCode != 200) {
      throw Exception('Failed to load users (status ${response.statusCode})');
    }

    final List<dynamic> data = jsonDecode(response.body);

    return data.map((json) {
      return UserModel.fromJson(json);
    }).toList();
  }
}
