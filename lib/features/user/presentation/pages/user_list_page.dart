import 'package:clean_code_app/features/user/presentation/bloc/event/user_list_requested.dart';
import 'package:clean_code_app/features/user/presentation/bloc/state/user_erro.dart';
import 'package:clean_code_app/features/user/presentation/bloc/state/user_loaded.dart';
import 'package:clean_code_app/features/user/presentation/bloc/state/user_loading.dart';
import 'package:clean_code_app/features/user/presentation/bloc/state/user_state.dart';
import 'package:clean_code_app/features/user/presentation/bloc/user_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UserListPage extends StatelessWidget {
  const UserListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Consultar usuários"),
      ),
      body: BlocBuilder<UserBloc, UserState>(
        builder: (context, state) {
          if (state is UserLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is UserLoaded) {
            return ListView.builder(
              itemCount: state.users.length,
              itemBuilder: (_, index) {
                final user = state.users[index];
                return ListTile(
                  title: Text(user.name),
                  subtitle: Text(user.email),
                );
              },
            );
          } else if (state is UserErro) {
            return Center(
              child: Text(state.message),
            );
          }
          return const Center(
            child: Text("Usuários não cadastrados"),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          BlocProvider.of<UserBloc>(context).add(UserListRequested());
        },
        child: const Icon(Icons.refresh),
      ),
    );
  }
}
