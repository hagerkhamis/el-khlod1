part of 'attendance_table_cubit.dart';

abstract class AttendanceTableState {
  const AttendanceTableState();
  List<Object> get props => [];
}

class FetchInitial extends AttendanceTableState {}

class FetchLoading extends AttendanceTableState {
  const FetchLoading();
}

class FetchSuccessful extends AttendanceTableState {
  final TableList? data;

  const FetchSuccessful(this.data);
}

class FetchFailed extends AttendanceTableState {
  final String message;
  const FetchFailed(this.message);
}
