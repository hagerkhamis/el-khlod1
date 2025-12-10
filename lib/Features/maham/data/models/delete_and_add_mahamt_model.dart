import '../../domain/entities/delete_mobadarat_entity.dart';

class DeleteAndAddMahamtModel extends DeleteMobadaratEntity {
  int? status;
  String? message;

  DeleteAndAddMahamtModel({this.status, this.message})
      : super(
          doneMessage: message!,
        );

  factory DeleteAndAddMahamtModel.fromJson(Map<String, dynamic> json) =>
      DeleteAndAddMahamtModel(
        status: json['status'] as int?,
        message: json['message'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'status': status,
        'message': message,
      };
}
