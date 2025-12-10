import 'package:elkhlod/Features/app_home/domain/entities/ntaq_type_entity.dart';
import 'package:elkhlod/core/utils/functions/base_one_response.dart';

class NtaqTypeModel extends BaseOneResponse {
  const NtaqTypeModel({
    super.status,
    super.data,
    super.message,
  });

  factory NtaqTypeModel.fromJson(Map<String, dynamic> json) {
    return NtaqTypeModel(
      status: json['status'] as int?,
      message: json['message'] as String?,
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => NtaqTypes.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() =>
      {'status': status, 'message': message, 'data': data};
}

typedef NtaqTypesList = List<NtaqTypesEntity>?;

class NtaqTypes extends NtaqTypesEntity {
  const NtaqTypes({
    super.id,
    super.title,
    super.color,
    super.msg,
  });

  factory NtaqTypes.fromJson(Map<String, dynamic> json) => NtaqTypes(
        id: json['id'],
        title: json['title'],
        color: json['color'],
        msg: json['msg'],
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'title': title,
        'color': color,
        'msg': msg
      };
}
