part of 'ehsaeyat_table_cubit.dart';

abstract class EhsaeyatTableState {
  const EhsaeyatTableState();
  List<Object> get props => [];
}

class FetchInitial extends EhsaeyatTableState {}

class FetchLoading extends EhsaeyatTableState {
  const FetchLoading();
}

class FetchSuccessful extends EhsaeyatTableState {
  final TableList? data;

  const FetchSuccessful(this.data);
}

class FetchFailed extends EhsaeyatTableState {
  final String message;
  const FetchFailed(this.message);
}
