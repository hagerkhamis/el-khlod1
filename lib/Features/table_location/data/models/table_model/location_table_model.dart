import 'package:elkhlod/core/utils/functions/base_one_response.dart';

import 'location_table_hodoor.dart';

class LocationTableModel extends BaseOneResponse {
  const LocationTableModel({
    super.status,
    super.data,
    super.message,
  });

  factory LocationTableModel.fromJson(Map<String, dynamic> json) {
    return LocationTableModel(
      status: json['status'] as int?,
      message: json['message'] as String?,
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => LocationTableHodoor.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() => {
        'status': status,
        'message': message,
        'data': data?.map((e) => e.toJson()).toList(),
      };
}
