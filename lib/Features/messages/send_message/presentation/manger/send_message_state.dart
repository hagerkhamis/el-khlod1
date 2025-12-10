part of 'send_message_cubit.dart';

abstract class SendMessageState {
  const SendMessageState();
  List<Object> get props => [];
}

class SendMessageInitial extends SendMessageState {}

class SendMessageLoading extends SendMessageState {
  const SendMessageLoading();
}

class SendMessageSuccessful extends SendMessageState {
  final SendMessageEntity user;

  const SendMessageSuccessful(this.user);
}

class SendMessageFailed extends SendMessageState {
  final String message;
  const SendMessageFailed(this.message);
}
