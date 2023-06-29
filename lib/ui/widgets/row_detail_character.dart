import 'package:flutter/material.dart';

class RowDetailCharacter extends StatelessWidget {

  final String label;
  final String value;

  const RowDetailCharacter({super.key, required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child:Padding(
        padding: EdgeInsets.all(15),
        child: Column(
          children: [
            Text('$label:', style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            Text(value),
          ],
        ),
      ),
    );
  }
}