import 'package:clean_code_app/src/features/user/presentation/bloc/event/user_event.dart';

class UserCreateReq extends UserEvent {
  final String name;
  final String email;

  UserCreateReq({required this.name, required this.email});

  @override
  List<Object> get props => [name, email];
}
