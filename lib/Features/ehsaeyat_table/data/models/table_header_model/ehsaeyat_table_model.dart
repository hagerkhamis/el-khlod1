import 'package:elkhlod/Features/ehsaeyat_table/data/models/table_header_model/ehsaeyat_table.dart';
import 'package:elkhlod/core/utils/functions/base_one_response.dart';

class EhsaeyatTableModel extends BaseOneResponse {
  const EhsaeyatTableModel({
    super.status,
    super.data,
    super.message,
  });

  factory EhsaeyatTableModel.fromJson(Map<String, dynamic> json) {
    return EhsaeyatTableModel(
      status: json['status'] as int?,
      message: json['message'] as String?,
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => EhsaeyatTable.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() => {
        'status': status,
        'message': message,
        'data': data?.map((e) => e.toJson()).toList(),
      };
}
