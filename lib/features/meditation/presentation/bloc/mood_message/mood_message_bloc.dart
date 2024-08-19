import 'package:babybrain/features/meditation/domain/usescases/get_mood_message.dart';
import 'package:babybrain/features/meditation/presentation/bloc/mood_message/mood_message_event.dart';
import 'package:babybrain/features/meditation/presentation/bloc/mood_message/mood_message_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MoodMessageBloc extends Bloc<MoodMessageEvent, MoodMessageState> {
  final GetMoodMessage getMoodMessage;

  MoodMessageBloc({required this.getMoodMessage})
      : super(MoodMessageInitial()) {
    on<FetchMoodMessage>((event, emit) async {
      emit(MoodMessageLoading());
      try {
        final moodMessage = await getMoodMessage(event.mood);
        emit(MoodMessageLoaded(moodMessage: moodMessage));
      } catch (e) {
        emit(MoodMessageError(message: e.toString()));
      }
    });

    on<ResetMoodMessage>((event, emit) {
      emit(MoodMessageInitial());
    });
  }
}
