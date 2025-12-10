// ignore: depend_on_referenced_packages
import 'package:bloc/bloc.dart';

import '../../../../../auth/login/domain/entities/employee_entity.dart';
import '../../../domain/use_cases/employees_use_case.dart';

part 'employees_state.dart';

class EmployeesCubit extends Cubit<EmployeesState> {
  EmployeesUseCase employeesUseCase;
  EmployeesCubit(this.employeesUseCase) : super(EmployeesInitial());

  Future<void> getEmployees(
    String empId,
  ) async {
    emit(const FetchLoading());
    final result = await employeesUseCase.call(empId);

    emit(result.fold(FetchFailed.new, FetchSuccessful.new));
  }
}
