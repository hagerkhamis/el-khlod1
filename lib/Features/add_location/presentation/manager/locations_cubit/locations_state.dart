part of 'locations_cubit.dart';

abstract class LocationsState {
  const LocationsState();
  List<Object> get props => [];
}

class LocationsInitial extends LocationsState {}

class FetchLoading extends LocationsState {
  const FetchLoading();
}

class FetchSuccessful extends LocationsState {
  final AllLocationsList? data;

  const FetchSuccessful(this.data);
}

class FetchFailed extends LocationsState {
  final String message;
  const FetchFailed(this.message);
}
