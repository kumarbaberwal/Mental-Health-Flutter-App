import 'package:babybrain/features/meditation/domain/entities/daily_quote.dart';
import 'package:babybrain/features/meditation/domain/repositories/meditation_repository.dart';

class GetDailyQuote {
  final MeditationRepository repository;

  GetDailyQuote({required this.repository});

  Future<DailyQuote> call() async {
    return await repository.getDailyQuote();
  }
}
