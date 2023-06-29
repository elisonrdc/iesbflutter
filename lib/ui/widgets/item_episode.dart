import 'package:flutter/material.dart';

class ItemEpisode extends StatelessWidget {

  final String id;
  final String name;
  final String airDate;
  final String episode;

  const ItemEpisode({super.key, required this.id, required this.name, required this.airDate, required this.episode});

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
          child: Text('Data de Exibição: $airDate'),
        ),
        Padding(
          padding: const EdgeInsets.all(5),
          child: Text('Episódio: $episode'),
        ),
      ],
    );
  }
}