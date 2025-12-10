typedef TypeVacationList = List<Types>?;

class Types {
  String? vacationId;
  String? vacationName;
  String? mowazfBadel;
  String? minDays;
  String? maxDays;

  Types(
      {this.vacationId,
      this.vacationName,
      this.mowazfBadel,
      this.minDays,
      this.maxDays});

  Types.fromJson(Map<String, dynamic> json) {
    vacationId = json['vacation_id'];
    vacationName = json['vacation_name'];
    mowazfBadel = json['mowazf_badel'];
    minDays = json['min_days'];
    maxDays = json['max_days'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['vacation_id'] = vacationId;
    data['vacation_name'] = vacationName;
    data['mowazf_badel'] = mowazfBadel;
    data['min_days'] = minDays;
    data['max_days'] = maxDays;
    return data;
  }
}
