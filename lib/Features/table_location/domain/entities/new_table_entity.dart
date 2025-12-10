import 'package:equatable/equatable.dart';

class LocationTableEntity extends Equatable {
  final String? id;
  final String? empIdFk;
  final String? empName;
  final String? siteIdFk;
  final String? siteName;
  final String? hdoorDate;
  final String? hdoorTime;
  final String? ensrafDate;
  final String? ensrafTime;
  final String? tasgelDate;
  final String? dayName;

  const LocationTableEntity({
    this.id,
    this.empIdFk,
    this.empName,
    this.siteIdFk,
    this.siteName,
    this.hdoorDate,
    this.hdoorTime,
    this.ensrafDate,
    this.ensrafTime,
    this.tasgelDate,
    this.dayName,
  });

  @override
  List<Object?> get props => [
        id,
        empIdFk,
        empName,
        siteIdFk,
        siteName,
        hdoorDate,
        hdoorTime,
        ensrafDate,
        ensrafTime,
        tasgelDate,
        dayName
      ];
}
