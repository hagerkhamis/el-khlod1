
 import 'package:elkhlod/core/utils/functions/base_one_response.dart';

import 'sites.dart';

class SitesModel extends BaseOneResponse {
  const SitesModel({
    super.status,
    super.data,
    super.message,
  });

  factory SitesModel.fromJson(Map<String, dynamic> json) {
    return SitesModel(
      status: json['status'] as int?,
      message: json['message'] as String?,
      data: (json['data'] != null)
          ? (json['data'] as List<dynamic>?)
              ?.map((e) => Sites.fromJson(e as Map<String, dynamic>))
              .toList()
          : null,
    );
  }

  Map<String, dynamic> toJson() => {
        'status': status,
        'message': message,
        'data': data?.map((e) => e.toJson()).toList(),
      };
}
