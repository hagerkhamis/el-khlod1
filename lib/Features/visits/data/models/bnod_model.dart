import 'package:elkhlod/Features/visits/domain/entities/bnod_entity.dart';
import 'package:elkhlod/core/utils/functions/base_one_response.dart';

class BnodModel extends BaseOneResponse {
  const BnodModel({
    super.status,
    super.data,
    super.message,
  });

  factory BnodModel.fromJson(Map<String, dynamic> json) {
    return BnodModel(
      status: json['status'] as int?,
      message: json['message'] as String?,
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => Band.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() => {
        'status': status,
        'message': message,
        'data': data?.map((e) => (e as Band).toJson()).toList(),
      };
}

typedef BandsTList = List<BnodEntity>?;

class Band extends BnodEntity {
  const Band({
    super.bandId,
    super.bandName,
    super.maxDegree,
  });

  factory Band.fromJson(Map<String, dynamic> json) => Band(
        bandId: json['band_id'],
        bandName: json['band_name'],
        maxDegree: json['max_degree'],
      );

  Map<String, dynamic> toJson() => {
        'band_id': bandId,
        'band_name': bandName,
        'max_degree': maxDegree,
      };
}
