part of 'add_location_cubit.dart';

abstract class AddLocationState {
  const AddLocationState();
  List<Object> get props => [];
}

class AddLocationInitial extends AddLocationState {}

class AddLocationLoading extends AddLocationState {
  const AddLocationLoading();
}

class AddLocationSuccessful extends AddLocationState {
  final String message;

  const AddLocationSuccessful(this.message);
}

class AddLocationFailed extends AddLocationState {
  final String message;
  const AddLocationFailed(this.message);
}
