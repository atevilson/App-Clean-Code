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
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Material(
        child: InkWell(
          onTap: () => onClick(),
          child: Container(
            decoration: const BoxDecoration(boxShadow: [
              BoxShadow(
                  color: Colors.black12,
                  spreadRadius: 5,
                  blurRadius: 4,
                  offset: Offset(0, 5),
                  blurStyle: BlurStyle.outer)
            ]),
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
