abstract class MoodMessageEvent {}

class FetchMoodMessage extends MoodMessageEvent {
  final String mood;

  FetchMoodMessage({required this.mood});
}


class ResetMoodMessage extends MoodMessageEvent {}