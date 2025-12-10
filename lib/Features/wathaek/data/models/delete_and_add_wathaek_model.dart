import '../../domain/entities/delete_wathaek_entity.dart';

class DeleteAndAddWathaekModel extends DeleteWathaekEntity {
  int? status;
  String? message;

  DeleteAndAddWathaekModel({this.status, this.message})
      : super(
          doneMessage: message!,
        );

  factory DeleteAndAddWathaekModel.fromJson(Map<String, dynamic> json) =>
      DeleteAndAddWathaekModel(
        status: json['status'] as int?,
        message: json['message'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'status': status,
        'message': message,
      };
}
