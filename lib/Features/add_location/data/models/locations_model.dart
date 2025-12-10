import 'package:elkhlod/core/utils/functions/base_one_response.dart';

import 'locations.dart';

class LocationsModel extends BaseOneResponse {
  const LocationsModel({
    super.status,
    super.data,
    super.message,
  });

  factory LocationsModel.fromJson(Map<String, dynamic> json) {
    return LocationsModel(
      status: json['status'] as int?,
      message: json['message'] as String?,
      data: (json['data'] != null)
          ? (json['data'] as List<dynamic>?)
              ?.map((e) => Locations.fromJson(e as Map<String, dynamic>))
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
