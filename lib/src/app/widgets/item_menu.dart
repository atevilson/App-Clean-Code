import 'package:flutter/material.dart';

class MenuItem extends StatelessWidget {
  final String name;
  final IconData icon;
  final Function onClick;

  const MenuItem(
    this.name,
    this.icon, {
    super.key,
    required this.onClick,
  });

  @override
  Widget build(BuildContext context) {

    double screenFlex = MediaQuery.of(context).size.width;

    return Padding(
      padding: const EdgeInsets.fromLTRB(15, 30, 45, 20),
      child: Material(
        child: InkWell(
          onTap: () => onClick(),
          child: Container(
            decoration: const BoxDecoration(boxShadow: [
              BoxShadow(
                  color: Colors.black,
                  spreadRadius: 6,
                  blurRadius: 4,
                  offset: Offset.zero,
                  blurStyle: BlurStyle.outer)
            ]),
            padding: const EdgeInsets.all(8.0),
            width: (screenFlex * 0.33),
            child: Row(
              children: <Widget>[
                Expanded(
                  child: Text(
                    name,
                    style: const TextStyle(
                      color: Colors.black87,
                      fontSize: 12.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Icon(
                  icon,
                  color: Colors.black87,
                  size: 33.0,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
