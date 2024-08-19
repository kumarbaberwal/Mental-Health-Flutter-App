class FetchMoodMessage extends MoodMessageEvent {
  final String mood;

  FetchMoodMessage(this.mood);
}

abstract class MoodMessageEvent {}

class ResetMoodMessage extends MoodMessageEvent {}
