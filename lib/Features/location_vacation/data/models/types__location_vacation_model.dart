class TypeLocationVacationModel {
  int? status;
  String? message;
  List<Types>? data;

  TypeLocationVacationModel({this.status, this.message, this.data});

  factory TypeLocationVacationModel.fromJson(Map<String, dynamic> json) {
    return TypeLocationVacationModel(
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

class Types {
  String? vacationId;
  String? vacationName;
  String? mowazfBadel;
  String? minDays;
  String? maxDays;

  Types({
    this.vacationId,
    this.vacationName,
    this.mowazfBadel,
    this.minDays,
    this.maxDays,
  });

  factory Types.fromJson(Map<String, dynamic> json) {
    return Types(
      vacationId: json['vacation_id']?.toString(),
      vacationName: json['vacation_name'],
      mowazfBadel: json['mowazf_badel'],
      minDays: json['min_days']?.toString(),
      maxDays: json['max_days']?.toString(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'vacation_id': vacationId,
      'vacation_name': vacationName,
      'mowazf_badel': mowazfBadel,
      'min_days': minDays,
      'max_days': maxDays,
    };
  }
}
