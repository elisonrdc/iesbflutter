import 'package:flutter/material.dart';

class ItemLocation extends StatelessWidget {

  final String id;
  final String name;
  final String type;
  final String dimension;

  const ItemLocation({super.key, required this.id, required this.name, required this.type, required this.dimension});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(5),
          child: Text('ID: $id'),
        ),
        Padding(
          padding: const EdgeInsets.all(5),
          child: Text('Nome: $name'),
        ),
        Padding(
          padding: const EdgeInsets.all(5),
          child: Text('Tipo: $type'),
        ),
        Padding(
          padding: const EdgeInsets.all(5),
          child: Text('Dimensão: $dimension'),
        ),
      ],
    );
  }
}