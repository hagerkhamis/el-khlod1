part of 'add_mohema_cubit.dart';

abstract class AddMohemaState {
  const AddMohemaState();
  List<Object> get props => [];
}

class AddMohemaInitial extends AddMohemaState {}

class AddMohemaLoading extends AddMohemaState {
  const AddMohemaLoading();
}

class AddMohemaSuccessful extends AddMohemaState {
  final String message;

  const AddMohemaSuccessful(this.message);
}

class AddMohemaFailed extends AddMohemaState {
  final String message;
  const AddMohemaFailed(this.message);
}
