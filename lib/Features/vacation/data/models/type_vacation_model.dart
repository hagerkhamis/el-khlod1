import 'types.dart';

class VacationModel {
  int? status;
  String? message;
  List<Types>? data;

  VacationModel({this.status, this.message, this.data});

  factory VacationModel.fromJson(Map<String, dynamic> json) {
    return VacationModel(
      status: json['status'] as int?,
      message: json['message'] as String?,
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => Types.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() => {
        'status': status,
        'message': message,
        'data': data?.map((e) => e.toJson()).toList(),
      };
}
