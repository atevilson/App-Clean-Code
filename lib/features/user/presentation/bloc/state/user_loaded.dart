
import 'package:clean_code_app/features/user/data/models/user.dart';
import 'package:clean_code_app/features/user/presentation/bloc/state/user_state.dart';

class UserLoaded extends UserState {
  final List<User> users;

  UserLoaded({required this.users});

  @override
  List<Object> get props => [users];
}