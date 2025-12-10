import 'package:elkhlod/Features/Splash/data/models/alert.dart';
import 'package:elkhlod/core/utils/functions/base_one_response.dart';

class AllAlertModel extends BaseOneResponse {
  const AllAlertModel({super.status, super.message, super.data});

  factory AllAlertModel.fromJson(Map<String, dynamic> json) {
    return AllAlertModel(
        status: json['status'] as int?,
        message: json['message'] as String?,
        data: json['data'] != null ? Alert.fromJson(json['data']) : null);
  }


  Map<String, dynamic> toJson() =>
      {'status': status, 'message': message, 'data': data};
}