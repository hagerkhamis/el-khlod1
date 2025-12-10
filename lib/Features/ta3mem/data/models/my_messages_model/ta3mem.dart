import 'package:elkhlod/Features/ta3mem/domain/entities/ta3mem_entity.dart';

typedef AllTa3memList = List<Ta3memEntity>?;

class T3amem extends Ta3memEntity {
  const T3amem(
      {super.id,
      super.ta3memIdFk,
      super.empId,
      super.empCode,
      super.empName,
      super.seen,
      super.seenDate,
      super.seenTime,
      super.type,
      super.ta3memTitle,
      super.ta3memDate,
      super.ta3memImg});

  factory T3amem.fromJson(Map<String, dynamic> json) => T3amem(
        id: json['id'],
        ta3memIdFk: json['ta3mem_id_fk'],
        empId: json['emp_id'],
        empCode: json['emp_code'],
        empName: json['emp_name'],
        seen: json['seen'],
        seenDate: json['seen_date'],
        seenTime: json['seen_time'],
        type: json['type'],
        ta3memTitle: json['ta3mem_title'],
        ta3memDate: json['ta3mem_date'],
        ta3memImg: json['ta3mem_img'],
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'ta3mem_id_fk': ta3memIdFk,
        'emp_id': empId,
        'emp_code': empCode,
        'emp_name': empName,
        'seen': seen,
        'seen_date': seenDate,
        'seen_time': seenTime,
        'type': type,
        'ta3mem_title': ta3memTitle,
        'ta3mem_date': ta3memDate,
        'ta3mem_img': ta3memImg,
      };
}
