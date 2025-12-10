typedef AllEnzaratList = List<Enzarat>?;

class Enzarat {
  String? id;
  String? empName;
  String? empNameId;
  String? empUserId;
  String? empEdara;
  String? empEdaraId;
  String? empQesm;
  String? empQesmId;
  String? enzarType;
  String? enzarTypeId;
  String? details;
  String? enzarTime;
  String? enzarDate;
  String? enzarDateAr;
  dynamic currentFromUserId;
  dynamic currentFromUserName;
  dynamic currentToUserId;
  dynamic currentToUserName;
  String? sendToHr;
  String? sendToEmp;
  String? actionsSends;
  dynamic hrNotes;
  String? seen;
  dynamic seenDate;
  dynamic seenTime;

  Enzarat(
      {this.id,
      this.empName,
      this.empNameId,
      this.empUserId,
      this.empEdara,
      this.empEdaraId,
      this.empQesm,
      this.empQesmId,
      this.enzarType,
      this.enzarTypeId,
      this.details,
      this.enzarTime,
      this.enzarDate,
      this.enzarDateAr,
      this.currentFromUserId,
      this.currentFromUserName,
      this.currentToUserId,
      this.currentToUserName,
      this.sendToHr,
      this.sendToEmp,
      this.actionsSends,
      this.hrNotes,
      this.seen,
      this.seenDate,
      this.seenTime});

  Enzarat.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    empName = json['emp_name'];
    empNameId = json['emp_name_id'];
    empUserId = json['emp_user_id'];
    empEdara = json['emp_edara'];
    empEdaraId = json['emp_edara_id'];
    empQesm = json['emp_qesm'];
    empQesmId = json['emp_qesm_id'];
    enzarType = json['enzar_type'];
    enzarTypeId = json['enzar_type_id'];
    details = json['details'];
    enzarTime = json['enzar_time'];
    enzarDate = json['enzar_date'];
    enzarDateAr = json['enzar_date_ar'];
    currentFromUserId = json['current_from_user_id'];
    currentFromUserName = json['current_from_user_name'];
    currentToUserId = json['current_to_user_id'];
    currentToUserName = json['current_to_user_name'];
    sendToHr = json['send_to_hr'];
    sendToEmp = json['send_to_emp'];
    actionsSends = json['actions_sends'];
    hrNotes = json['hr_notes'];
    seen = json['seen'];
    seenDate = json['seen_date'];
    seenTime = json['seen_time'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['emp_name'] = empName;
    data['emp_name_id'] = empNameId;
    data['emp_user_id'] = empUserId;
    data['emp_edara'] = empEdara;
    data['emp_edara_id'] = empEdaraId;
    data['emp_qesm'] = empQesm;
    data['emp_qesm_id'] = empQesmId;
    data['enzar_type'] = enzarType;
    data['enzar_type_id'] = enzarTypeId;
    data['details'] = details;
    data['enzar_time'] = enzarTime;
    data['enzar_date'] = enzarDate;
    data['enzar_date_ar'] = enzarDateAr;
    data['current_from_user_id'] = currentFromUserId;
    data['current_from_user_name'] = currentFromUserName;
    data['current_to_user_id'] = currentToUserId;
    data['current_to_user_name'] = currentToUserName;
    data['send_to_hr'] = sendToHr;
    data['send_to_emp'] = sendToEmp;
    data['actions_sends'] = actionsSends;
    data['hr_notes'] = hrNotes;
    data['seen'] = seen;
    data['seen_date'] = seenDate;
    data['seen_time'] = seenTime;
    return data;
  }
}
