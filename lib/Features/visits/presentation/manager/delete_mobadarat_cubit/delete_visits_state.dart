part of 'delete_visits_cubit.dart';

@immutable
abstract class DeleteVisitsState {
  const DeleteVisitsState();
  List<Object> get props => [];
}

class DeleteVisitsInitial extends DeleteVisitsState {}

class DeleteVisitsLoading extends DeleteVisitsState {
  const DeleteVisitsLoading();
}

class DeleteVisitsSuccessful extends DeleteVisitsState {
  final String message;
  const DeleteVisitsSuccessful(this.message);
}

class DeleteVisitsFailed extends DeleteVisitsState {
  final String message;
  const DeleteVisitsFailed(this.message);
}
