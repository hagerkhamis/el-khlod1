part of 'edit_taqeem_cubit.dart';

@immutable
abstract class EditTaqeemState {
  const EditTaqeemState();
  List<Object> get props => [];
}

class EditeInitial extends EditTaqeemState {}

class EditTaqeemLoading extends EditTaqeemState {
  const EditTaqeemLoading();
}

class EditTaqeemSuccessful extends EditTaqeemState {
  final String message;

  const EditTaqeemSuccessful(this.message);
}

class EditTaqeemFailed extends EditTaqeemState {
  final String message;
  const EditTaqeemFailed(this.message);
}
