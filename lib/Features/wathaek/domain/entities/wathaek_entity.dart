import 'package:equatable/equatable.dart';

class WathaekEntity extends Equatable {
  final String? id;
  final String? empName;
  final String? sendDateAr;
  final String? sendTime;
  final String? title;
  final dynamic notes;
  final String? empIdFk;
  final String? suspend;
  final dynamic radNotes;
  final String? haletTalab;
  final String? editDelete;

  final String? sendDate;
  final String? empId;
  final List<AllImagesEntity>? allImages;

  const WathaekEntity(
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
      this.radNotes,
      this.sendDate,
      this.empId,
      this.allImages});
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
        radNotes,
        sendDate,
        empId,
        allImages
      ];
}

class AllImagesEntity extends Equatable {
  final String? id;
  final String? mainIdFk;
  final String? fileName;
  final String? uploadedOn;

  const AllImagesEntity({this.id, this.mainIdFk, this.fileName, this.uploadedOn});
  @override
  List<Object?> get props => [id, mainIdFk, fileName, uploadedOn];
}
