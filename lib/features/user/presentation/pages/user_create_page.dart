
import 'package:clean_code_app/features/user/presentation/bloc/event/user_create_req.dart';
import 'package:clean_code_app/features/user/presentation/bloc/state/user_created.dart';
import 'package:clean_code_app/features/user/presentation/bloc/state/user_erro.dart';
import 'package:clean_code_app/features/user/presentation/bloc/state/user_state.dart';
import 'package:clean_code_app/features/user/presentation/bloc/user_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UserCreatePage extends StatelessWidget{
    UserCreatePage({super.key});

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Adicionar usuários"),
      ),
      body: Column(
        children: [
          TextField(
            controller: _nameController,
            decoration: const InputDecoration(labelText: "Nome"),
          ),
          TextField(
            controller: _emailController,
            decoration: const InputDecoration(labelText: "Email"),
          ),
          const SizedBox(height: 20),
          ElevatedButton(onPressed: () => _addUser,
            child: const Text("Criar Usuario"),
          )
        ],
      ),
    );
  }

  void _addUser(BuildContext context) {
    final name = _nameController.text;
    final email = _emailController.text;
    BlocProvider.of<UserBloc>(context).add(UserCreateReq(
      name: name, 
      email: email),
    );
    BlocListener<UserBloc, UserState>(
      listener: (_, state) {
        if (state is UserCreated) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text("Usuário criado com sucesso"),
            ),
          );
        } else if (state is UserErro) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text("Erro ao cadastrar usuário"),
            ),
          );
        }
      },
    );
  }
}