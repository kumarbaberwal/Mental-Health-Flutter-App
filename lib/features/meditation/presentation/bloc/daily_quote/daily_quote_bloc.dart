import 'package:babybrain/features/meditation/domain/usecases/get_daily_quote.dart';
import 'package:babybrain/features/meditation/presentation/bloc/daily_quote/daily_quote_event.dart';
import 'package:babybrain/features/meditation/presentation/bloc/daily_quote/daily_quote_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DailyQuoteBloc extends Bloc<DailyQuoteEvent, DailyQuoteState> {
  final GetDailyQuote getDailyQuote;
  DailyQuoteBloc({required this.getDailyQuote}) : super(DailyQuoteInitial()) {
    on<FetchDailyQuote>((event, emit) async {
      emit(DailyQuoteLoading());
      try {
        final dailyQuote = await getDailyQuote.call();
        emit(DailyQuoteLoaded(dailyQuote: dailyQuote));
      } catch (e) {
        emit(DailyQuoteError(message: e.toString()));
      }
    });
  }
}
