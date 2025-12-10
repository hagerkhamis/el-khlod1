import 'package:elkhlod/Features/visits/domain/entities/teacher_entity.dart';
import 'package:elkhlod/core/utils/functions/base_one_response.dart';

class TeacherModel extends BaseOneResponse {
  const TeacherModel({
    super.status,
    super.data,
    super.message,
  });

  factory TeacherModel.fromJson(Map<String, dynamic> json) {
    return TeacherModel(
      status: json['status'] as int?,
      message: json['message'] as String?,
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => Teacher.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() => {
        'status': status,
        'message': message,
        'data': data?.map((e) => (e as Teacher).toJson()).toList(),
      };
}

typedef TeachersTList = List<TeacherEntity>?;

class Teacher extends TeacherEntity {
  const Teacher({
    super.teacherIdFk,
    super.moshrefIdFk,
    super.moshrefName,
    super.tType,
    super.teacherName,
    super.status,
  });

  factory Teacher.fromJson(Map<String, dynamic> json) => Teacher(
        teacherIdFk: json['teacher_id_fk'],
        moshrefIdFk: json['moshref_id_fk'],
        moshrefName: json['moshref_name'],
        tType: json['t_type'],
        teacherName: json['teacher_name'],
        status: json['status'],
      );

  Map<String, dynamic> toJson() => {
        'teacher_id_fk': teacherIdFk,
        'moshref_id_fk': moshrefIdFk,
        'moshref_name': moshrefName,
        't_type': tType,
        'teacher_name': teacherName,
        'status': status,
      };
}


