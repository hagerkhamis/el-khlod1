part of 'seen_message_cubit.dart';

@immutable
abstract class SeenMessageState {
  const SeenMessageState();
  List<Object> get props => [];
}

class SeenMessageInitial extends SeenMessageState {}

class SeenLoading extends SeenMessageState {
  const SeenLoading();
}

class SeenSuccessful extends SeenMessageState {
  final MessageDetailsList? data;

  const SeenSuccessful(this.data);
}

class SeenFailed extends SeenMessageState {
  final String message;
  const SeenFailed(this.message);
}
