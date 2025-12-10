import '../../domain/repositories/employees_repo.dart';
import '../data_sources/employees_data_source.dart';

class EmployeesRepositoryImp extends EmployeesRepo {
  final EmployeesRemoteDataSource employeesRemoteDataSource;

  EmployeesRepositoryImp(this.employeesRemoteDataSource);

  @override
  Future<EmployeesResponse> fetchEmployees(String empId) async {
    var userData = await employeesRemoteDataSource.fetchEmployees(empId);

    return userData;
  }
}
