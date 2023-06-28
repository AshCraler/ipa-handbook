import 'dart:convert';

class SoundPreview {
  String? crawlKey;
  String? name;
  String? example;
  String? type;

  SoundPreview({this.crawlKey, this.name, this.example, this.type});

  @override
  String toString() {
    return 'SoundPreview(crawlKey: $crawlKey, name: $name, example: $example, type: $type)';
  }

  factory SoundPreview.fromMap(Map<String, dynamic> data) => SoundPreview(
        crawlKey: data['crawl_key'] as String?,
        name: data['name'] as String?,
        example: data['example'] as String?,
        type: data['type'] as String?,
      );

  Map<String, dynamic> toMap() => {
        'crawl_key': crawlKey,
        'name': name,
        'example': example,
        'type': type,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [SoundPreview].
  factory SoundPreview.fromJson(String data) {
    return SoundPreview.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [SoundPreview] to a JSON string.
  String toJson() => json.encode(toMap());

  SoundPreview copyWith({
    String? crawlKey,
    String? name,
    String? example,
    String? type,
  }) {
    return SoundPreview(
      crawlKey: crawlKey ?? this.crawlKey,
      name: name ?? this.name,
      example: example ?? this.example,
      type: type ?? this.type,
    );
  }
}
