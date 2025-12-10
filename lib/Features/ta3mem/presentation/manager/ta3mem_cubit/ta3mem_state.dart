part of 'ta3mem_cubit.dart';

abstract class Ta3memState {
  const Ta3memState();
  List<Object> get props => [];
}

class Ta3memInitial extends Ta3memState {}

class FetchLoading extends Ta3memState {
  const FetchLoading();
}

class FetchSuccessful extends Ta3memState {
  final AllTa3memList? data;

  const FetchSuccessful(this.data);
}

class FetchFailed extends Ta3memState {
  final String message;
  const FetchFailed(this.message);
}
