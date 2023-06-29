import 'package:flutter/material.dart';
import 'package:iesbflutter/models/character_model.dart';
import 'package:iesbflutter/services/character_service.dart';
import 'package:iesbflutter/ui/pages/about_page.dart';
import 'package:iesbflutter/ui/pages/character_page.dart';
import 'package:iesbflutter/ui/pages/episodes_page.dart';
import 'package:iesbflutter/ui/pages/locations_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  final List<Character> _characters = <Character>[];

  final characterService = CharacterService();
  final scroolController = ScrollController();
  bool isLoading = false;
  int page = 1;

  @override
  void initState() {
    characterService.fetchCharacters(page).then((value) {
      setState(() {
        _characters.addAll(value);
      });
    });
    scroolController.addListener(() async {
      if(scroolController.position.pixels == scroolController.position.maxScrollExtent) {
        setState(() {
          isLoading = true;
        });
        page++;
        characterService.fetchCharacters(page).then((value) {
          setState(() {
            _characters.addAll(value);
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
      drawer: Builder(
        builder: (context) => Drawer(
          child: Column(
            children: [
              const UserAccountsDrawerHeader(
                accountName: Text('Elison Ribeiro Durães Coelho'),
                accountEmail: Text('elison.coelho@iesb.edu.br'),
                currentAccountPicture: CircleAvatar(
                  radius: 50,
                  backgroundImage: NetworkImage('https://rickandmortyapi.com/api/character/avatar/8.jpeg'),
                ),
              ),
              ListTile(
                leading: const Icon(Icons.movie),
                title: const Text('Episódios'),
                subtitle: const Text(''),
                onTap: () => {
                  Navigator.of(context).pop(),
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return const EpisodesPage();
                  }))
                },
              ),
              ListTile(
                leading: const Icon(Icons.pin_drop),
                title: const Text('Localizações'),
                subtitle: const Text(''),
                onTap: () => {
                  Navigator.of(context).pop(),
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return const LocationsPage();
                  }))
                },
              ),
              ListTile(
                leading: const Icon(Icons.info),
                title: const Text('Sobre'),
                subtitle: const Text(''),
                onTap: () => {
                  Navigator.of(context).pop(),
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return const AboutPage();
                  }))
                },
              ),
            ],
          ),
        ),
      ),
      appBar: AppBar(title: const Text('Personagens')),
      body: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 0.87,
              mainAxisSpacing: 10,
              crossAxisSpacing: 10
          ),
          itemCount: _characters.length,
          controller: scroolController,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () => {
                Navigator.push(context, MaterialPageRoute(builder: (context) => CharacterPage(character: _characters[index])))
              },
              child: Card(
                color: const Color(0xFF905D24),
                child: Column(
                  children: [
                    FadeInImage(
                        placeholder: const AssetImage('images/portal-rick-and-morty.gif'),
                        image: NetworkImage(_characters[index].image),
                    ),
                    const Padding(padding: EdgeInsets.only(top: 4)),
                    Text(
                      _characters[index].name,
                      style: const TextStyle(
                          fontSize: 16,
                          overflow: TextOverflow.ellipsis,
                          color: Color(0xFFA8D2EC),
                      ),
                    )
                  ],
                ),
              ),
            );
          }
      ),
    );
  }
}