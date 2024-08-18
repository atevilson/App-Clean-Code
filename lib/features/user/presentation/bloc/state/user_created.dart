
import 'package:clean_code_app/features/user/presentation/bloc/state/user_state.dart';

class UserCreated extends UserState {
  final UserCreated user;

  UserCreated({required this.user});

  @override
  List<Object> get props => [user];
}