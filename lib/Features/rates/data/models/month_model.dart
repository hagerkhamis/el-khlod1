import 'package:elkhlod/Features/rates/domain/entities/month_entity.dart';

import '../../../../core/utils/functions/base_one_response.dart';

class MonthsModel extends BaseOneResponse {
  const MonthsModel({
    super.status,
    super.data,
    super.message,
  });

  factory MonthsModel.fromJson(Map<String, dynamic> json) {
    return MonthsModel(
      status: json['status'] as int?,
      message: json['message'] as String?,
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => MonthModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() => {
        'status': status,
        'message': message,
        'data': data?.map((e) => e.toJson()).toList(),
      };
}

typedef MonthList = List<MonthEntity>?;

class MonthModel extends MonthEntity {
  const MonthModel({
    super.monthId,
    super.monthName,
  });

  factory MonthModel.fromJson(Map<String, dynamic> json) => MonthModel(
        monthId: json["month_id"],
        monthName: json["month_name"],
      );

  Map<String, dynamic> toJson() => {
        "month_id": monthId,
        "month_name": monthName,
      };
}
