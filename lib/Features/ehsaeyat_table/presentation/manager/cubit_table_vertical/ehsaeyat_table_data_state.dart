part of 'ehsaeyat_table_data_cubit.dart';

abstract class EhsaeyatTableDataState {
  const EhsaeyatTableDataState();
  List<Object> get props => [];
}

class FetchDataVerticalInitial extends EhsaeyatTableDataState {}

class FetchDataVerticalLoading extends EhsaeyatTableDataState {
  const FetchDataVerticalLoading();
}

class FetchDataVerticalSuccessful extends EhsaeyatTableDataState {
  final TableDataList? data;

  const FetchDataVerticalSuccessful(this.data);
}

class FetchDataVerticalFailed extends EhsaeyatTableDataState {
  final String message;
  const FetchDataVerticalFailed(this.message);
}
