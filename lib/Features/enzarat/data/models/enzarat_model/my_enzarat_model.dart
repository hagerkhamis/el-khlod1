import 'enzarat.dart';

class MyEnzaratModel {
  int? status;
  String? message;
  List<Enzarat>? data;

  MyEnzaratModel({this.status, this.message, this.data});

  factory MyEnzaratModel.fromJson(Map<String, dynamic> json) {
    return MyEnzaratModel(
      status: json['status'] as int?,
      message: json['message'] as String?,
      data: (json['data'] != null)
          ? (json['data'] as List<dynamic>?)
              ?.map((e) => Enzarat.fromJson(e as Map<String, dynamic>))
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
