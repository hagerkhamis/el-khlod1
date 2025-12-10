class LocationVacationModel {
  final int moderEmpId;
  final String empPhoneNum;
  final int no3AgazaId;
  final String fromDate;
  final String toDate;
  final String reason;

  LocationVacationModel({
    required this.moderEmpId,
    required this.empPhoneNum,
    required this.no3AgazaId,
    required this.fromDate,
    required this.toDate,
    required this.reason,
  });

  factory LocationVacationModel.fromJson(Map<String, dynamic> json) {
    return LocationVacationModel(
      moderEmpId: int.parse(json['moderEmpId'].toString()),
      empPhoneNum: json['empPhoneNum']?.toString() ?? '',
      no3AgazaId: int.parse(json['no3AgazaId'].toString()),
      fromDate: json['fromDate']?.toString() ?? '',
      toDate: json['toDate']?.toString() ?? '',
      reason: json['reason']?.toString() ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'moderEmpId': moderEmpId,
      'empPhoneNum': empPhoneNum,
      'no3AgazaId': no3AgazaId,
      'fromDate': fromDate,
      'toDate': toDate,
      'reason': reason,
    };
  }
}
