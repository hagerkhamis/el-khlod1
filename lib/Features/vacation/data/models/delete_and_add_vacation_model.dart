import 'package:elkhlod/Features/ezen/domain/entities/delete_ezen_entity.dart';

class DeleteAndAddVacationModel extends DeleteEzenEntity {
  int? status;
  String? message;

  DeleteAndAddVacationModel({this.status, this.message})
      : super(
          doneMessage: message!,
        );

  factory DeleteAndAddVacationModel.fromJson(Map<String, dynamic> json) =>
      DeleteAndAddVacationModel(
        status: json['status'] as int?,
        message: json['message'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'status': status,
        'message': message,
      };
}
