import 'package:babybrain/features/music/data/datasources/song_remote_datasource.dart';
import 'package:babybrain/features/music/domain/entities/song.dart';
import 'package:babybrain/features/music/domain/repository/song_repository.dart';

class SongRepositoryImpl implements SongRepository {
  final SongRemoteDatasource remoteDataSource;

  SongRepositoryImpl({required this.remoteDataSource});
  @override
  Future<List<Song>> getAllSongs() async {
    final songModels = await remoteDataSource.getAllSongs();
    return songModels;
  }
}
