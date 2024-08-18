import 'package:babybrain/features/meditation/data/datasources/meditation_remote_datasource.dart';
import 'package:babybrain/features/meditation/domain/entities/daily_quote.dart';
import 'package:babybrain/features/meditation/domain/entities/mood_message.dart';
import 'package:babybrain/features/meditation/domain/repositories/meditaiton_repository.dart';

class MeditaionRepositoryImpl implements MeditaitonRepository{
  final MeditationRemoteDatasource remoteDatasource;

  MeditaionRepositoryImpl({required this.remoteDatasource});
  @override
  Future<DailyQuote> getDailyQuote() async{
    return await remoteDatasource.getDailyQuote();
  }

  @override
  Future<MoodMessage> getMoodMessage(String mood) async {
    return await remoteDatasource.getMoodMessage(mood);
  }
}