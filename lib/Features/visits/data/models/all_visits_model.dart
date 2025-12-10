import 'package:elkhlod/Features/visits/domain/entities/visits_entity.dart';
import 'package:elkhlod/core/utils/functions/base_one_response.dart';

class VisitsListModel extends BaseOneResponse {
  const VisitsListModel({
    super.status,
    super.data,
    super.message,
  });

  factory VisitsListModel.fromJson(Map<String, dynamic> json) {
    return VisitsListModel(
      status: json['status'] as int?,
      message: json['message'] as String?,
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => Visit.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() =>
      {'status': status, 'message': message, 'data': data};
}

typedef VisitsTList = List<VisitEntity>?;

class Visit extends VisitEntity {
  const Visit({
    super.visitId,
    super.visitDate,
    super.visitTime,
    super.visitTitle,
    super.hesa,
    super.numStd,
    super.fasl,
    super.moshrefIdFk,
    super.visitNotes,
    super.teacherIdFk,
    super.teacherName,
    super.percent,
    super.haveEgraa,
    super.visitDetails,
  });

  factory Visit.fromJson(Map<String, dynamic> json) => Visit(
        visitId: json['visit_id'],
        visitDate: json['visit_date'],
        visitTime: json['visit_time'],
        visitTitle: json['visit_title'],
        hesa: json['hesa'],
        numStd: json['num_std'],
        fasl: json['fasl'],
        moshrefIdFk: json['moshref_id_fk'],
        visitNotes: json['visit_notes'],
        teacherIdFk: json['teacher_id_fk'],
        teacherName: json['teacher_name'],
        percent: json['percent'],
        haveEgraa: json['have_egraa'],
        visitDetails: (json['visit_details'] as List<dynamic>?)
            ?.map((item) => VisitDetail.fromJson(item))
            .toList(),
      );

  Map<String, dynamic> toJson() => {
        'visit_id': visitId,
        'visit_date': visitDate,
        'visit_time': visitTime,
        'visit_title': visitTitle,
        'hesa': hesa,
        'num_std': numStd,
        'fasl': fasl,
        'moshref_id_fk': moshrefIdFk,
        'visit_notes': visitNotes,
        'teacher_id_fk': teacherIdFk,
        'teacher_name': teacherName,
        'percent': percent,
        'have_egraa': haveEgraa,
        'visit_details': visitDetails
            ?.map((detail) => (detail as VisitDetail).toJson())
            .toList(),
      };
}

class VisitDetail extends VisitDetailEntity {
  const VisitDetail(
      {super.id,
      super.bandIdFk,
      super.degree,
      super.maxDegree,
      super.bandName,
      super.notes});

  factory VisitDetail.fromJson(Map<String, dynamic> json) => VisitDetail(
        id: json['id'],
        bandIdFk: json['band_id_fk'],
        degree: json['degree'],
        maxDegree: json['max_degree'],
        bandName: json['band_name'],
        notes: json['band_note'],
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'band_id_fk': bandIdFk,
        'degree': degree,
        'max_degree': maxDegree,
        'band_name': bandName,
        'band_note': notes
      };
}
