import 'package:equatable/equatable.dart';

class TableEntity extends Equatable {
  final dynamic hodoorId;
  final dynamic basmaDate;
  final dynamic dwamHdoorTime;
  final dynamic hdoorTime;
  final dynamic lateMin;
  final dynamic hdoorImgPath;
  final dynamic dwamEnsrafTime;
  final dynamic ensrafTime;
  final dynamic mobakerMin;
  final dynamic ensrafImgPath;
  final dynamic dayName;

  const TableEntity({
    this.hodoorId,
    this.basmaDate,
    this.dwamHdoorTime,
    this.hdoorTime,
    this.lateMin,
    this.hdoorImgPath,
    this.dwamEnsrafTime,
    this.ensrafTime,
    this.mobakerMin,
    this.ensrafImgPath,
    this.dayName,
  });

  @override
  List<Object?> get props => [
        hodoorId,
        basmaDate,
        dwamHdoorTime,
        hdoorTime,
        lateMin,
        hdoorImgPath,
        dwamEnsrafTime,
        ensrafTime,
        mobakerMin,
        ensrafImgPath,
        dayName,
      ];
}
