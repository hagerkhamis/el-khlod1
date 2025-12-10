part of 'mosalat_cubit.dart';

abstract class MosalatState {
  const MosalatState();
  List<Object> get props => [];
}

class MosalatInitial extends MosalatState {}

class FetchLoading extends MosalatState {
  const FetchLoading();
}

class FetchSuccessful extends MosalatState {
  final AllMosalatList? data;

  const FetchSuccessful(this.data);
}

class FetchFailed extends MosalatState {
  final String message;
  const FetchFailed(this.message);
}
