part of 'delete_message_cubit.dart';

@immutable
abstract class DeleteMessageState {
  const DeleteMessageState();
  List<Object> get props => [];
}

class DeleteMessageInitial extends DeleteMessageState {}

class DeleteLoading extends DeleteMessageState {
  const DeleteLoading();
}

class DeleteSuccessful extends DeleteMessageState {
  final DeleteMessageEntity? data;

  const DeleteSuccessful(this.data);
}

class DeleteFailed extends DeleteMessageState {
  final String message;
  const DeleteFailed(this.message);
}
