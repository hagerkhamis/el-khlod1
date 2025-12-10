part of 'enzarat_cubit.dart';

abstract class EnzaratState {
  const EnzaratState();
  List<Object> get props => [];
}

class Ta3memInitial extends EnzaratState {}

class FetchLoading extends EnzaratState {
  const FetchLoading();
}

class FetchSuccessful extends EnzaratState {
  final AllEnzaratList? data;

  const FetchSuccessful(this.data);
}

class FetchFailed extends EnzaratState {
  final String message;
  const FetchFailed(this.message);
}
