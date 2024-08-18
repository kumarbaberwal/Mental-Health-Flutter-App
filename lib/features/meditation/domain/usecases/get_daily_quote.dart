import 'package:babybrain/features/meditation/domain/entities/daily_quote.dart';
import 'package:babybrain/features/meditation/domain/repositories/meditaiton_repository.dart';

class GetDailyQuote {
  final MeditaitonRepository repository;

  GetDailyQuote({required this.repository});

  Future<DailyQuote> call() async {
    return await repository.getDailyQuote();
  }
}
