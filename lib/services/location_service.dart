import 'package:iesbflutter/models/location_model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

class LocationService {

  final uriBase = 'rickandmortyapi.com';

  Future<List<Location>> fetchLocations(int page) async {

    var url = Uri.https(uriBase, '/api/location', {'page':page.toString()});
    var response = await http.get(url);
    var locations = <Location>[];

    if (response.statusCode == 200) {
      var locationsJson = convert.jsonDecode(response.body);
      for(var locationJson in locationsJson['results']) {
        locations.add(Location.fromJson(locationJson));
      }
    } else {
      print('Falha na solicitação com status: ${response.statusCode}.');
    }

    return locations;
  }

}