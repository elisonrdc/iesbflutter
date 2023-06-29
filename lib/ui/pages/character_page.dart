import 'package:flutter/material.dart';
import 'package:iesbflutter/models/character_model.dart';
import 'package:iesbflutter/ui/widgets/row_detail_character.dart';

class CharacterPage extends StatelessWidget {

  final Character character;
  const CharacterPage({Key? key, required this.character}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text(character.name),
        centerTitle: true,
      ),
      body: SizedBox(
        height: double.infinity,
        width: double.infinity,
        child: Column(
          children: [
            SizedBox(
              height: size.height * 0.4,
              width: double.infinity,
              child: Hero(
                tag: character.id,
                child: Image.network(
                  character.image,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.all(12),
              width: double.infinity,
              child: Column(
                children: [
                  Row(
                    children: [
                      RowDetailCharacter(label: 'Situação', value: character.status),
                      RowDetailCharacter(label: 'Espécie', value: character.species),
                    ],
                  ),
                  Row(
                    children: [
                      RowDetailCharacter(label: 'Tipo', value: character.type),
                      RowDetailCharacter(label: 'Gênero', value: character.gender),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}