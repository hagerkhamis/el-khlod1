import 'package:elkhlod/Features/table/domain/entities/table_entity.dart';

import '../../data/data_sources/employees_data_source.dart';
import '../repositories/employees_repo.dart';

abstract class UseCase<type> {
  Future<EmployeesResponse> call(String empId);
}

class EmployeesUseCase extends UseCase<TableEntity> {
  final EmployeesRepo employeesRepository;
  EmployeesUseCase(this.employeesRepository);
  @override
  Future<EmployeesResponse> call(String empId) async {
    return await employeesRepository.fetchEmployees(empId);
  }
}
