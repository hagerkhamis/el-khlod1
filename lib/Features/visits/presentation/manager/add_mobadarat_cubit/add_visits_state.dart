part of 'add_visits_cubit.dart';

@immutable
abstract class AddVisitsState {
  const AddVisitsState();
  List<Object> get props => [];
}

class AddVisitsInitial extends AddVisitsState {}

class AddVisitsLoading extends AddVisitsState {
  const AddVisitsLoading();
}

class AddVisitsSuccessful extends AddVisitsState {
  final String message;

  const AddVisitsSuccessful(this.message);
}

class AddVisitsFailed extends AddVisitsState {
  final String message;
  const AddVisitsFailed(this.message);
}
