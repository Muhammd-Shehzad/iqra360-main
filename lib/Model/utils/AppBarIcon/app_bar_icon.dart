import 'package:flutter/material.dart';

class AppBarIcon extends StatelessWidget {
  final icon;
  final onPressed;
  const AppBarIcon({super.key, this.icon, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 10),
      child: InkWell(onTap: onPressed, child: Icon(icon, color: Colors.white)),
    );
  }
}
