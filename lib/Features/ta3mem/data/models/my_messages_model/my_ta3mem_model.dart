import 'ta3mem.dart';

class MyTa3memModel {
  int? status;
  String? message;
  List<T3amem>? data;

  MyTa3memModel({this.status, this.message, this.data});

  factory MyTa3memModel.fromJson(Map<String, dynamic> json) {
    return MyTa3memModel(
      status: json['status'] as int?,
      message: json['message'] as String?,
      data: (json['data'] != null)
          ? (json['data'] as List<dynamic>?)
              ?.map((e) => T3amem.fromJson(e as Map<String, dynamic>))
              .toList()
          : null,
    );
  }

  Map<String, dynamic> toJson() => {
        'status': status,
        'message': message,
        'data': data?.map((e) => e.toJson()).toList(),
      };
}
