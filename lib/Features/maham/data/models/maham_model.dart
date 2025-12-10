import 'package:elkhlod/Features/maham/domain/entities/maham_entity.dart';
import 'package:elkhlod/core/utils/functions/base_one_response.dart';

class MahamModel extends BaseOneResponse {
  const MahamModel({
    super.status,
    super.data,
    super.message,
  });

  factory MahamModel.fromJson(Map<String, dynamic> json) {
    return MahamModel(
      status: json['status'] as int?,
      message: json['message'] as String?,
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => MahamList.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() =>
      {'status': status, 'message': message, 'data': data};
}

typedef MahamTList = List<MahamEntity>?;

class MahamList extends MahamEntity {
  const MahamList({
    super.id,
    super.editDelete,
    super.empIdFk,
    super.empName,
    super.haletTask,
    super.notes,
    super.suspend,
    super.haletTaskColor,
    super.sendDateAr,
    super.sendTime,
    super.title,
    super.status,
  });

  factory MahamList.fromJson(Map<String, dynamic> json) => MahamList(
        id: json['id'],
        editDelete: json['edit_delete'],
        empIdFk: json['emp_id_fk'],
        empName: json['emp_name'],
        notes: json['notes'],
        suspend: json['suspend'],
        sendDateAr: json['send_date_ar'],
        sendTime: json['send_time'],
        title: json['title'],
        haletTask: json['halet_task'],
        status: json['status'],
        haletTaskColor: json['halet_task_color'],
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'edit_delete': editDelete,
        'emp_id_fk': empIdFk,
        'emp_name': empName,
        'halet_task': haletTask,
        'notes': notes,
        'suspend': suspend,
        'send_date_ar': sendDateAr,
        'send_time': sendTime,
        'title': title,
        'status': status,
        'halet_task_color': haletTaskColor
      };
}
