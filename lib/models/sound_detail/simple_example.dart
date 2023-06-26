import 'dart:convert';

class SimpleExample {
  String? text;
  String? audio;

  SimpleExample({this.text, this.audio});

  @override
  String toString() => 'SimpleExample(text: $text, audio: $audio)';

  factory SimpleExample.fromMap(Map<String, dynamic> data) => SimpleExample(
        text: data['text'] as String?,
        audio: data['audio'] as String?,
      );

  Map<String, dynamic> toMap() => {
        'text': text,
        'audio': audio,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [SimpleExample].
  factory SimpleExample.fromJson(String data) {
    return SimpleExample.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [SimpleExample] to a JSON string.
  String toJson() => json.encode(toMap());

  SimpleExample copyWith({
    String? text,
    String? audio,
  }) {
    return SimpleExample(
      text: text ?? this.text,
      audio: audio ?? this.audio,
    );
  }
}
