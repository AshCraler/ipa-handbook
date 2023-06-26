import 'dart:convert';

class CompareExample {
  String? text;
  String? audio;

  CompareExample({this.text, this.audio});

  @override
  String toString() => 'CompareExample(text: $text, audio: $audio)';

  factory CompareExample.fromMap(Map<String, dynamic> data) {
    return CompareExample(
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
  /// Parses the string and returns the resulting Json object as [CompareExample].
  factory CompareExample.fromJson(String data) {
    return CompareExample.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [CompareExample] to a JSON string.
  String toJson() => json.encode(toMap());

  CompareExample copyWith({
    String? text,
    String? audio,
  }) {
    return CompareExample(
      text: text ?? this.text,
      audio: audio ?? this.audio,
    );
  }
}
