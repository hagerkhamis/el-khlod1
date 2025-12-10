part of 'employees_cubit.dart';

abstract class EmployeesState {
  const EmployeesState();
  List<Object> get props => [];
}

class EmployeesInitial extends EmployeesState {}

class FetchLoading extends EmployeesState {
  const FetchLoading();
}

class FetchSuccessful extends EmployeesState {
  final EmployeesList? data;

  const FetchSuccessful(this.data);
}

class FetchFailed extends EmployeesState {
  final String message;
  const FetchFailed(this.message);
}
