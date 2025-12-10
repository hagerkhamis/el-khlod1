import '../../domain/entities/send_message_entity.dart';

class SendMessageModel extends SendMessageEntity {
  int? status;
  String? message;

  SendMessageModel({this.status, this.message})
      : super(
          doneMessage: message!,
        );

  factory SendMessageModel.fromJson(Map<String, dynamic> json) =>
      SendMessageModel(
        status: json['status'] as int?,
        message: json['message'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'status': status,
        'message': message,
      };
}
