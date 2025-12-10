part of 'delete_taqeem_cubit.dart';

@immutable
abstract class DeleteTaqeemState {
  const DeleteTaqeemState();
  List<Object> get props => [];
}

class DeleteMessageInitial extends DeleteTaqeemState {}

class DeleteTaqeemLoading extends DeleteTaqeemState {
  const DeleteTaqeemLoading();
}

class DeleteTaqeemSuccessful extends DeleteTaqeemState {
  final String message;

  const DeleteTaqeemSuccessful(this.message);
}

class DeleteTaqeemFailed extends DeleteTaqeemState {
  final String message;
  const DeleteTaqeemFailed(this.message);
}
