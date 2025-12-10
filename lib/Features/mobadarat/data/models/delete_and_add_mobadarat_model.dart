import '../../domain/entities/delete_mobadarat_entity.dart';

class DeleteAndAddMobadaratModel extends DeleteMobadaratEntity {
  int? status;
  String? message;

  DeleteAndAddMobadaratModel({this.status, this.message})
      : super(
          doneMessage: message!,
        );

  factory DeleteAndAddMobadaratModel.fromJson(Map<String, dynamic> json) =>
      DeleteAndAddMobadaratModel(
        status: json['status'] as int?,
        message: json['message'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'status': status,
        'message': message,
      };
}
