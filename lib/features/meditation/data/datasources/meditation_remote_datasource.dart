import 'dart:convert';

import 'package:babybrain/features/meditation/data/models/daily_quote_model.dart';
import 'package:babybrain/features/meditation/data/models/mood_message_model.dart';
import 'package:http/http.dart' as http;

abstract class MeditationRemoteDataSource {
  Future<DailyQuoteModel> getDailyQuote();
  Future<MoodMessageModel> getMoodMessage(String mood);
}

class MeditationRemoteDataSourceImpl implements MeditationRemoteDataSource {
  final http.Client client;

  MeditationRemoteDataSourceImpl({required this.client});

  @override
  Future<DailyQuoteModel> getDailyQuote() async {
    final response = await client
        .get(Uri.parse('http://192.168.88.234:6000/meditation/dailyQuote'));

    if (response.statusCode == 200) {
      final jsonResponse = json.decode(response.body);
      return DailyQuoteModel.fromJson(jsonResponse);
    } else {
      throw Exception('Failed to load daily quote');
    }
  }

  @override
  Future<MoodMessageModel> getMoodMessage(String mood) async {
    final response = await client
        .get(Uri.parse('http://192.168.88.234:6000/meditation/myMood/$mood'));

    if (response.statusCode == 200) {
      final jsonResponse = json.decode(response.body);
      return MoodMessageModel.fromJson(jsonResponse);
    } else {
      throw Exception('Failed to load mood quote');
    }
  }
}
