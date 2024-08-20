import 'package:clean_code_app/src/features/user/presentation/bloc/user_bloc.dart';
import 'package:clean_code_app/src/features/user/presentation/pages/home_page.dart';
import 'package:clean_code_app/src/features/user/presentation/pages/user_create_page.dart';
import 'package:clean_code_app/src/features/user/presentation/pages/user_list_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;

void main() {
  final http.Client httpClient = http.Client();

  runApp(AppUsers(httpClient: httpClient));
}

class AppUsers extends StatelessWidget {
  final http.Client httpClient;

  const AppUsers({super.key, required this.httpClient});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => UserBloc(httpClient: httpClient),
      child: MaterialApp(
        title: "Cadastro de usuários",
        home: const HomePage(),
        routes: {
          '/create': (context) => UserCreatePage(),
          '/list': (context) => const UserListPage(),
        },
      ),
    );
  }
}
