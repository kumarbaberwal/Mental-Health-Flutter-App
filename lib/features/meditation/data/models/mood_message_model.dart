import 'package:babybrain/features/meditation/domain/entities/mood_message.dart';

class MoodMessageModel extends MoodMessage {
  MoodMessageModel({required super.text});

  factory MoodMessageModel.fromJson(Map<String, dynamic> json) {
    final advice = json['text']['advice'] as String;
    return MoodMessageModel(text: advice);
  }

  Map<String, dynamic> toJson() {
    return {
      'text': {
        'advice': text,
      },
    };
  }
}
