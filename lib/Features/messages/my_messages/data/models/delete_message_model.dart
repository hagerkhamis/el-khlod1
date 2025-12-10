import 'package:elkhlod/Features/messages/my_messages/domain/entities/delete_message_entity.dart';

class DeleteMessageModel extends DeleteMessageEntity {
  int? status;
  String? message;
  dynamic data;

  DeleteMessageModel({this.status, this.message, this.data})
      : super(
          messageResponse: message!,
          statusCode: status!,
        );

  factory DeleteMessageModel.fromJson(Map<String, dynamic> json) {
    return DeleteMessageModel(
      status: json['status'] as int?,
      message: json['message'] as String?,
      data: json['data'] as dynamic,
    );
  }

  Map<String, dynamic> toJson() => {
        'status': status,
        'message': message,
        'data': data,
      };
}
