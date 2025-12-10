import 'package:elkhlod/Features/ezen/domain/entities/delete_ezen_entity.dart';

class DeleteAndAddTalabatModel extends DeleteEzenEntity {
  int? status;
  String? message;

  DeleteAndAddTalabatModel({this.status, this.message})
      : super(
          doneMessage: message!,
        );

  factory DeleteAndAddTalabatModel.fromJson(Map<String, dynamic> json) =>
      DeleteAndAddTalabatModel(
        status: json['status'] as int?,
        message: json['message'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'status': status,
        'message': message,
      };
}
