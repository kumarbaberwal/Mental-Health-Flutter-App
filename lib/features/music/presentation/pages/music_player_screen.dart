import 'package:audio_video_progress_bar/audio_video_progress_bar.dart';
import 'package:babybrain/core/theme.dart';
import 'package:babybrain/features/music/domain/entities/song.dart';
import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';

class MusicPlayerScreen extends StatefulWidget {
  final Song song;
  const MusicPlayerScreen({super.key, required this.song});

  @override
  State<MusicPlayerScreen> createState() => _MusicPlayerScreenState();
}

class _MusicPlayerScreenState extends State<MusicPlayerScreen> {
  late AudioPlayer _audioPlayer;
  bool isLooping = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.white,
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Image.asset('assets/down_arrow.png'),
        ),
        actions: [
          Image.asset('assets/transcript_icon.png'),
          const SizedBox(
            width: 16,
          ),
        ],
      ),
      body: Container(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            // network
            ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image.asset(
                'assets/child_with_dog.png',
                height: 300,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            // text(title)
            Text(
              widget.song.title,
              style: Theme.of(context).textTheme.labelLarge,
            ),
            // text(author name)
            Text(
              'By: ${widget.song.author}',
              style: Theme.of(context).textTheme.labelSmall,
            ),
            const Spacer(),
            // progress bar
            StreamBuilder<Duration>(
              stream: _audioPlayer.positionStream,
              builder: (context, snapshot) {
                final position = snapshot.data ?? Duration.zero;
                final duration = _audioPlayer.duration ?? Duration.zero;
                return ProgressBar(
                  progress: position,
                  total: duration,
                  baseBarColor: DefaultColors.lightpink,
                  thumbColor: DefaultColors.pink,
                  progressBarColor: DefaultColors.pink,
                  onSeek: (value) {
                    _audioPlayer.seek(value);
                  },
                );
              },
            ),

            // play button
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.shuffle,
                    color: DefaultColors.pink,
                  ),
                ),
                IconButton(
                  onPressed: seekBackward,
                  icon: const Icon(
                    Icons.skip_previous,
                    color: DefaultColors.pink,
                  ),
                ),
                StreamBuilder(
                  stream: _audioPlayer.playerStateStream,
                  builder: (context, snapshot) {
                    final playerState = snapshot.data;
                    final processingState =
                        playerState?.processingState ?? ProcessingState.idle;
                    final playing = playerState?.playing ?? false;

                    if (processingState == ProcessingState.loading ||
                        processingState == ProcessingState.buffering) {
                      return Container(
                        margin: const EdgeInsets.all(8),
                        width: 80,
                        height: 80,
                        child: const Center(
                          child: CircularProgressIndicator(
                            color: DefaultColors.pink,
                          ),
                        ),
                      );
                    } else if (!playing) {
                      return IconButton(
                        onPressed: togglePlayPause,
                        icon: const Icon(
                          Icons.play_circle_fill,
                          color: DefaultColors.pink,
                          size: 80,
                        ),
                      );
                    } else if (processingState != ProcessingState.completed) {
                      return IconButton(
                        onPressed: togglePlayPause,
                        icon: const Icon(
                          Icons.pause_circle_filled,
                          size: 80,
                          color: DefaultColors.pink,
                        ),
                      );
                    } else {
                      return IconButton(
                        onPressed: seekRestart,
                        icon: const Icon(
                          Icons.replay_circle_filled,
                          size: 80,
                          color: DefaultColors.pink,
                        ),
                      );
                    }
                  },
                ),
                IconButton(
                  onPressed: seekForward,
                  icon: const Icon(
                    Icons.skip_next,
                    color: DefaultColors.pink,
                  ),
                ),
                IconButton(
                  onPressed: toggleLoop,
                  icon: Icon(
                    isLooping ? Icons.repeat_one : Icons.repeat,
                    color: DefaultColors.pink,
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _audioPlayer.dispose();
    super.dispose();
  }

  @override
  void initState() {
    _audioPlayer = AudioPlayer();
    _audioPlayer
        .setAudioSource(AudioSource.uri(Uri.parse(widget.song.songLink)));
    super.initState();
  }

  void seekBackward() {
    final currentPosition = _audioPlayer.position;
    final seekPosition = currentPosition - const Duration(seconds: 10);
    _audioPlayer
        .seek(seekPosition >= Duration.zero ? seekPosition : Duration.zero);
  }

  void seekForward() {
    final currentPosition = _audioPlayer.position;
    final seekPosition = currentPosition + const Duration(seconds: 10);
    _audioPlayer.seek(seekPosition);
  }

  void seekRestart() {
    const seekPosition = Duration.zero;
    _audioPlayer.seek(seekPosition);
  }

  void toggleLoop() {
    setState(() {
      isLooping = !isLooping;
      _audioPlayer.setLoopMode(isLooping ? LoopMode.all : LoopMode.off);
    });
  }

  void togglePlayPause() {
    if (_audioPlayer.playing) {
      _audioPlayer.pause();
    } else {
      _audioPlayer.play();
    }
  }
}
