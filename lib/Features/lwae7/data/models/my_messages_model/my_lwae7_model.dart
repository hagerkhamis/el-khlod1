import 'package:elkhlod/core/utils/functions/base_one_response.dart';

import 'lwae7.dart';

class MyLwae7Model extends BaseOneResponse {
  const MyLwae7Model({
    super.status,
    super.data,
    super.message,
  });

  factory MyLwae7Model.fromJson(Map<String, dynamic> json) {
    return MyLwae7Model(
      status: json['status'] as int?,
      message: json['message'] as String?,
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => Lwae7.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() => {
        'status': status,
        'message': message,
        'data': data?.map((e) => e.toJson()).toList(),
      };
}
