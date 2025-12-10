part of 'add_taqeem_cubit.dart';

@immutable
abstract class AddTaqeemState {
  const AddTaqeemState();
  List<Object> get props => [];
}

class DeleteMessageInitial extends AddTaqeemState {}

class AddTaqeemLoading extends AddTaqeemState {
  const AddTaqeemLoading();
}

class AddTaqeemSuccessful extends AddTaqeemState {
  final String message;

  const AddTaqeemSuccessful(this.message);
}

class AddTaqeemFailed extends AddTaqeemState {
  final String message;
  const AddTaqeemFailed(this.message);
}
