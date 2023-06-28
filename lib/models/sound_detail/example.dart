import 'dart:convert';

class Example {
  String? text;
  String? audio;

  Example({this.text, this.audio});

  @override
  String toString() => 'SimpleExample(text: $text, audio: $audio)';

  factory Example.fromMap(Map<String, dynamic> data) => Example(
        text: data['text'] as String?,
        audio: data['audio'] as String?,
      );

  Map<String, dynamic> toMap() => {
        'text': text,
        'audio': audio,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [Example].
  factory Example.fromJson(String data) {
    return Example.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [Example] to a JSON string.
  String toJson() => json.encode(toMap());

  Example copyWith({
    String? text,
    String? audio,
  }) {
    return Example(
      text: text ?? this.text,
      audio: audio ?? this.audio,
    );
  }
}
