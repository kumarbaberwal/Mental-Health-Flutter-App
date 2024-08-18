import 'package:babybrain/features/meditation/domain/entities/daily_quote.dart';

class DailyQuoteModel extends DailyQuote {
  DailyQuoteModel({
    required super.morningQuote,
    required super.noonQuote,
    required super.eveningQuote,
  });

  factory DailyQuoteModel.fromJson(Map<String, dynamic> json) {
    return DailyQuoteModel(
      morningQuote: json['morningQuote'],
      noonQuote: json['noonQuote'],
      eveningQuote: json['eveningQuote'],
    );
  }
}
