import 'package:equatable/equatable.dart';

class MahamTableEntity extends Equatable {
  final String? id;
  final String? empIdFk;
  final String? sendEmpName;
  final String? mohmaGeha;
  final String? mohmaDate;
  final String? mohmaTime;
  final String? mohmaReason;
  final String? mLat;
  final String? mLong;
  final String? empImg;
  final String? publisher;
  final String? dayName;

  const MahamTableEntity({
    this.id,
    this.empIdFk,
    this.sendEmpName,
    this.mohmaGeha,
    this.mohmaDate,
    this.mohmaTime,
    this.mohmaReason,
    this.mLat,
    this.mLong,
    this.empImg,
    this.publisher,
    this.dayName,
  });

  @override
  List<Object?> get props => [
        id,
        empIdFk,
        sendEmpName,
        mohmaGeha,
        mohmaDate,
        mohmaTime,
        mohmaReason,
        mLat,
        mLong,
        empImg,
        publisher,
        dayName
      ];
}
