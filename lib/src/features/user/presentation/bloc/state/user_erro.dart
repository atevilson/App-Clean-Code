import 'package:clean_code_app/src/features/user/presentation/bloc/state/user_state.dart';

class UserErro extends UserState {
  final String message;
  final ErrorMessageType errorMessageType;

  UserErro({required this.message, required this.errorMessageType});

  @override
  List<Object> get props => [message, errorMessageType];
}

enum ErrorMessageType {
  createUserErro,
  listUserErro
}