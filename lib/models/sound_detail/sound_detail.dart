import 'dart:convert';

import 'compare_example.dart';
import 'sentence_example.dart';
import 'simple_example.dart';

class SoundDetail {
  String? crawlKey;
  String? name;
  String? type;
  String? subType;
  String? guideTextVi;
  String? guideVideo;
  String? guideText;
  List<SimpleExample>? simpleExamples;
  List<CompareExample>? compareExamples;
  List<dynamic>? positionExamples;
  List<SentenceExample>? sentenceExamples;
  List<dynamic>? practiceExamples;

  SoundDetail({
    this.crawlKey,
    this.name,
    this.type,
    this.subType,
    this.guideTextVi,
    this.guideVideo,
    this.guideText,
    this.simpleExamples,
    this.compareExamples,
    this.positionExamples,
    this.sentenceExamples,
    this.practiceExamples,
  });

  @override
  String toString() {
    return 'SoundDetail(crawlKey: $crawlKey, name: $name, type: $type, subType: $subType, guideTextVi: $guideTextVi, guideVideo: $guideVideo, guideText: $guideText, simpleExamples: $simpleExamples, compareExamples: $compareExamples, positionExamples: $positionExamples, sentenceExamples: $sentenceExamples, practiceExamples: $practiceExamples)';
  }

  factory SoundDetail.fromMap(Map<String, dynamic> data) => SoundDetail(
        crawlKey: data['crawl_key'] as String?,
        name: data['name'] as String?,
        type: data['type'] as String?,
        subType: data['subType'] as String?,
        guideTextVi: data['guideTextVi'] as String?,
        guideVideo: data['guideVideo'] as String?,
        guideText: data['guideText'] as String?,
        simpleExamples: (data['simpleExamples'] as List<dynamic>?)
            ?.map((e) => SimpleExample.fromMap(e as Map<String, dynamic>))
            .toList(),
        compareExamples: (data['compareExamples'] as List<dynamic>?)
            ?.map((e) => CompareExample.fromMap(e as Map<String, dynamic>))
            .toList(),
        positionExamples: data['positionExamples'] as List<dynamic>?,
        sentenceExamples: (data['sentenceExamples'] as List<dynamic>?)
            ?.map((e) => SentenceExample.fromMap(e as Map<String, dynamic>))
            .toList(),
        practiceExamples: data['practiceExamples'] as List<dynamic>?,
      );

  Map<String, dynamic> toMap() => {
        'crawl_key': crawlKey,
        'name': name,
        'type': type,
        'subType': subType,
        'guideTextVi': guideTextVi,
        'guideVideo': guideVideo,
        'guideText': guideText,
        'simpleExamples': simpleExamples?.map((e) => e.toMap()).toList(),
        'compareExamples': compareExamples?.map((e) => e.toMap()).toList(),
        'positionExamples': positionExamples,
        'sentenceExamples': sentenceExamples?.map((e) => e.toMap()).toList(),
        'practiceExamples': practiceExamples,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [SoundDetail].
  factory SoundDetail.fromJson(String data) {
    return SoundDetail.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [SoundDetail] to a JSON string.
  String toJson() => json.encode(toMap());

  SoundDetail copyWith({
    String? crawlKey,
    String? name,
    String? type,
    String? subType,
    String? guideTextVi,
    String? guideVideo,
    String? guideText,
    List<SimpleExample>? simpleExamples,
    List<CompareExample>? compareExamples,
    List<dynamic>? positionExamples,
    List<SentenceExample>? sentenceExamples,
    List<dynamic>? practiceExamples,
  }) {
    return SoundDetail(
      crawlKey: crawlKey ?? this.crawlKey,
      name: name ?? this.name,
      type: type ?? this.type,
      subType: subType ?? this.subType,
      guideTextVi: guideTextVi ?? this.guideTextVi,
      guideVideo: guideVideo ?? this.guideVideo,
      guideText: guideText ?? this.guideText,
      simpleExamples: simpleExamples ?? this.simpleExamples,
      compareExamples: compareExamples ?? this.compareExamples,
      positionExamples: positionExamples ?? this.positionExamples,
      sentenceExamples: sentenceExamples ?? this.sentenceExamples,
      practiceExamples: practiceExamples ?? this.practiceExamples,
    );
  }
}
