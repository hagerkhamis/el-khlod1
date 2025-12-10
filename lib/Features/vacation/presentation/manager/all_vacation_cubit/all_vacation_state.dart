part of 'all_vacation_cubit.dart';

abstract class AllVacationState {
  const AllVacationState();
  List<Object> get props => [];
}

class MyMessagesInitial extends AllVacationState {}

class FetchLoading extends AllVacationState {
  const FetchLoading();
}

class FetchSuccessful extends AllVacationState {
  final AllVacationList? data;

  const FetchSuccessful(this.data);
}

class FetchFailed extends AllVacationState {
  final String message;
  const FetchFailed(this.message);
}
