
import 'dart:convert';

import 'package:clean_code_app/src/features/user/data/models/user.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;

class ListUserUsecase {
  final http.Client httpClient;

  ListUserUsecase(this.httpClient);

  Future<List<User>> execute() async {
    final String baseUrl = dotenv.env['API_URL'] ?? 'http://localhost';
    final String port = dotenv.env['API_PORT'] ?? '3000';

    final response = await httpClient.get(Uri.parse('$baseUrl:$port/api/users'),
    );

    if (response.statusCode == 201) {

      final Map<String, dynamic> listEmpty = jsonDecode(response.body);
      final String msg = listEmpty['message'] ?? "Erro desconhecido";
      return throw Exception(msg);
      
    } else if (response.statusCode == 200) {

      final List<dynamic> usersJson = jsonDecode(response.body);
      return usersJson.map((json) => User.fromJson(json)).toList();

    } else {
      return throw Exception("Erro ao consultar contatos");
    }
  }
}