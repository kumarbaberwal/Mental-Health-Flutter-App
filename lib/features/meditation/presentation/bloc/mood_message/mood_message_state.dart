import 'package:babybrain/features/meditation/domain/entities/mood_message.dart';

class MoodMessageError extends MoodMessageState {
  final String message;

  MoodMessageError({required this.message});
}

class MoodMessageInitial extends MoodMessageState {}

class MoodMessageLoaded extends MoodMessageState {
  final MoodMessage moodMessage;

  MoodMessageLoaded({required this.moodMessage});
}

class MoodMessageLoading extends MoodMessageState {}

abstract class MoodMessageState {}
