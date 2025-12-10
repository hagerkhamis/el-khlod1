import 'package:elkhlod/Features/ezen/domain/entities/delete_ezen_entity.dart';

class DeleteAndAddEzenModel extends DeleteEzenEntity {
  int? status;
  String? message;

  DeleteAndAddEzenModel({this.status, this.message})
      : super(
          doneMessage: message!,
        );

  factory DeleteAndAddEzenModel.fromJson(Map<String, dynamic> json) =>
      DeleteAndAddEzenModel(
        status: json['status'] as int?,
        message: json['message'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'status': status,
        'message': message,
      };
}
