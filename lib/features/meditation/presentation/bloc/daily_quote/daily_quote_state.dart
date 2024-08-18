import 'package:babybrain/features/meditation/domain/entities/daily_quote.dart';

class DailyQuoteError extends DailyQuoteState {
  final String message;

  DailyQuoteError({required this.message});
}

class DailyQuoteInitial extends DailyQuoteState {}

class DailyQuoteLoaded extends DailyQuoteState {
  final DailyQuote dailyQuote;

  DailyQuoteLoaded({required this.dailyQuote});
}

class DailyQuoteLoading extends DailyQuoteState {}

abstract class DailyQuoteState {}
