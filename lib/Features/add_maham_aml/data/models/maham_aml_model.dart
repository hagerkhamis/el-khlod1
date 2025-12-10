import 'package:elkhlod/core/utils/functions/base_one_response.dart';

class MahamAmlModel extends BaseOneResponse {
  const MahamAmlModel({
    super.status,
    // super.data,
    super.message,
  });

  factory MahamAmlModel.fromJson(Map<String, dynamic> json) {
    return MahamAmlModel(
      status: json['status'] as int?,
      message: json['message'] as String?,
      // data: (json['data'] != null)
      //     ? (json['data'] as List<dynamic>?)
      //         ?.map((e) => Locations.fromJson(e as Map<String, dynamic>))
      //         .toList()
      //     : null,
    );
  }

  Map<String, dynamic> toJson() => {
        'status': status,
        'message': message,
        // 'data': data?.map((e) => e.toJson()).toList(),
      };
}
