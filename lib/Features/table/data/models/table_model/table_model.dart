import 'package:elkhlod/Features/table/data/models/table_model/table_hodoor.dart';
import 'package:elkhlod/core/utils/functions/base_one_response.dart';

class TableModel extends BaseOneResponse {
  const TableModel({
    super.status,
    super.data,
    super.message,
  });

  factory TableModel.fromJson(Map<String, dynamic> json) {
    return TableModel(
      status: json['status'] as int?,
      message: json['message'] as String?,
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => TableHodoor.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() => {
        'status': status,
        'message': message,
        'data': data?.map((e) => e.toJson()).toList(),
      };
}
