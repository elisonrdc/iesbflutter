import 'package:flutter/material.dart';
import 'package:iesbflutter/models/episode_model.dart';
import 'package:iesbflutter/services/episode_service.dart';
import 'package:iesbflutter/ui/widgets/item_episode.dart';

class EpisodesPage extends StatefulWidget {
  const EpisodesPage({Key? key}) : super(key: key);

  @override
  State<EpisodesPage> createState() => _EpisodesPageState();
}

class _EpisodesPageState extends State<EpisodesPage> {

  final List<Episode> _episodes = <Episode>[];

  final episodeService = EpisodeService();
  final scroolController = ScrollController();
  bool isLoading = false;
  int page = 1;

  @override
  void initState() {
    episodeService.fetchEpisodes(page).then((value) {
      setState(() {
        _episodes.addAll(value);
      });
    });
    scroolController.addListener(() async {
      if(scroolController.position.pixels == scroolController.position.maxScrollExtent) {
        setState(() {
          isLoading = true;
        });
        page++;
        episodeService.fetchEpisodes(page).then((value) {
          setState(() {
            _episodes.addAll(value);
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
        title: const Text('Episódios'),
      ),
      body: ListView.builder(itemBuilder: (context, index) {
        return Card(
          child: ItemEpisode(
              id: _episodes[index].id.toString(),
              name: _episodes[index].name,
              airDate: _episodes[index].airDate,
              episode: _episodes[index].episode
          ),
        );},
        itemCount: _episodes.length,
        controller: scroolController,
      ),
    );
  }
}
