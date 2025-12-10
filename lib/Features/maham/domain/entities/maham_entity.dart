import 'package:equatable/equatable.dart';

class MahamEntity extends Equatable {
  final String? id;
  final String? empName;
  final String? sendDateAr;
  final String? sendTime;
  final String? title;
  final String? notes;
  final String? empIdFk;
  final String? suspend;
  final String? haletTask;
  final String? haletTaskColor;
  final String? editDelete;
  final String? status;

  const MahamEntity(
      {this.id,
      this.empName,
      this.sendDateAr,
      this.sendTime,
      this.title,
      this.notes,
      this.empIdFk,
      this.suspend,
      this.haletTask,
      this.haletTaskColor,
      this.editDelete,
      this.status});
  @override
  List<Object?> get props => [
        id,
        empName,
        sendDateAr,
        sendTime,
        title,
        notes,
        empIdFk,
        suspend,
        haletTask,
        haletTaskColor,
        editDelete,
        status
      ];
}
