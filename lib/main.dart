import 'package:clean_code_app/src/features/user/domain/usecases/create_user_usecase.dart';
import 'package:clean_code_app/src/features/user/domain/usecases/list_user_usecase.dart';
import 'package:clean_code_app/src/features/user/presentation/bloc/user_bloc.dart';
import 'package:clean_code_app/src/features/user/presentation/pages/home_page.dart';
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
      create: (BuildContext context) => UserBloc(createUserUsecase: CreateUserUsecase(httpClient), listUserUsecase: ListUserUsecase(httpClient)),
      child: MaterialApp(
        title: "Cadastro de contatos",
        home: const HomePage(),
        theme: ThemeData(
          scaffoldBackgroundColor: Colors.white70,
          canvasColor: Colors.white12,
          floatingActionButtonTheme: const FloatingActionButtonThemeData(
            backgroundColor: Colors.black45,
            foregroundColor: Colors.white70
          ),
          elevatedButtonTheme:  const ElevatedButtonThemeData(
            style: ButtonStyle(
              backgroundColor: WidgetStatePropertyAll(Colors.black45),
              foregroundColor: WidgetStatePropertyAll(Colors.white70)
            )
          ),
          appBarTheme: const AppBarTheme(
            backgroundColor: Colors.black,
            foregroundColor: Colors.white70,
            titleTextStyle: TextStyle(
              color: Colors.white70,
              fontSize: 24.0,
            )
          ),
          useMaterial3: true
        ),
      ),
    );
  }
}
