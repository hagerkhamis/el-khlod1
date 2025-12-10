import 'package:elkhlod/Features/location_vacation/domain/repositories/location_vacation_repo.dart';

class LocationVacationUseCase {
  final LocationVacationRepo repo;

  LocationVacationUseCase(this.repo);

  Future<String> sendVacation({
    required String moderEmpId,
    required String empPhoneNum,
    required String empName,
    required String no3AgazaId,
    required String fromDate,
    required String toDate,
    required String reason,
  }) async {
    final result = await repo.sendVacation(
      moderEmpId,
      empPhoneNum,
      empName,
      no3AgazaId,
      fromDate,
      toDate,
      reason,
    );
    return result.fold((l) => throw Exception(l), (r) => r);
  }

  Future<List<Map<String, dynamic>>> getVacationTypes() async {
    final result = await repo.getVacationTypes();
    return result.fold((l) => [], (r) => r);
  }
}
