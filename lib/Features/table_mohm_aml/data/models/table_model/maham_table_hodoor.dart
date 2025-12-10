import 'package:elkhlod/Features/table_mohm_aml/domain/entities/new_table_entity.dart';

typedef MahamTableList = List<MahamTableEntity>?;

class MahamTableHodoor extends MahamTableEntity {
  const MahamTableHodoor({
    super.empIdFk,
    super.dayName,
    super.empImg,
    super.mLat,
    super.mLong,
    super.id,
    super.mohmaDate,
    super.mohmaTime,
    super.mohmaGeha,
    super.mohmaReason,
    super.publisher,
    super.sendEmpName,
  });

  factory MahamTableHodoor.fromJson(Map<String, dynamic> json) =>
      MahamTableHodoor(
          id: json['id'],
          empIdFk: json['emp_id_fk'],
          empImg: json['emp_img'],
          mLat: json['m_lat'],
          mLong: json['m_long'],
          mohmaDate: json['mohma_date'],
          mohmaTime: json['mohma_time'],
          mohmaGeha: json['mohma_geha'],
          mohmaReason: json['mohma_reason'],
          publisher: json['publisher'],
          sendEmpName: json['send_emp_name'],
          dayName: json['day_name']);

  Map<String, dynamic> toJson() => {
        'id': id,
        'emp_id_fk': empIdFk,
        'emp_img': empImg,
        'm_lat': mLat,
        'm_long': mLong,
        'mohma_date': mohmaDate,
        'mohma_time': mohmaTime,
        'mohma_geha': mohmaGeha,
        'mohma_reason': mohmaReason,
        'publisher': publisher,
        'send_emp_name': sendEmpName,
        'day_name': dayName
      };
}

// class Table {
//   String? hodoorId;
//   String? basmaDate;
//   dynamic dwamHdoorTime;
//   dynamic hdoorTime;
//   ddynamic hdoorImgPath;
//   String? dwamEnsrafTime;
//   String? ensrafTime;
//   String? mobakerMin;
//   String? ensrafImgPath;
//   Table(
//       {this.hodoorId,
//       this.basmaDate,
//       this.dwamHdoorTime,
//       this.hdoorTime,
//       this.hdoorImgPath,
//       this.dwamEnsrafTime,
//       this.ensrafTime,
//       this.mobakerMin,
//       this.ensrafImgPath});

//   Table.fromJson(Map<String, dynamic> json) {
//     hodoorId = json['hodoor_id'];
//     basmaDate = json['basma_date'];
//     timeHdoor = json['dwam_hdoor_time'];
//     timeEnsraf = json['hdoor_time'];
//     employee = json['late_min'];
//     timeHdoorAr = json['hdoor_img_path'];
//     timeEnsrafAr = json['dwam_ensraf_time'];
//     dayName = json['ensraf_time'];
//     hours = json['mobaker_min'];
//     minutes = json['ensraf_img_path'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = <String, dynamic>{};
//     data['hodoor_id'] = id;
//     data['basma_date'] = branchId;
//     data['dwam_hdoor_time'] = dwamId;
//     data['hdoor_time'] = employeeId;
//     data['late_min'] = timeSettingId;
//     data['hdoor_img_path'] = total;
//     data['dwam_ensraf_time'] = date;
//     data['ensraf_time'] = time;
//     data['mobaker_min'] = timeAr;
//     data['ensraf_img_path'] = type;

//     return data;
//   }
// }
