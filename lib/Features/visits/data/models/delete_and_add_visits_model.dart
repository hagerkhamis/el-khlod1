import '../../domain/entities/delete_visits_entity.dart';

class DeleteAndAddVisitsModel extends DeleteVisitsEntity {
  int? status;
  String? message;

  DeleteAndAddVisitsModel({this.status, this.message})
      : super(
          doneMessage: message!,
        );

  factory DeleteAndAddVisitsModel.fromJson(Map<String, dynamic> json) =>
      DeleteAndAddVisitsModel(
        status: json['status'] as int?,
        message: json['message'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'status': status,
        'message': message,
      };
}
