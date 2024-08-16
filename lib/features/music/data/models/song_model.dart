import 'package:babybrain/features/music/domain/entities/song.dart';

class SongModel extends Song {
  SongModel({
    required int id,
    required String title,
    required String author,
    required String songLink,
  }) : super(id, title, author, songLink);

  factory SongModel.fromJson(Map<String, dynamic> json) {
    return SongModel(
      id: json['id'],
      title: json['title'],
      author: json['author'],
      songLink: json['songLink'],
    );
  }
}
