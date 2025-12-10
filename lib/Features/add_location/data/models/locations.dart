import 'package:elkhlod/Features/add_location/domain/entities/locations_entity.dart';

typedef AllLocationsList = List<LocationsEntity>?;

class Locations extends LocationsEntity {
  const Locations({
    super.id,
    super.editDelete,
    super.imgPath,
    super.sendDateAr,
    super.sendTime,
    super.empName,
  });

  factory Locations.fromJson(Map<String, dynamic> json) => Locations(
        id: json["id"],
        empName: json["emp_name"],
        editDelete: json["edit_delete"],
        imgPath: json["img_path"],
        sendDateAr: json["send_date_ar"],
        sendTime: json["send_time"],
      );

  Map<String, dynamic> toJson() => {
        "mosala_id": id,
        "emp_name": empName,
        "edit_delete": editDelete,
        "img_path": imgPath,
        "send_date_ar": sendDateAr,
        "send_time": sendTime,
      };
}
