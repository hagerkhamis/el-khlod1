import 'package:elkhlod/Features/new_bsama_add_Fingerprint/domain/entities/new_finger_print_entity.dart';

class Data extends NewFingerPrintEntity {
  const Data(
      {super.hodoorId,
      super.empCode,
      super.hdoorTime,
      super.ensrafTime,
      super.lateMin});

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        hodoorId: json['hodoor_id'],
        empCode: json['emp_code'],
        hdoorTime: json['hdoor_time'],
        ensrafTime: json['ensraf_time'],
        lateMin: json['late_min'],
      );

  Map<String, dynamic> toJson() => {
        'hodoor_id': hodoorId,
        'emp_code': empCode,
        'hdoor_time': hdoorTime,
        'ensraf_time': ensrafTime,
        'late_min': lateMin
      };
}
