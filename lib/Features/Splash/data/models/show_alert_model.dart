import 'package:elkhlod/Features/Splash/data/models/show_alert.dart';
import 'package:elkhlod/core/utils/functions/base_one_response.dart';

class ShowAlertModel extends BaseOneResponse {
  const ShowAlertModel({super.status, super.message, super.data});

  factory ShowAlertModel.fromJson(Map<String, dynamic> json) {
    return ShowAlertModel(
        status: json['status'] as int?,
        message: json['message'] as String?,
        data: json['data'] != null ? ShowAlert.fromJson(json['data']) : null);
  }

  Map<String, dynamic> toJson() =>
      {'status': status, 'message': message, 'data': data};
}
