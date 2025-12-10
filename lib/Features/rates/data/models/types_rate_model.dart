import 'package:elkhlod/Features/rates/domain/entities/type_rate_entity.dart';

import '../../../../core/utils/functions/base_one_response.dart';

class TypesRateModel extends BaseOneResponse {
  const TypesRateModel({
    super.status,
    super.data,
    super.message,
  });

  factory TypesRateModel.fromJson(Map<String, dynamic> json) {
    return TypesRateModel(
      status: json['status'] as int?,
      message: json['message'] as String?,
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => TypeRateModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() => {
        'status': status,
        'message': message,
        'data': data?.map((e) => e.toJson()).toList(),
      };
}

typedef AllTypesRateList = List<TypeRateEntity>?;

class TypeRateModel extends TypeRateEntity {
  const TypeRateModel({
    super.id,
    super.title,
  });

  factory TypeRateModel.fromJson(Map<String, dynamic> json) => TypeRateModel(
        id: json["id"],
        title: json["title"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
      };
}
