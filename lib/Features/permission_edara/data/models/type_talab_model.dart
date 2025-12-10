import 'package:elkhlod/Features/permission_edara/domain/entities/talabat_type_entity.dart';
import 'package:elkhlod/core/utils/functions/base_one_response.dart';


class TalabatModel extends BaseOneResponse {
   const TalabatModel({
    super.status,
    super.data,
    super.message,
  });

  factory TalabatModel.fromJson(Map<String, dynamic> json) {
    return TalabatModel(
      status: json['status'] as int?,
      message: json['message'] as String?,
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => TalabatTypes.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() =>
      {'status': status, 'message': message, 'data': data};
}

typedef TalabatTypesList = List<TalabatTypesEntity>?;

class TalabatTypes extends TalabatTypesEntity {
  const TalabatTypes({
    super.id,
    super.title,

  });

  factory TalabatTypes.fromJson(Map<String, dynamic> json) => TalabatTypes(
        id: json['id'],
        title: json['title'],
   
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'title': title,
       
      };
}
