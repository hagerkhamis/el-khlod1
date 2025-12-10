part of 'types_rate_cubit.dart';

abstract class TypesRateState {
  const TypesRateState();
  List<Object> get props => [];
}

class MyMessagesInitial extends TypesRateState {}

class FetchLoading extends TypesRateState {
  const FetchLoading();
}

class FetchSuccessful extends TypesRateState {
  final AllTypesRateList? data;

  const FetchSuccessful(this.data);
}

class FetchFailed extends TypesRateState {
  final String message;
  const FetchFailed(this.message);
}
