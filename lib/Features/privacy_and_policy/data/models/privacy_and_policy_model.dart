import 'package:elkhlod/Features/privacy_and_policy/domain/entities/privacy_and_policy_entity.dart';

class PrivacyAndPolicyModel extends PrivacyAndPolicyEntity {
  int? status;
  String? message;
  String? data;

  PrivacyAndPolicyModel({this.status, this.message, this.data})
      : super(
          responseMessage: message!,
          statusCode: status!,
          responseData: data!,
        );

  factory PrivacyAndPolicyModel.fromJson(Map<String, dynamic> json) {
    return PrivacyAndPolicyModel(
      status: json['status'] as int?,
      message: json['message'] as String?,
      data: json['data'] as String?,
    );
  }

  Map<String, dynamic> toJson() => {
        'status': status,
        'message': message,
        'data': data,
      };
}
