import 'package:equatable/equatable.dart';

class VisitEntity extends Equatable {
  final String? visitId;
  final String? visitDate;
  final String? visitTime;
  final String? visitTitle;
  final String? hesa;
  final String? numStd;
  final String? fasl;
  final String? moshrefIdFk;
  final String? visitNotes;
  final String? teacherIdFk;
  final String? teacherName;
  final String? percent;
  final String? haveEgraa;
  final List<VisitDetailEntity>? visitDetails;

  const VisitEntity({
    this.visitId,
    this.visitDate,
    this.visitTime,
    this.visitTitle,
    this.hesa,
    this.numStd,
    this.fasl,
    this.moshrefIdFk,
    this.visitNotes,
    this.teacherIdFk,
    this.teacherName,
    this.percent,
    this.haveEgraa,
    this.visitDetails,
  });

  @override
  List<Object?> get props => [
        visitId,
        visitDate,
        visitTime,
        visitTitle,
        hesa,
        numStd,
        fasl,
        moshrefIdFk,
        visitNotes,
        teacherIdFk,
        teacherName,
        percent,
        haveEgraa,
        visitDetails,
      ];
}

class VisitDetailEntity extends Equatable {
  final String? id;
  final String? bandIdFk;
  final String? degree;
  final String? maxDegree;
  final String? bandName;
  final String? notes;

  const VisitDetailEntity({
    this.id,
    this.bandIdFk,
    this.degree,
    this.maxDegree,
    this.bandName,
    this.notes,
  });

  @override
  List<Object?> get props => [
        id,
        bandIdFk,
        degree,
        maxDegree,
        bandName,
        notes,
      ];
}
