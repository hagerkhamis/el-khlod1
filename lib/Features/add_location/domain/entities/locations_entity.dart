import 'package:equatable/equatable.dart';

class LocationsEntity extends Equatable {
  final String? id;
  final String? empName;
  final String? sendDateAr;
  final String? sendTime;
  final String? imgPath;
  final String? editDelete;
  const LocationsEntity(
      {this.id,
      this.empName,
      this.sendDateAr,
      this.sendTime,
      this.imgPath,
      this.editDelete});
  @override
  List<Object?> get props =>
      [id, empName, sendDateAr, sendTime, imgPath, editDelete];
}
