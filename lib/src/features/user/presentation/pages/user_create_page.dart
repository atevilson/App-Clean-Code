import 'package:clean_code_app/src/features/user/presentation/bloc/event/user_create_req.dart';
import 'package:clean_code_app/src/features/user/presentation/bloc/state/user_created.dart';
import 'package:clean_code_app/src/features/user/presentation/bloc/state/user_erro.dart';
import 'package:clean_code_app/src/features/user/presentation/bloc/state/user_state.dart';
import 'package:clean_code_app/src/features/user/presentation/bloc/user_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UserCreatePage extends StatelessWidget {
  UserCreatePage({super.key});

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Adicionar contato",
        ),
      ),
      body: BlocListener<UserBloc, UserState>(
        listener: (context, state) {
          if (state is UserCreated) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text("Contato adicionado com sucesso"),
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
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: _phoneController,
                decoration: const InputDecoration(labelText: "Cell"),
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                _createContact(context);
              },
              child: const Text("Add"),
            ),
          ],
        ),
      ),
    );
  }

  void _createContact(BuildContext context) {
    final name = _nameController.text;
    final email = _emailController.text;
    final phone = _phoneController.text;
    BlocProvider.of<UserBloc>(context).add(
      UserCreateReq(name: name, email: email, phone: phone),
    );
  }
}
