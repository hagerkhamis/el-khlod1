import 'package:elkhlod/core/utils/functions/base_one_response.dart';

import 'ehsaeyat_table_data.dart';

class EhsaeyatTableDataModel extends BaseOneResponse {
  const EhsaeyatTableDataModel({
    super.status,
    super.data,
    super.message,
  });

  factory EhsaeyatTableDataModel.fromJson(Map<String, dynamic> json) {
    return EhsaeyatTableDataModel(
      status: json['status'] as int?,
      message: json['message'] as String?,
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => EhsaeyatTableData.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() => {
        'status': status,
        'message': message,
        'data': data?.map((e) => e.toJson()).toList(),
      };
}
