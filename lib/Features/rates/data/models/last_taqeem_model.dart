import 'package:elkhlod/Features/rates/domain/entities/last_taqeem_entity.dart';

import '../../../../core/utils/functions/base_one_response.dart';

class LastTaqeemModel extends BaseOneResponse {
  const LastTaqeemModel({
    super.status,
    super.data,
    super.message,
  });

  factory LastTaqeemModel.fromJson(Map<String, dynamic> json) {
    return LastTaqeemModel(
      status: json['status'] as int?,
      message: json['message'] as String?,
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => LastTaqeem.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() => {
        'status': status,
        'message': message,
        'data': data?.map((e) => e.toJson()).toList(),
      };
}

typedef LastTaqeemList = List<LastTaqeemEntity>?;

class LastTaqeem extends LastTaqeemEntity {
  const LastTaqeem({
    super.id,
    super.typeId,
    super.title,
    super.maxDegree,
    super.typeName,
    super.taqeemId,
    super.taqeemDate,
    super.totalDegree,
    super.forMonth,
    super.forYear,
    super.employee,
    super.empCode,
    super.cardNum,
    super.mosmaWazefyName,
    super.phoneNumber,
    super.percent,
    super.total,
    super.haveEgraa,
    super.taqeemDetails,
    super.forEmpId,
  });

  factory LastTaqeem.fromJson(Map<String, dynamic> json) => LastTaqeem(
      id: json["emp_id"],
      taqeemId: json["taqeem_id"],
      taqeemDate: json["taqeem_date"],
      totalDegree: json["total_degree"],
      forMonth: json["for_month"],
      forYear: json["for_year"],
      employee: json["employee"],
      empCode: json["emp_code"],
      cardNum: json["card_num"],
      mosmaWazefyName: json["mosma_wazefy_name"],
      phoneNumber: json["phone_number"],
      percent: json["percent"],
      total: json["total"],
      haveEgraa: json["have_egraa"],
      taqeemDetails: (json["taqeem_details"] as List<dynamic>?)
          ?.map((e) => TaqeemDetailsModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      forEmpId: json["for_emp_id"]);

  Map<String, dynamic> toJson() => {
        "emp_id": id,
        "taqeem_id": taqeemId,
        "taqeem_date": taqeemDate,
        "total_degree": totalDegree,
        "for_month": forMonth,
        "for_year": forYear,
        "employee": employee,
        "emp_code": empCode,
        "card_num": cardNum,
        "mosma_wazefy_name": mosmaWazefyName,
        "phone_number": phoneNumber,
        "percent": percent,
        "total": total,
        "have_egraa": haveEgraa,
        "taqeem_details": taqeemDetails,
        "for_emp_id": forEmpId
      };
}

class TaqeemDetailsModel extends TaqeemDetailsEntity {
  const TaqeemDetailsModel({
    super.id,
    super.bandIdFk,
    super.degree,
    super.maxDegree,
    super.bandName,
  });

  factory TaqeemDetailsModel.fromJson(Map<String, dynamic> json) =>
      TaqeemDetailsModel(
        id: json["id"],
        bandIdFk: json["band_id_fk"],
        degree: json["degree"],
        maxDegree: json["max_degree"],
        bandName: json["band_name"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "band_id_fk": bandIdFk,
        "degree": degree,
        "max_degree": maxDegree,
        "band_name": bandName,
      };
}
