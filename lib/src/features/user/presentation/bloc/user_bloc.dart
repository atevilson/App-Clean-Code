
import 'dart:io';

import 'package:clean_code_app/src/features/user/domain/usecases/create_user_usecase.dart';
import 'package:clean_code_app/src/features/user/domain/usecases/list_user_usecase.dart';
import 'package:clean_code_app/src/features/user/presentation/bloc/event/user_create_req.dart';
import 'package:clean_code_app/src/features/user/presentation/bloc/event/user_event.dart';
import 'package:clean_code_app/src/features/user/presentation/bloc/event/user_list_requested.dart';
import 'package:clean_code_app/src/features/user/presentation/bloc/state/user_created.dart';
import 'package:clean_code_app/src/features/user/presentation/bloc/state/user_erro.dart';
import 'package:clean_code_app/src/features/user/presentation/bloc/state/user_initial.dart';
import 'package:clean_code_app/src/features/user/presentation/bloc/state/user_loaded.dart';
import 'package:clean_code_app/src/features/user/presentation/bloc/state/user_loading.dart';
import 'package:clean_code_app/src/features/user/presentation/bloc/state/user_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  final CreateUserUsecase createUserUsecase;
  final ListUserUsecase listUserUsecase;

  UserBloc({required this.createUserUsecase, required this.listUserUsecase})
      : super(UserInitial()) {
    on<UserCreateReq>(
      (event, emit) async {
        emit(UserLoading());
        try {
          final user = await createUserUsecase.execute(
              name: event.name, email: event.email, phone: event.phone);
          emit(UserCreated(user: user));
        } on SocketException {
          emit(
            UserErro(
                message: "Servidor offline...",
                errorMessageType: ErrorMessageType.createUserErro),
          );
        } catch (e) {
          emit(
            UserErro(
                message: e.toString(),
                errorMessageType: ErrorMessageType.createUserErro),
          );
        }
      },
    );

    on<UserListRequested>(
      (event, emit) async {
        emit(UserInitial());

        emit(UserLoading());
        try {
          final users = await listUserUsecase.execute();
          emit(UserLoaded(users: users));
        } on SocketException {
          emit(
            UserErro(
                message: "Servidor offline...",
                errorMessageType: ErrorMessageType.listUserErro),
          );
        } catch (e) {
          emit(
            UserErro(
                message: e.toString(),
                errorMessageType: ErrorMessageType.listUserErro),
          );
        }
      },
    );
  }
}
