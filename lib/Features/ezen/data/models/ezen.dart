import 'package:elkhlod/Features/ezen/domain/entities/ezen_entity.dart';

typedef AllEzenList = List<EzenEntity>?;

class Ezen extends EzenEntity {
  const Ezen(
      {super.eznId,
      super.eznRkm,
      super.eznDate,
      super.empName,
      super.no3Ezn,
      super.no3EznName,
      super.fatraN,
      super.fromHour,
      super.toHour,
      super.totalMin,
      super.reason,
      super.suspend,
      super.talabNowWith,
      super.currentFromId,
      super.currentToId,
      super.currentToEmpId,
      super.empIdFk,
      super.directManagerIdFk,
      super.suspendReason,
      super.haletTalab,
      super.egrat,
      super.editDelete});

  factory Ezen.fromJson(Map<String, dynamic> json) => Ezen(
        eznId: json['ezn_id'],
        eznRkm: json['ezn_rkm'],
        eznDate: json['ezn_date'],
        empName: json['emp_name'],
        no3Ezn: json['no3_ezn'],
        no3EznName: json['no3_ezn_name'],
        fatraN: json['fatra_n'],
        fromHour: json['from_hour'],
        toHour: json['to_hour'],
        totalMin: json['total_min'],
        reason: json['reason'],
        suspend: json['suspend'],
        talabNowWith: json['talab_now_with'],
        currentFromId: json['current_from_id'],
        currentToId: json['current_to_id'],
        currentToEmpId: json['current_to_emp_id'],
        empIdFk: json['emp_id_fk'],
        directManagerIdFk: json['direct_manager_id_fk'],
        suspendReason: json['suspend_reason'],
        haletTalab: json['halet_talab'],
        egrat: json['egrat'],
        editDelete: json['edit_delete'],
      );

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['ezn_id'] = eznId;
    data['ezn_rkm'] = eznRkm;
    data['ezn_date'] = eznDate;
    data['emp_name'] = empName;
    data['no3_ezn'] = no3Ezn;
    data['no3_ezn_name'] = no3EznName;
    data['fatra_n'] = fatraN;
    data['from_hour'] = fromHour;
    data['to_hour'] = toHour;
    data['total_min'] = totalMin;
    data['reason'] = reason;
    data['suspend'] = suspend;
    data['talab_now_with'] = talabNowWith;
    data['current_from_id'] = currentFromId;
    data['current_to_id'] = currentToId;
    data['current_to_emp_id'] = currentToEmpId;
    data['emp_id_fk'] = empIdFk;
    data['direct_manager_id_fk'] = directManagerIdFk;
    data['suspend_reason'] = suspendReason;
    data['halet_talab'] = haletTalab;
    data['egrat'] = egrat;
    data['edit_delete'] = editDelete;
    return data;
  }
}
