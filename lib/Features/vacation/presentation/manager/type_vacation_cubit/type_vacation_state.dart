part of 'type_vacation_cubit.dart';

abstract class VacationState {
  const VacationState();
  List<Object> get props => [];
}

class MyMessagesInitial extends VacationState {}

class FetchLoading extends VacationState {
  const FetchLoading();
}

class FetchSuccessful extends VacationState {
  final TypeVacationList? data;

  const FetchSuccessful(this.data);
}

class FetchFailed extends VacationState {
  final String message;
  const FetchFailed(this.message);
}
