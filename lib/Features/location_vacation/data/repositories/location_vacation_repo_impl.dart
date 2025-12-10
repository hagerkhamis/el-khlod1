import 'package:dartz/dartz.dart';
import '../data_sources/remote_data_source/location_vacation_remote_data_source.dart';
import '../../domain/repositories/location_vacation_repo.dart';

class LocationVacationRepoImpl extends LocationVacationRepo {
  final LocationVacationRemoteDataSource remoteDataSource;

  LocationVacationRepoImpl({required this.remoteDataSource});



  @override
  Future<Either<String, String>> sendVacation(
    String moderEmpId,
    String empPhoneNum,
    String empName,
    String no3AgazaId,
    String fromDate,
    String toDate,
    String reason,
  ) async {
    return await remoteDataSource.sendVacation(
      moderEmpId,
      empPhoneNum,
      empName,
      no3AgazaId,
      fromDate,
      toDate,
      reason,
    );
  }

  @override
  Future<Either<String, List<Map<String, dynamic>>>> getVacationTypes() async {
    return await remoteDataSource.getVacationTypes();
  }
}
