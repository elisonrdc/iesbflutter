import 'package:flutter/material.dart';
import 'package:iesbflutter/models/location_model.dart';
import 'package:iesbflutter/services/location_service.dart';
import 'package:iesbflutter/ui/widgets/item_location.dart';

class LocationsPage extends StatefulWidget {
  const LocationsPage({Key? key}) : super(key: key);

  @override
  State<LocationsPage> createState() => _LocationsPageState();
}

class _LocationsPageState extends State<LocationsPage> {

  final List<Location> _locations = <Location>[];

  final locationService = LocationService();
  final scroolController = ScrollController();
  bool isLoading = false;
  int page = 1;

  @override
  void initState() {
    locationService.fetchLocations(page).then((value) {
      setState(() {
        _locations.addAll(value);
      });
    });
    scroolController.addListener(() async {
      if(scroolController.position.pixels == scroolController.position.maxScrollExtent) {
        setState(() {
          isLoading = true;
        });
        page++;
        locationService.fetchLocations(page).then((value) {
          setState(() {
            _locations.addAll(value);
          });
        });
        setState(() {
          isLoading = false;
        });
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Localizações'),
      ),
      body: ListView.builder(itemBuilder: (context, index) {
        return Card(
            child: ItemLocation(
                id: _locations[index].id.toString(),
                name: _locations[index].name,
                type: _locations[index].type,
                dimension: _locations[index].dimension
            )
        );},
        itemCount: _locations.length,
        controller: scroolController,
      ),
    );
  }
}
