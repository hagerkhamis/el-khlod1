import 'package:equatable/equatable.dart';


class EzenEntity extends Equatable {
  final String? eznId;
  final String? eznRkm;
  final String? eznDate;
  final String? empName;
  final String? no3Ezn;
  final String? no3EznName;
  final String? fatraN;
  final String? fromHour;
  final String? toHour;
  final String? totalMin;
  final String? reason;
  final String? suspend;
  final String? talabNowWith;
  final String? currentFromId;
  final String? currentToId;
  final String? currentToEmpId;
  final String? empIdFk;
  final String? directManagerIdFk;
  final dynamic suspendReason;
  final String? haletTalab;
  final dynamic egrat;
  final dynamic editDelete;

  const EzenEntity(
      {this.eznId,
      this.eznRkm,
      this.eznDate,
      this.empName,
      this.no3Ezn,
      this.no3EznName,
      this.fatraN,
      this.fromHour,
      this.toHour,
      this.totalMin,
      this.reason,
      this.suspend,
      this.talabNowWith,
      this.currentFromId,
      this.currentToId,
      this.currentToEmpId,
      this.empIdFk,
      this.directManagerIdFk,
      this.suspendReason,
      this.haletTalab,
      this.egrat,
      this.editDelete});

  @override
  List<Object?> get props => [
        eznId,
        eznRkm,
        eznDate,
        empName,
        no3Ezn,
        no3EznName,
        fatraN,
        fromHour,
        toHour,
        totalMin,
        reason,
        suspend,
        talabNowWith,
        currentFromId,
        currentToId,
        currentToEmpId,
        empIdFk,
        directManagerIdFk,
        suspendReason,
        haletTalab,
        egrat,
        editDelete,
      ];
}
