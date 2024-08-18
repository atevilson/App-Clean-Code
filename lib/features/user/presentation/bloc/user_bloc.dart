
import 'dart:convert';

import 'package:clean_code_app/features/user/data/models/user.dart';
import 'package:clean_code_app/features/user/presentation/bloc/event/user_create_req.dart';
import 'package:clean_code_app/features/user/presentation/bloc/event/user_event.dart';
import 'package:clean_code_app/features/user/presentation/bloc/event/user_list_requested.dart';
import 'package:clean_code_app/features/user/presentation/bloc/state/user_created.dart';
import 'package:clean_code_app/features/user/presentation/bloc/state/user_erro.dart';
import 'package:clean_code_app/features/user/presentation/bloc/state/user_initial.dart';
import 'package:clean_code_app/features/user/presentation/bloc/state/user_loaded.dart';
import 'package:clean_code_app/features/user/presentation/bloc/state/user_loading.dart';
import 'package:clean_code_app/features/user/presentation/bloc/state/user_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;


class UserBloc extends Bloc<UserEvent, UserState> {
  final http.Client httpClient;

  UserBloc({required this.httpClient}) : super(UserInitial());

  Stream<UserState> mapEventToState(UserEvent event) async* {
    if (event is UserCreateReq) {
      yield UserLoading();
      try {
        final response = await httpClient.post(
          Uri.parse('http://localhost:5000/api/usuarios'),
          headers: {'Content-Type': 'application/json'},
          body: jsonEncode({'name': event.name, 'email': event.email}),
        );

        if (response.statusCode == 200) {
          final user = jsonDecode(response.body);
          yield UserCreated(user: User.fromJson(user));
        } else {
          yield UserErro(message: "Falha ao criar usuário");
        }
      } catch (e) {
        yield UserErro(message: e.toString());
      }
    }
    if (event is UserListRequested) {
      yield UserLoading();
      try {
        final response = await httpClient.get(Uri.parse('http://localhost:5000/api/usuarios'),
        );
        if (response.statusCode == 200) {
          final List<dynamic> usersJson = jsonDecode(response.body);
          final users = usersJson.map((json) => User.fromJson(json)).toList();
          yield UserLoaded(users: users);
        } else {
          yield UserErro(message: "Falha ao carregar usuários");
        }
      }
      catch (e) {
        yield UserErro(message: e.toString());
      }
    }
  }
}