import 'package:elkhlod/core/utils/functions/base_one_response.dart';

import 'ezen.dart';

class AllEznModel extends BaseOneResponse {
  const AllEznModel({super.status, super.message, super.data});

  factory AllEznModel.fromJson(Map<String, dynamic> json) {
    return AllEznModel(
      status: json['status'] as int?,
      message: json['message'] as String?,
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => Ezen.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() => {
        'status': status,
        'message': message,
        'data': data?.map((e) => e.toJson()).toList(),
      };
}
