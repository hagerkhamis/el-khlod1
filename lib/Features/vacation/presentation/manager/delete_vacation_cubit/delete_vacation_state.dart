part of 'delete_vacation_cubit.dart';

@immutable
abstract class DeleteVacationState {
  const DeleteVacationState();
  List<Object> get props => [];
}

class DeleteMessageInitial extends DeleteVacationState {}

class DeleteLoading extends DeleteVacationState {
  const DeleteLoading();
}

class DeleteSuccessful extends DeleteVacationState {
  final String message;
  const DeleteSuccessful(this.message);
}

class DeleteFailed extends DeleteVacationState {
  final String message;
  const DeleteFailed(this.message);
}
