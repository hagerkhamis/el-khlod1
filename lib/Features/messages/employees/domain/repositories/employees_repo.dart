import '../../data/data_sources/employees_data_source.dart';

abstract class EmployeesRepo {
  Future<EmployeesResponse> fetchEmployees(String empId);
}
