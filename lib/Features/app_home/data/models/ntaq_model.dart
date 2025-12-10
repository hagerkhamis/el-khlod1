import 'package:elkhlod/Features/app_home/domain/entities/ntaq_model_entity.dart';
import 'package:elkhlod/core/utils/functions/base_one_response.dart';

class NtaqModel extends BaseOneResponse {
  const NtaqModel({
    super.status,
    super.data,
    super.message,
  });

  factory NtaqModel.fromJson(Map<String, dynamic> json) {
    return NtaqModel(
        status: json['status'] as int?,
        message: json['message'] as String?,
        data: Ntaq.fromJson(json['data'] as Map<String, dynamic>));
  }

  Map<String, dynamic> toJson() =>
      {'status': status, 'message': message, 'data': data};
}

class Ntaq extends NtaqEntity {
  const Ntaq({
    super.title,
    super.netaqColor,
    super.netaqMsg,
    super.netaqType,
    super.netaqImg,
    super.point,
    super.netaqStars,
    super.fontColor,
    super.netaqColor1,
    super.netaqColor2,
    super.netaqColor3,
  });

  factory Ntaq.fromJson(Map<String, dynamic> json) => Ntaq(
      title: json['title'],
      netaqColor: json['netaq_color'],
      netaqMsg: json['netaq_msg'],
      netaqType: json['netaq_type'],
      point: json['point'],
      netaqImg: json['netaq_img'],
      fontColor: json['font_color'],
      netaqColor1: json['netaq_color_1'],
      netaqColor2: json['netaq_color_2'],
      netaqColor3: json['netaq_color_3'],
      netaqStars: json['netaq_stars']);

  Map<String, dynamic> toJson() => {
        'title': title,
        'netaq_msg': netaqMsg,
        'netaq_type': netaqType,
        'netaq_color': netaqColor,
        'point': point,
        'netaq_img': netaqImg,
        'font_color': fontColor,
        'netaq_color_1': netaqColor1,
        'netaq_color_2': netaqColor2,
        'netaq_color_3': netaqColor3,
        'netaq_stars': netaqStars
      };
}
