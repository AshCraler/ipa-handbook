import 'dart:convert';

class SentenceExample {
  String? text;
  String? audio;

  SentenceExample({this.text, this.audio});

  @override
  String toString() => 'SentenceExample(text: $text, audio: $audio)';

  factory SentenceExample.fromMap(Map<String, dynamic> data) {
    return SentenceExample(
      text: data['text'] as String?,
      audio: data['audio'] as String?,
    );
  }

  Map<String, dynamic> toMap() => {
        'text': text,
        'audio': audio,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [SentenceExample].
  factory SentenceExample.fromJson(String data) {
    return SentenceExample.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [SentenceExample] to a JSON string.
  String toJson() => json.encode(toMap());

  SentenceExample copyWith({
    String? text,
    String? audio,
  }) {
    return SentenceExample(
      text: text ?? this.text,
      audio: audio ?? this.audio,
    );
  }
}
