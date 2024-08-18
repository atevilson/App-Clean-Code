import 'package:clean_code_app/features/user/presentation/bloc/event/user_create_req.dart';
import 'package:clean_code_app/features/user/presentation/bloc/state/user_created.dart';
import 'package:clean_code_app/features/user/presentation/bloc/state/user_erro.dart';
import 'package:clean_code_app/features/user/presentation/bloc/state/user_state.dart';
import 'package:clean_code_app/features/user/presentation/bloc/user_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UserCreatePage extends StatelessWidget {
  UserCreatePage({super.key});

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text("Cadastrar usuários",
        style: TextStyle(
          fontSize: 22.0,
          fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),
      body: BlocListener<UserBloc, UserState>(
        listener: (context, state) {
          if (state is UserCreated) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text("Usuário criado com sucesso"),
              ),
            );
          } else if (state is UserErro) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(state.message),
              ),
            );
          }
        },
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: _nameController,
                decoration: const InputDecoration(labelText: "Nome"),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: _emailController,
                decoration: const InputDecoration(labelText: "Email"),
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                final name = _nameController.text;
                final email = _emailController.text;
                if (name.isNotEmpty && email.isNotEmpty) {
                  BlocProvider.of<UserBloc>(context).add(
                  UserCreateReq(name: name, email: email),
                );
                }
              },
              child: const Text("Add"),
            ),
          ],
        ),
      ),
    );
  }
}
