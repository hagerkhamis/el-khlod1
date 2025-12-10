import 'package:elkhlod/Features/ta3mem/domain/entities/seen_ta3mem_entity.dart';

class SeenTa3memModel extends SeenTa3memEntity {
  int? status;
  String? message;

  SeenTa3memModel({this.status, this.message})
      : super(
          messageResponse: message!,
          statusCode: status!,
        );

  factory SeenTa3memModel.fromJson(Map<String, dynamic> json) {
    return SeenTa3memModel(
      status: json['status'] as int?,
      message: json['message'] as String?,
    );
  }

  Map<String, dynamic> toJson() => {
        'status': status,
        'message': message,
      };
}
