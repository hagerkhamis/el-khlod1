import 'package:elkhlod/Features/table_location/domain/entities/new_table_entity.dart';

typedef LocationTableList = List<LocationTableEntity>?;

class LocationTableHodoor extends LocationTableEntity {
  const LocationTableHodoor(
      {super.empIdFk,
      super.empName,
      super.ensrafDate,
      super.hdoorTime,
      super.hdoorDate,
      super.id,
      super.ensrafTime,
      super.siteIdFk,
      super.siteName,
      super.tasgelDate,
      super.dayName});

  factory LocationTableHodoor.fromJson(Map<String, dynamic> json) =>
      LocationTableHodoor(
          id: json['id'],
          empIdFk: json['emp_id_fk'],
          empName: json['emp_name'],
          hdoorDate: json['hdoor_date'],
          hdoorTime: json['hdoor_time'],
          ensrafDate: json['ensraf_date'],
          ensrafTime: json['ensraf_time'],
          siteIdFk: json['site_id_fk'],
          siteName: json['site_name'],
          tasgelDate: json['tasgel_date'],
          dayName: json['day_name']);

  Map<String, dynamic> toJson() => {
        'id': id,
        'emp_id_fk': empIdFk,
        'emp_name': empName,
        'hdoor_date': hdoorDate,
        'hdoor_time': hdoorTime,
        'ensraf_date': ensrafDate,
        'ensraf_time': ensrafTime,
        'site_id_fk': siteIdFk,
        'site_name': siteName,
        'tasgel_date': tasgelDate,
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
