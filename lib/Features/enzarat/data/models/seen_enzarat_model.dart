import 'package:elkhlod/Features/enzarat/domain/entities/seen_ta3mem_entity.dart';

class SeenEnzaratModel extends SeenEnzaratEntity {
  int? status;
  String? message;

  SeenEnzaratModel({this.status, this.message})
      : super(
          messageResponse: message!,
          statusCode: status!,
        );

  factory SeenEnzaratModel.fromJson(Map<String, dynamic> json) {
    return SeenEnzaratModel(
      status: json['status'] as int?,
      message: json['message'] as String?,
    );
  }

  Map<String, dynamic> toJson() => {
        'status': status,
        'message': message,
      };
}
