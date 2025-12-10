part of 'my_taqeem_cubit.dart';

abstract class MyTaqeemState {
  const MyTaqeemState();
  List<Object> get props => [];
}

class Initial extends MyTaqeemState {}

class FetchLoading extends MyTaqeemState {
  const FetchLoading();
}

class FetchSuccessful extends MyTaqeemState {
  final LastTaqeemList? data;

  const FetchSuccessful(this.data);
}

class FetchFailed extends MyTaqeemState {
  final String message;
  const FetchFailed(this.message);
}
