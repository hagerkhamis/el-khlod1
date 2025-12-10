import 'package:elkhlod/Features/lwae7/domain/entities/lwae7_entity.dart';

typedef AllLwae7List = List<Lwae7Entity>?;

class Lwae7 extends Lwae7Entity {
  const Lwae7(
      {super.layhaId,
      super.layhaName,
      super.layhaPath,
      super.seen,
      super.seenDate,
      super.seenTime});

  factory Lwae7.fromJson(Map<String, dynamic> json) => Lwae7(
        layhaId: json['layha_id'],
        layhaName: json['layha_name'],
        layhaPath: json['layha_path'],
        seen: json['seen'],
        seenDate: json['seen_date'],
        seenTime: json['seen_time'],
      );

  Map<String, dynamic> toJson() => {
        'layha_id': layhaId,
        'layha_name': layhaName,
        'layha_path': layhaPath,
        'seen': seen,
        'seen_date': seenDate,
        'seen_time': seenTime,
      };
}
