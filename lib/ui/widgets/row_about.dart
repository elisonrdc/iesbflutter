import 'package:flutter/material.dart';

class RowAbout extends StatelessWidget {

  final IconData? icon;
  final String text;
  final double? fontSize;

  const RowAbout({super.key, this.icon, required this.text, this.fontSize = 14});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon),
        Padding(padding: EdgeInsets.all(5)),
        Flexible(child: Text(text, style: TextStyle(fontSize: fontSize)))
      ],
    );
  }
}