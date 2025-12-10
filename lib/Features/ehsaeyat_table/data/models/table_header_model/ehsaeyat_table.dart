import 'package:elkhlod/Features/ehsaeyat_table/domain/entities/new_table_entity.dart';

typedef TableList = List<TableEntity>?;

class EhsaeyatTable extends TableEntity {
  const EhsaeyatTable({super.id, super.name});

  factory EhsaeyatTable.fromJson(Map<String, dynamic> json) => EhsaeyatTable(
        id: json['id'],
        name: json['name'],
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
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
