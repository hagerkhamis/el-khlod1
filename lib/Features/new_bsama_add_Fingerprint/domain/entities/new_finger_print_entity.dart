import 'package:equatable/equatable.dart';
import 'package:hive/hive.dart';

part 'new_finger_print_entity.g.dart';

@HiveType(typeId: 20)
class NewFingerPrintEntity extends Equatable {
  @HiveField(0)
  final dynamic hodoorId;
  @HiveField(1)
  final dynamic empCode;
  @HiveField(2)
  final dynamic hdoorTime;
  @HiveField(3)
  final dynamic ensrafTime;
  @HiveField(4)
  final dynamic lateMin;

  const NewFingerPrintEntity(
      {this.hodoorId,
      this.empCode,
      this.hdoorTime,
      this.ensrafTime,
      this.lateMin});

  @override
  List<Object?> get props =>
      [hodoorId, empCode, hdoorTime, ensrafTime, lateMin];
}
