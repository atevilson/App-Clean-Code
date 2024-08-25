
import 'dart:convert';

import 'package:clean_code_app/src/features/user/data/models/user.dart';
import 'package:http/http.dart' as http;

class CreateUserUsecase {
  final http.Client httpClient;

  CreateUserUsecase(this.httpClient);
  
  Future<User> execute({required String name, required String email}) async {
    final response = await httpClient.post(
      Uri.parse('http://192.168.201.6:5000/api/users'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({'name': name, 'email': email}),
    );

    if (response.statusCode == 200) {
      final user = jsonDecode(response.body);
      return User.fromJson(user);
    } else {
      throw Exception("Falha ao criar contato");
    }
  }
}