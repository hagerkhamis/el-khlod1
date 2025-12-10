import 'package:elkhlod/Features/app_home/domain/entities/services_entity.dart';

class MyServicesModel extends ServicesEntity {
  const MyServicesModel({
    super.status,
    super.data,
    super.message,
    super.testModeTitle,
    super.testModeType,
  });

  factory MyServicesModel.fromJson(Map<String, dynamic> json) {
    return MyServicesModel(
      status: json['status'] as int?,
      message: json['message'] as String?,
      testModeTitle: json['test_mode_title'] as String?,
      testModeType: json['test_mode_type'] as int?,
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => Service.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() => {
        'status': status,
        'message': message,
        'test_mode_title': testModeTitle,
        'test_mode_type': testModeType,
        'data': data
      };
}

typedef AllServicesList = List<ServicesEntity>?;

class Service extends ServiceEntity {
  const Service({
    super.id,
    super.title,
    super.active,
    super.pageOrder,
    super.screenNum,
    super.icon,
  });

  factory Service.fromJson(Map<String, dynamic> json) => Service(
        id: json['id'],
        title: json['title'],
        active: json['active'],
        pageOrder: json['page_order'],
        screenNum: json['screen_num'],
        icon: json['icon_path'],
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'title': title,
        'active': active,
        'page_order': pageOrder,
        'screen_num': screenNum,
        'icon_path': icon,
      };
}
