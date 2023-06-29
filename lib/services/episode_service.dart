import 'package:iesbflutter/models/episode_model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

class EpisodeService {

  final uriBase = 'rickandmortyapi.com';

  Future<List<Episode>> fetchEpisodes(int page) async {

    var url = Uri.https(uriBase, '/api/episode', {'page':page.toString()});
    var response = await http.get(url);
    var episodes = <Episode>[];

    if (response.statusCode == 200) {
      var episodesJson = convert.jsonDecode(response.body);
      for(var episodeJson in episodesJson['results']) {
        episodes.add(Episode.fromJson(episodeJson));
      }
    } else {
      print('Falha na solicitação com status: ${response.statusCode}.');
    }

    return episodes;
  }

}