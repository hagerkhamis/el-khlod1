import 'package:elkhlod/core/utils/functions/base_one_response.dart';

import 'maham_table_hodoor.dart';

class MahamTableModel extends BaseOneResponse {
  const MahamTableModel({
    super.status,
    super.data,
    super.message,
  });

  factory MahamTableModel.fromJson(Map<String, dynamic> json) {
    return MahamTableModel(
      status: json['status'] as int?,
      message: json['message'] as String?,
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => MahamTableHodoor.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() => {
        'status': status,
        'message': message,
        'data': data?.map((e) => e.toJson()).toList(),
      };
}
