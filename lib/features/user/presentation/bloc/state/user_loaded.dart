
import 'package:clean_code_app/features/user/presentation/bloc/state/user_state.dart';

class UserLoaded extends UserState {
  final List<UserLoaded> users;

  UserLoaded({required this.users});

  @override
  List<Object> get props => [users];
}