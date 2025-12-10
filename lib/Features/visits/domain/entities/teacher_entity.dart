import 'package:equatable/equatable.dart';

class TeacherEntity extends Equatable {
  final String? teacherIdFk;
  final String? moshrefIdFk;
  final String? moshrefName;
  final String? tType;
  final String? teacherName;
  final String? status;

  const TeacherEntity({
    this.teacherIdFk,
    this.moshrefIdFk,
    this.moshrefName,
    this.tType,
    this.teacherName,
    this.status,
  });

  @override
  List<Object?> get props => [
        teacherIdFk,
        moshrefIdFk,
        moshrefName,
        tType,
        teacherName,
        status,
      ];
}
