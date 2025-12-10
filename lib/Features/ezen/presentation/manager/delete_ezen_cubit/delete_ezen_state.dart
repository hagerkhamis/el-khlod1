part of 'delete_ezen_cubit.dart';

@immutable
abstract class DeleteEzenState {
  const DeleteEzenState();
  List<Object> get props => [];
}

class DeleteEzenInitial extends DeleteEzenState {}

class DeleteLoading extends DeleteEzenState {
  const DeleteLoading();
}

class DeleteSuccessful extends DeleteEzenState {
  final String message;
  const DeleteSuccessful(this.message);
}

class DeleteFailed extends DeleteEzenState {
  final String message;
  const DeleteFailed(this.message);
}
