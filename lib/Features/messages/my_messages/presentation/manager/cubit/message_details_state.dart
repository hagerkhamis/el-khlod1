part of 'message_details_cubit.dart';

@immutable
abstract class MessageDetailsState {
  const MessageDetailsState();
  List<Object> get props => [];
}

class MessageDetailsInitial extends MessageDetailsState {}

class MessageDetailsLoading extends MessageDetailsState {
  const MessageDetailsLoading();
}

class MessageDetailsSuccessful extends MessageDetailsState {
  final MessageDetailsList? data;

  const MessageDetailsSuccessful(this.data);
}

class MessageDetailsFailed extends MessageDetailsState {
  final String message;
  const MessageDetailsFailed(this.message);
}
