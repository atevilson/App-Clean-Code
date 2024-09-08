
import 'package:clean_code_app/src/app/widgets/custom_icons.dart';
import 'package:clean_code_app/src/app/widgets/item_menu.dart';
import 'package:clean_code_app/src/features/user/presentation/pages/user_create_page.dart';
import 'package:clean_code_app/src/features/user/presentation/pages/user_list_page.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {

    double imgContatoFlex = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        title:  const Text("Agenda de contatos",
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: Center(
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: ColorFiltered(
                  colorFilter: ColorFilter.mode(Colors.white70.withOpacity(0.2), BlendMode.lighten),
                  child: Image.asset(
                    'images/contato.png',
                    width: (imgContatoFlex * 33.0),
                  ),
                ),
              ),
            ),
          ),
          Padding(
              padding: const EdgeInsets.all(15.0),
              child: SizedBox(
                height: 100,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: <Widget> [
                    MenuItem(
                      "Contatos", 
                      CustomIcons.contatos,
                      onClick: () => _userListPage(context),
                    ),
                    MenuItem(
                      "Criar contato",
                      CustomIcons.criarContato,
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

