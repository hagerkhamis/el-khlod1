import 'package:equatable/equatable.dart';

class TalabatListEntity extends Equatable {
  final String? id;
  final String? empName;
  final String? talabDateAr;
  final String? talabTime;
  final String? empIdFk;
  final String? suspend;
  final String? notes;
  final String? no3TalabName;
  final String? haletTalab;
  final String? editDelete;
  final String? radFile;
  final String? radNote;

  const TalabatListEntity(
      {this.id,
      this.empName,
      this.talabDateAr,
      this.talabTime,
      this.empIdFk,
      this.suspend,
      this.notes,
      this.no3TalabName,
      this.haletTalab,
      this.editDelete , 
      this.radFile,
      this.radNote});
  @override
  List<Object?> get props => [
        id,
        empName,
        talabDateAr,
        talabTime,
        empIdFk,
        suspend,
        notes,
        no3TalabName,
        haletTalab,
        editDelete,
        radFile,
        radNote
      ];
}
