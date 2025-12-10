import 'package:elkhlod/Features/table/domain/entities/new_table_entity.dart';

typedef TableList = List<TableEntity>?;

class TableHodoor extends TableEntity {
  const TableHodoor(
      {super.hodoorId,
      super.basmaDate,
      super.dwamHdoorTime,
      super.hdoorTime,
      super.hdoorImgPath,
      super.dwamEnsrafTime,
      super.ensrafTime,
      super.mobakerMin,
      super.ensrafImgPath,
      super.lateMin,
      super.dayName});

  factory TableHodoor.fromJson(Map<String, dynamic> json) => TableHodoor(
        hodoorId: json['hodoor_id'],
        basmaDate: json['basma_date'],
        dwamHdoorTime: json['dwam_hdoor_time'],
        hdoorTime: json['hdoor_time'],
        hdoorImgPath: json['hdoor_img_path'],
        dwamEnsrafTime: json['dwam_ensraf_time'],
        ensrafTime: json['ensraf_time'],
        mobakerMin: json['mobaker_min'],
        ensrafImgPath: json['ensraf_img_path'],
        lateMin: json['late_min'],
        dayName: json['day_name'],
      );

  Map<String, dynamic> toJson() => {
        'hodoor_id': hodoorId,
        'basma_date': basmaDate,
        'dwam_hdoor_time': dwamHdoorTime,
        'hdoor_time': hdoorTime,
        'hdoor_img_path': hdoorImgPath,
        'dwam_ensraf_time': dwamEnsrafTime,
        'ensraf_time': ensrafTime,
        'mobaker_min': mobakerMin,
        'ensraf_img_path': ensrafImgPath,
        'late_min': lateMin,
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
