import 'package:babybrain/features/music/domain/entities/song.dart';

class SongError extends SongState {
  final String message;
  SongError(this.message);
}

class SongInitial extends SongState {}

class SongLoaded extends SongState {
  final List<Song> songs;
  SongLoaded(this.songs);
}

class SongLoading extends SongState {}

abstract class SongState {}
