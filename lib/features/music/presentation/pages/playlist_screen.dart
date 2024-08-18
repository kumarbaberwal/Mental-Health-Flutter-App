import 'package:babybrain/features/music/presentation/bloc/song_bloc.dart';
import 'package:babybrain/features/music/presentation/bloc/song_state.dart';
import 'package:babybrain/features/music/presentation/pages/music_player_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PlaylistScreen extends StatelessWidget {
  final List<Map<String, String>> playlist = [
    {
      'title': 'Rain on Glass',
      'author': 'Painting with Kumar',
      'imagePath': 'assets/child_with_dog.png',
    },
    {
      'title': 'Rain on Glass',
      'author': 'By: Painting with Kumar',
      'imagePath': 'assets/child_with_dog.png',
    },
    {
      'title': 'Rain on Glass',
      'author': 'By: Painting with Kumar',
      'imagePath': 'assets/child_with_dog.png',
    },
    {
      'title': 'Rain on Glass',
      'author': 'By: Painting with Kumar',
      'imagePath': 'assets/child_with_dog.png',
    },
  ];
  PlaylistScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 1,
        title: Text(
          'Chill PLaylist',
          style: Theme.of(context).textTheme.titleMedium,
        ),
      ),
      body: BlocBuilder<SongBloc, SongState>(
        builder: (context, state) {
          if (state is SongLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is SongLoaded) {
            return ListView.builder(
              itemCount: state.songs.length,
              itemBuilder: (context, index) {
                return ListTile(
                  leading: CircleAvatar(
                    backgroundImage: AssetImage(
                      playlist[index]['imagePath']!,
                    ), // Replace with your image path
                  ),
                  trailing: const Icon(
                    Icons.arrow_forward_ios,
                    size: 15,
                  ),
                  title: Text(
                    state.songs[index].title,
                    style: Theme.of(context).textTheme.labelMedium,
                  ),
                  subtitle: Text(
                    state.songs[index].author,
                    style: Theme.of(context).textTheme.labelSmall,
                  ),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => MusicPlayerScreen(
                          song: state.songs[index],
                        ),
                      ),
                    );
                  },
                );
              },
            );
          } else if (state is SongError) {
            return Center(
              child: Text(
                state.message,
                style: Theme.of(context).textTheme.labelSmall,
              ),
            );
          } else {
            return Center(
              child: Text(
                'No Songs Found',
                style: Theme.of(context).textTheme.labelSmall,
              ),
            );
          }
        },
      ),
    );
  }
}
