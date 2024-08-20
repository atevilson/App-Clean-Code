
import 'package:clean_code_app/features/user/presentation/pages/user_create_page.dart';
import 'package:clean_code_app/features/user/presentation/pages/user_list_page.dart';
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

class MenuItem extends StatelessWidget {
  final String name;
  final IconData icon;
  final Function onClick;

  const MenuItem(
    this.name,
    this.icon, {super.key, 
    required this.onClick,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Material(
        child: InkWell(
          onTap: () => onClick(),
          child: Container(
            decoration: const BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Colors.black12,
                  spreadRadius: 5,
                  blurRadius: 4,
                  offset: Offset(0,5),
                  blurStyle: BlurStyle.outer
                )
              ]
            ),
            padding: const EdgeInsets.all(8.0),
            width: 150,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  name,
                  style: const TextStyle(
                    color: Colors.black54,
                    fontSize: 15.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Icon(
                  icon,
                  color: Colors.black54,
                  size: 28.0,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
