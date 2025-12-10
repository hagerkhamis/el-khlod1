import 'package:dartz/dartz.dart';

abstract class LocationVacationRepo {
  Future<Either<String, String>> sendVacation(
    String moderEmpId,
    String empPhoneNum,
    String empName,
    String no3AgazaId,
    String fromDate,
    String toDate,
    String reason,
  );

  Future<Either<String, List<Map<String, dynamic>>>> getVacationTypes();
}
