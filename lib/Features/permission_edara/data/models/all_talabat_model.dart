import 'package:elkhlod/Features/permission_edara/domain/entities/talabat_list_entity.dart';
import 'package:elkhlod/core/utils/functions/base_one_response.dart';

class TalabatListModel extends BaseOneResponse {
  const TalabatListModel({
    super.status,
    super.data,
    super.message,
  });

  factory TalabatListModel.fromJson(Map<String, dynamic> json) {
    return TalabatListModel(
      status: json['status'] as int?,
      message: json['message'] as String?,
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => TalabatList.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() =>
      {'status': status, 'message': message, 'data': data};
}

typedef TalabatTList = List<TalabatListEntity>?;

class TalabatList extends TalabatListEntity {
  const TalabatList({
    super.id,
    super.editDelete,
    super.empIdFk,
    super.empName,
    super.haletTalab,
    super.no3TalabName,
    super.notes,
    super.talabDateAr,
    super.talabTime,
    super.suspend,
    super.radFile,
    super.radNote,
  });

  factory TalabatList.fromJson(Map<String, dynamic> json) => TalabatList(
        id: json['id'],
        editDelete: json['edit_delete'],
        empIdFk: json['emp_id_fk'],
        empName: json['emp_name'],
        haletTalab: json['halet_talab'],
        no3TalabName: json['no3_talab_name'],
        notes: json['notes'],
        talabDateAr: json['talab_date_ar'],
        talabTime: json['talab_time'],
        suspend: json['suspend'],
        radFile: json['rad_file'],
        radNote: json['rad_notes'],

      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'edit_delete': editDelete,
        'emp_id_fk': empIdFk,
        'emp_name': empName,
        'halet_talab': haletTalab,
        'no3_talab_name': no3TalabName,
        'notes': notes,
        'talab_date_ar': talabDateAr,
        'talab_time': talabTime,
        'suspend': suspend,
        'rad_file': radFile,
        'rad_notes': radNote,
      };
}
