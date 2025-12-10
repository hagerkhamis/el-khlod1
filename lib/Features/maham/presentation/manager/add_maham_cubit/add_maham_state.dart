part of 'add_maham_cubit.dart';

@immutable
abstract class AddMahamState {
  const AddMahamState();
  List<Object> get props => [];
}

class AddMahamInitial extends AddMahamState {}

class AddMahamLoading extends AddMahamState {
  const AddMahamLoading();
}

class AddMahamSuccessful extends AddMahamState {
  final String message;

  const AddMahamSuccessful(this.message);
}

class AddMahamFailed extends AddMahamState {
  final String message;
  const AddMahamFailed(this.message);
}
