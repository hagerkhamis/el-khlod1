part of 'add_vacation_cubit.dart';

@immutable
abstract class AddVacationState {
  const AddVacationState();
  List<Object> get props => [];
}

class DeleteMessageInitial extends AddVacationState {}

class DeleteLoading extends AddVacationState {
  const DeleteLoading();
}

class DeleteSuccessful extends AddVacationState {
  final String message;

  const DeleteSuccessful(this.message);
}

class DeleteFailed extends AddVacationState {
  final String message;
  const DeleteFailed(this.message);
}
