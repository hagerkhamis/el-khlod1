part of 'lwae7_cubit.dart';

abstract class Lwae7State {
  const Lwae7State();
  List<Object> get props => [];
}

class Ta3memInitial extends Lwae7State {}

class FetchLoading extends Lwae7State {
  const FetchLoading();
}

class FetchSuccessful extends Lwae7State {
  final AllLwae7List? data;

  const FetchSuccessful(this.data);
}

class FetchFailed extends Lwae7State {
  final String message;
  const FetchFailed(this.message);
}
