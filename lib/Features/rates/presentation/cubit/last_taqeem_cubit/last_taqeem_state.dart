part of 'last_taqeem_cubit.dart';

abstract class LastTaqeemState {
  const LastTaqeemState();
  List<Object> get props => [];
}

class LastInitial extends LastTaqeemState {}

class LastFetchLoading extends LastTaqeemState {
  const LastFetchLoading();
}

class LastFetchSuccessful extends LastTaqeemState {
  final LastTaqeemList? data;

  const LastFetchSuccessful(this.data);
}

class LastFetchFailed extends LastTaqeemState {
  final String message;
  const LastFetchFailed(this.message);
}
