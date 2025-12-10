import 'package:elkhlod/Features/rates/domain/entities/bnod_taqeem_entity.dart';

import '../../../../core/utils/functions/base_one_response.dart';

class BnodTaqeemModel extends BaseOneResponse {
  const BnodTaqeemModel({
    super.status,
    super.data,
    super.message,
  });

  factory BnodTaqeemModel.fromJson(Map<String, dynamic> json) {
    return BnodTaqeemModel(
      status: json['status'] as int?,
      message: json['message'] as String?,
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => BnodTaqeem.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() => {
        'status': status,
        'message': message,
        'data': data?.map((e) => e.toJson()).toList(),
      };
}

typedef BnodTaqeemList = List<BnodTaqeemEntity>?;

class BnodTaqeem extends BnodTaqeemEntity {
  const BnodTaqeem({
    super.id,
    super.typeId,
    super.title,
    super.maxDegree,
    super.typeName,
  });

  factory BnodTaqeem.fromJson(Map<String, dynamic> json) => BnodTaqeem(
        id: json["id"],
        typeId: json["type_id"],
        title: json["title"],
        maxDegree: json["max_degree"],
        typeName: json["type_name"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "type_id": typeId,
        "title": title,
        "max_degree": maxDegree,
        "type_name": typeName,
      };
}
