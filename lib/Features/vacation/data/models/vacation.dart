typedef AllVacationList = List<Vacation>?;

class Vacation {
  String? agazaId;
  String? agazaRkm;
  String? agazaDate;
  String? empName;
  String? no3Agaza;
  String? no3AgazaName;
  String? agazaFromDateM;
  String? agazaToDateM;
  String? numDays;
  String? hospitalReport;
  String? reason;
  String? suspend;
  dynamic talabNowWith;
  String? fFile;
  String? haletTalab;
  dynamic egrat;
  dynamic editDelete;

  Vacation(
      {this.agazaId,
      this.agazaRkm,
      this.agazaDate,
      this.empName,
      this.no3Agaza,
      this.no3AgazaName,
      this.agazaFromDateM,
      this.agazaToDateM,
      this.numDays,
      this.hospitalReport,
      this.reason,
      this.suspend,
      this.talabNowWith,
      this.haletTalab,
      this.egrat,
      this.fFile,
      this.editDelete});

  Vacation.fromJson(Map<String, dynamic> json) {
    agazaId = json['agaza_id'];
    agazaRkm = json['agaza_rkm'];
    agazaDate = json['agaza_date'];
    empName = json['emp_name'];
    no3Agaza = json['no3_agaza'];
    no3AgazaName = json['no3_agaza_name'];
    agazaFromDateM = json['agaza_from_date_m'];
    agazaToDateM = json['agaza_to_date_m'];
    numDays = json['num_days'];
    hospitalReport = json['hospital_report'];
    reason = json['reason'];
    suspend = json['suspend'];
    talabNowWith = json['talab_now_with'];
    haletTalab = json['halet_talab'];
    fFile = json['f_file'];
    egrat = json['egrat'];
    editDelete = json['edit_delete'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['agaza_id'] = agazaId;
    data['agaza_rkm'] = agazaRkm;
    data['agaza_date'] = agazaDate;
    data['emp_name'] = empName;
    data['no3_agaza'] = no3Agaza;
    data['no3_agaza_name'] = no3AgazaName;
    data['agaza_from_date_m'] = agazaFromDateM;
    data['agaza_to_date_m'] = agazaToDateM;
    data['num_days'] = numDays;
    data['hospital_report'] = hospitalReport;
    data['reason'] = reason;
    data['suspend'] = suspend;
    data['talab_now_with'] = talabNowWith;
    data['halet_talab'] = haletTalab;
    data['egrat'] = egrat;
    data['f_file'] = fFile;
    data['edit_delete'] = editDelete;
    return data;
  }
}
