part of 'month_cubit.dart';

abstract class MonthState {
  const MonthState();
  List<Object> get props => [];
}

class MyMessagesInitial extends MonthState {}

class FetchLoading extends MonthState {
  const FetchLoading();
}

class FetchSuccessful extends MonthState {
  final MonthList? data;

  const FetchSuccessful(this.data);
}

class FetchFailed extends MonthState {
  final String message;
  const FetchFailed(this.message);
}
