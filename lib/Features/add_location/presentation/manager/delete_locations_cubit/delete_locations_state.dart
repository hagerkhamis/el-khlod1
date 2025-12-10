part of 'delete_locations_cubit.dart';

abstract class DeleteLocationsState {
  const DeleteLocationsState();
  List<Object> get props => [];
}

class DeleteLocationsInitial extends DeleteLocationsState {}

class DeleteFetchLoading extends DeleteLocationsState {
  const DeleteFetchLoading();
}

class DeleteFetchSuccessful extends DeleteLocationsState {
  final String data;

  const DeleteFetchSuccessful(this.data);
}

class DeleteFetchFailed extends DeleteLocationsState {
  final String message;
  const DeleteFetchFailed(this.message);
}
