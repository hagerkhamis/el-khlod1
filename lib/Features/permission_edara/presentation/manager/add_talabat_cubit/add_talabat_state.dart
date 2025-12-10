part of 'add_talabt_cubit.dart';

@immutable
abstract class AddTalabatState {
  const AddTalabatState();
  List<Object> get props => [];
}

class AddTalabatInitial extends AddTalabatState {}

class AddTalabatLoading extends AddTalabatState {
  const AddTalabatLoading();
}

class AddTalabatSuccessful extends AddTalabatState {
  final String message;

  const AddTalabatSuccessful(this.message);
}

class AddTalabatFailed extends AddTalabatState {
  final String message;
  const AddTalabatFailed(this.message);
}
