// ignore_for_file: file_names

import 'dart:convert';

class SubmitAnswer {
  final int bandId;
  final int empDegree;

  SubmitAnswer({
    required this.bandId,
    required this.empDegree,
  });

  Map<dynamic, dynamic> toJsonData() {
    var map = <String, dynamic>{};
    map["band_id"] = bandId;
    map["emp_degree"] = empDegree;

    return map;
  }

  static Map<String, dynamic> toMap(SubmitAnswer answer) => {
        'question_id': answer.bandId,
        'mark': answer.empDegree,
      };

  factory SubmitAnswer.fromJson(Map<dynamic, dynamic> json) => SubmitAnswer(
        bandId: json['question_id'],
        empDegree: json['mark'],
      );

  Map<String, dynamic> toJson() => {
        "questionId": bandId,
        "mark": empDegree,
      };

  static String encode(List<SubmitAnswer> musics) => json.encode(
        musics
            .map<Map<String, dynamic>>((music) => SubmitAnswer.toMap(music))
            .toList(),
      );

  static List<SubmitAnswer> decode(String answer) =>
      (json.decode(answer) as List<dynamic>)
          .map<SubmitAnswer>((item) => SubmitAnswer.fromJson(item))
          .toList();
}
