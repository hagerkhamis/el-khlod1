part of 'all_emp_taqeem_cubit.dart';

abstract class AllEmpTaqeemState {
  const AllEmpTaqeemState();
  List<Object> get props => [];
}

class MyMessagesInitial extends AllEmpTaqeemState {}

class FetchLoading extends AllEmpTaqeemState {
  const FetchLoading();
}

class FetchSuccessful extends AllEmpTaqeemState {
  final EmployeesList? data;

  const FetchSuccessful(this.data);
}

class FetchFailed extends AllEmpTaqeemState {
  final String message;
  const FetchFailed(this.message);
}
