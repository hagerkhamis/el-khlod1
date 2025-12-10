part of 'sent_messages_cubit.dart';

@immutable
abstract class SentMessagesState {
  const SentMessagesState();
  List<Object> get props => [];
}

class SentMessagesInitial extends SentMessagesState {}

class SentMessagesLoading extends SentMessagesState {
  const SentMessagesLoading();
}

class SentMessagesSuccessful extends SentMessagesState {
  final SentMessagesList? data;

  const SentMessagesSuccessful(this.data);
}

class SentMessagesFailed extends SentMessagesState {
  final String message;
  const SentMessagesFailed(this.message);
}
