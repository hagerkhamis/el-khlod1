import 'package:elkhlod/core/utils/functions/base_one_response.dart';

import '../../domain/entities/wathaek_entity.dart';

class WathaekListModel extends BaseOneResponse {
  const WathaekListModel({
    super.status,
    super.data,
    super.message,
  });

  factory WathaekListModel.fromJson(Map<String, dynamic> json) {
    return WathaekListModel(
      status: json['status'] as int?,
      message: json['message'] as String?,
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => Wathaek.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() =>
      {'status': status, 'message': message, 'data': data};
}

typedef WathaekList = List<WathaekEntity>?;

class Wathaek extends WathaekEntity {
  const Wathaek({
    super.id,
    super.editDelete,
    super.empIdFk,
    super.empName,
    super.haletTalab,
    super.notes,
    super.suspend,
    super.radNotes,
    super.sendDateAr,
    super.sendTime,
    super.title,
    super.allImages,
    super.empId,
    super.sendDate,
  });

  factory Wathaek.fromJson(Map<String, dynamic> json) => Wathaek(
        id: json['id'],
        editDelete: json['edit_delete'],
        empIdFk: json['emp_id_fk'],
        empName: json['emp_name'],
        haletTalab: json['halet_talab'],
        notes: json['notes'],
        suspend: json['suspend'],
        radNotes: json['rad_notes'],
        sendDateAr: json['send_date_ar'],
        sendTime: json['send_time'],
        title: json['title'],
        allImages: (json['all_images'] as List<dynamic>?)
            ?.map((e) => AllImages.fromJson(e as Map<String, dynamic>))
            .toList(),
        empId: json['emp_id'],
        sendDate: json['send_date'],
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'edit_delete': editDelete,
        'emp_id_fk': empIdFk,
        'emp_name': empName,
        'halet_talab': haletTalab,
        'notes': notes,
        'suspend': suspend,
        'rad_notes': radNotes,
        'send_date_ar': sendDateAr,
        'send_time': sendTime,
        'title': title,
        'all_images': allImages,
        'emp_id': empId,
        'send_date': sendDate,
      };
}

class AllImages extends AllImagesEntity {
  const AllImages({
    super.fileName,
    super.id,
    super.mainIdFk,
    super.uploadedOn,
  });

  factory AllImages.fromJson(Map<String, dynamic> json) => AllImages(
        fileName: json['file_name'],
        id: json['id'],
        mainIdFk: json['main_id_fk'],
        uploadedOn: json['uploaded_on'],
      );

  Map<String, dynamic> toJson() => {
        'file_name': fileName,
        'id': id,
        'main_id_fk': mainIdFk,
        'uploaded_on': uploadedOn,
      };
}
