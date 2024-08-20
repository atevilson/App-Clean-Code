
import 'package:clean_code_app/src/app/widgets/item_menu.dart';
import 'package:clean_code_app/src/features/user/presentation/pages/user_create_page.dart';
import 'package:clean_code_app/src/features/user/presentation/pages/user_list_page.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black87,
        title:  const Text("Agenda de contatos",
          style: TextStyle(
            color: Colors.white,
            fontSize: 24.0,
          ),
        ),
      ),
      body: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Expanded(
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.all(9.0),
                  child: Image.asset('images/contato.png'),
                ),
              )
              ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: SizedBox(
                height: 100,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: <Widget> [
                    MenuItem("Lista de contatos", 
                    Icons.contact_page, 
                      onClick: () => _userListPage(context),
                    ),
                    MenuItem(
                    'Novo contato',
                    Icons.contact_mail,
                    onClick: () => _userCreatePage(context),
                  ),
                  ],
                ),
              ),
            )
          ],
        ),
      );
  }
//listCreateForm

void _userCreatePage(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => UserCreatePage(),
      ),
    );
  }

  void _userListPage(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) {
          return const UserListPage();
        },
      ),
    );
  }
}

