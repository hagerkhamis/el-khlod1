import 'package:equatable/equatable.dart';

class Ta3memEntity extends Equatable {
  final String? id;
  final String? ta3memIdFk;
  final String? empId;
  final String? empCode;
  final String? empName;
  final String? seen;
  final String? seenDate;
  final String? seenTime;
  final String? type;
  final String? ta3memTitle;
  final String? ta3memDate;
  final String? ta3memImg;

  const Ta3memEntity(
      {this.id,
      this.ta3memIdFk,
      this.empId,
      this.empCode,
      this.empName,
      this.seen,
      this.seenDate,
      this.seenTime,
      this.type,
      this.ta3memTitle,
      this.ta3memDate,
      this.ta3memImg});

  @override
  List<Object?> get props => [
        id,
        ta3memIdFk,
        empId,
        empCode,
        empName,
        seen,
        seenDate,
        seenTime,
        type,
        ta3memTitle,
        ta3memDate,
        ta3memImg
      ];
}
