import 'package:equatable/equatable.dart';

class MobadaratEntity extends Equatable {
  final String? id;
  final String? empName;
  final String? sendDateAr;
  final String? sendTime;
  final String? title;
  final String? notes;
  final String? empIdFk;
  final String? suspend;
  final dynamic radNotes;
  final String? haletTalab;
  final String? editDelete;

  const MobadaratEntity(
      {this.id,
      this.empName,
      this.empIdFk,
      this.suspend,
      this.notes,
      this.haletTalab,
      this.editDelete,
      this.sendDateAr,
      this.sendTime,
      this.title,
      this.radNotes});
  @override
  List<Object?> get props => [
        id,
        empName,
        empIdFk,
        suspend,
        notes,
        haletTalab,
        editDelete,
        sendDateAr,
        sendTime,
        title,
        radNotes
      ];
}
