import 'package:equatable/equatable.dart';

class MosalatEntity extends Equatable {
  final String? mosalaId;
  final String? mosalaDateAr;
  final String? empName;
  final String? sendToHr;
  final dynamic answerReasons;
  final dynamic answerMobarer;
  final dynamic answerOther;
  final int? numMokalfat;
  final String? haveEgraa;
  final String? mosalaFile;
  final List<MokalfatListEntity>? mokalfatList;

  const MosalatEntity({
    this.mosalaId,
    this.mosalaDateAr,
    this.empName,
    this.sendToHr,
    this.answerReasons,
    this.answerMobarer,
    this.answerOther,
    this.numMokalfat,
    this.haveEgraa,
    this.mosalaFile,
    this.mokalfatList,
  });

  @override
  List<Object?> get props => [
        mosalaId,
        mosalaDateAr,
        empName,
        sendToHr,
        answerReasons,
        answerMobarer,
        answerOther,
        numMokalfat,
        haveEgraa,
        mosalaFile,
        mokalfatList
      ];
}

class MokalfatListEntity extends Equatable {
  final String? id;
  final String? mosalaIdFk;
  final String? mokalfaId;
  final String? mokalfaName;
  const MokalfatListEntity({
    this.id,
    this.mosalaIdFk,
    this.mokalfaId,
    this.mokalfaName,
  });
  @override
  List<Object?> get props => [
        id,
        mosalaIdFk,
        mokalfaId,
        mokalfaName,
      ];
}
