import 'package:babybrain/features/meditation/domain/entities/daily_quote.dart';
import 'package:babybrain/features/meditation/domain/entities/mood_message.dart';

abstract class MeditaitonRepository {
  Future<DailyQuote> getDailyQuote();
  Future<MoodMessage> getMoodMessage(String mood);
}