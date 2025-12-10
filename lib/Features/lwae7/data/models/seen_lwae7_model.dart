import '../../domain/entities/seen_lwae7_entity.dart';

class SeenLwae7Model extends SeenLwae7Entity {
  int? status;
  String? message;

  SeenLwae7Model({this.status, this.message})
      : super(
          messageResponse: message!,
          statusCode: status!,
        );

  factory SeenLwae7Model.fromJson(Map<String, dynamic> json) {
    return SeenLwae7Model(
      status: json['status'] as int?,
      message: json['message'] as String?,
    );
  }

  Map<String, dynamic> toJson() => {
        'status': status,
        'message': message,
      };
}
