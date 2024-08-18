
import 'package:clean_code_app/features/user/data/models/user.dart';
import 'package:clean_code_app/features/user/presentation/bloc/state/user_state.dart';

class UserCreated extends UserState {
  final User user;

  UserCreated({required this.user});

  @override
  List<Object> get props => [user];
}