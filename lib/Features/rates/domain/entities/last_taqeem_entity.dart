import 'package:equatable/equatable.dart';

class LastTaqeemEntity extends Equatable {
  final String? id;
  final String? typeId;
  final String? title;
  final String? maxDegree;
  final String? typeName;

  final String? taqeemId;
  final String? taqeemDate;
  final String? totalDegree;
  final String? forMonth;
  final String? forYear;
  final String? employee;
  final String? empCode;
  final String? cardNum;
  final String? mosmaWazefyName;
  final String? phoneNumber;

  final String? percent;
  final String? total;

  final String? haveEgraa;

  final String? forEmpId;

  final List<TaqeemDetailsEntity>? taqeemDetails;
  const LastTaqeemEntity({
    this.id,
    this.typeId,
    this.title,
    this.maxDegree,
    this.typeName,
    this.taqeemId,
    this.taqeemDate,
    this.totalDegree,
    this.forMonth,
    this.forYear,
    this.employee,
    this.empCode,
    this.cardNum,
    this.mosmaWazefyName,
    this.phoneNumber,
    this.percent,
    this.total,
    this.haveEgraa,
    this.taqeemDetails,
    this.forEmpId,
  });

  @override
  List<Object?> get props => [
        id,
        typeId,
        title,
        maxDegree,
        typeName,
        taqeemId,
        taqeemDate,
        totalDegree,
        forMonth,
        forYear,
        employee,
        empCode,
        cardNum,
        mosmaWazefyName,
        phoneNumber,
        percent,
        total,
        haveEgraa,
        taqeemDetails,
        forEmpId
      ];
}

class TaqeemDetailsEntity extends Equatable {
  final String? id;
  final String? bandIdFk;
  final String? degree;
  final String? maxDegree;
  final String? bandName;
  const TaqeemDetailsEntity(
      {this.id, this.bandIdFk, this.degree, this.maxDegree, this.bandName});
  @override
  List<Object?> get props => [id, bandIdFk, degree, maxDegree, bandName];
}
