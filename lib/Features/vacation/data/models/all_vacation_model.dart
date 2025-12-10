import 'vacation.dart';

class AllVacationModel {
  int? status;
  String? message;
  List<Vacation>? data;

  AllVacationModel({this.status, this.message, this.data});

  factory AllVacationModel.fromJson(Map<String, dynamic> json) {
    return AllVacationModel(
      status: json['status'] as int?,
      message: json['message'] as String?,
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => Vacation.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() => {
        'status': status,
        'message': message,
        'data': data?.map((e) => e.toJson()).toList(),
      };
}
