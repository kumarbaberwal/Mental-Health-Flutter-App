import 'dart:convert';

import 'package:babybrain/features/music/data/models/song_model.dart';
import 'package:http/http.dart' as http;

abstract class SongRemoteDatasource {
  Future<List<SongModel>> getAllSongs();
}

class SongRemoteDatasourceImpl implements SongRemoteDatasource {
  final http.Client client;
  SongRemoteDatasourceImpl({required this.client});
  @override
  Future<List<SongModel>> getAllSongs() async {
    final response = await client.get(
      Uri.parse('http://192.168.33.213:6000/songs/all'),
    );
    if (response.statusCode == 200) {
      List jsonResponse = json.decode(response.body);
      return jsonResponse.map((song) => SongModel.fromJson(song)).toList();
    } else {
      throw Exception('Failed to load songs');
    }
  }
}
