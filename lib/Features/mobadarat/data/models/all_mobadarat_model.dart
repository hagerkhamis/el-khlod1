import 'package:elkhlod/Features/mobadarat/domain/entities/mobadarat_entity.dart';
import 'package:elkhlod/core/utils/functions/base_one_response.dart';

class MobadaratListModel extends BaseOneResponse {
  const MobadaratListModel({
    super.status,
    super.data,
    super.message,
  });

  factory MobadaratListModel.fromJson(Map<String, dynamic> json) {
    return MobadaratListModel(
      status: json['status'] as int?,
      message: json['message'] as String?,
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => MobadaratList.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() =>
      {'status': status, 'message': message, 'data': data};
}

typedef MobadaratTList = List<MobadaratEntity>?;

class MobadaratList extends MobadaratEntity {
  const MobadaratList({
    super.id,
    super.editDelete,
    super.empIdFk,
    super.empName,
    super.haletTalab,
    super.notes,
    super.suspend,
    super.radNotes,
    super.sendDateAr,
    super.sendTime,
    super.title,
  });

  factory MobadaratList.fromJson(Map<String, dynamic> json) => MobadaratList(
        id: json['id'],
        editDelete: json['edit_delete'],
        empIdFk: json['emp_id_fk'],
        empName: json['emp_name'],
        haletTalab: json['halet_talab'],
        notes: json['notes'],
        suspend: json['suspend'],
        radNotes: json['rad_notes'],
        sendDateAr: json['send_date_ar'],
        sendTime: json['send_time'],
        title: json['title'],
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'edit_delete': editDelete,
        'emp_id_fk': empIdFk,
        'emp_name': empName,
        'halet_talab': haletTalab,
        'notes': notes,
        'suspend': suspend,
        'rad_notes': radNotes,
        'send_date_ar': sendDateAr,
        'send_time': sendTime,
        'title': title,
      };
}
