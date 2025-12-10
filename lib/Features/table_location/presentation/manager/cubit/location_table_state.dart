part of 'location_table_cubit.dart';

abstract class LocationTableState {
  const LocationTableState();
  List<Object> get props => [];
}

class FetchInitial extends LocationTableState {}

class FetchLoading extends LocationTableState {
  const FetchLoading();
}

class FetchSuccessful extends LocationTableState {
  final LocationTableList? data;

  const FetchSuccessful(this.data);
}

class FetchFailed extends LocationTableState {
  final String message;
  const FetchFailed(this.message);
}
