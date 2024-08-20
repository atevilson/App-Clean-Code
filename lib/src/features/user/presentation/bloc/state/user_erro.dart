import 'package:clean_code_app/src/features/user/presentation/bloc/state/user_state.dart';

class UserErro extends UserState {
  final String message;

  UserErro({required this.message});

  @override
  List<Object> get props => [message];
}
