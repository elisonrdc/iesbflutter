import 'package:iesbflutter/models/character_model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

class CharacterService {

  final uriBase = 'rickandmortyapi.com';

  Future<List<Character>> fetchCharacters(int page) async {

    var url = Uri.https(uriBase, '/api/character', {'page':page.toString()});
    var response = await http.get(url);
    var characters = <Character>[];

    if (response.statusCode == 200) {
      var charactersJson = convert.jsonDecode(response.body);
      for(var characterJson in charactersJson['results']) {
        characters.add(Character.fromJson(characterJson));
      }
    } else {
      print('Falha na solicitação com status: ${response.statusCode}.');
    }

    return characters;
  }

}