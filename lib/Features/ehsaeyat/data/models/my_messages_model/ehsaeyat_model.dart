import 'package:elkhlod/Features/ehsaeyat/domain/entities/ehsaeyat_entity.dart';
import 'package:elkhlod/core/utils/functions/base_one_response.dart';

class EhsaeyatListModel extends BaseOneResponse {
  const EhsaeyatListModel({
    super.status,
    super.data,
    super.message,
  });

  factory EhsaeyatListModel.fromJson(Map<String, dynamic> json) {
    return EhsaeyatListModel(
      status: json['status'] as int?,
      message: json['message'] as String?,
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => Ehsaeyat.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() =>
      {'status': status, 'message': message, 'data': data};
}

typedef EhsaeyatList = List<EhsaeyatEntity>?;

class Ehsaeyat extends EhsaeyatEntity {
  const Ehsaeyat({
    super.id,
    super.title,
    super.notes,
  });

  factory Ehsaeyat.fromJson(Map<String, dynamic> json) => Ehsaeyat(
        id: json['id'],
        title: json['title'],
        notes: json['notes'],
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'title': title,
        'notes': notes,
      };
}
