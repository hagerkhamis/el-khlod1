import 'package:elkhlod/core/utils/functions/base_one_response.dart';

import 'types.dart';

class TypeEzenModel extends BaseOneResponse {
  const TypeEzenModel({super.status, super.message, super.data});

  factory TypeEzenModel.fromJson(Map<String, dynamic> json) {
    return TypeEzenModel(
      status: json['status'] as int?,
      message: json['message'] as String?,
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => Types.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() => {
        'status': status,
        'message': message,
        'data': data?.map((e) => e.toJson()).toList(),
      };
}
