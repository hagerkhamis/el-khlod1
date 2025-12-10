part of 'add_mobadarat_cubit.dart';

@immutable
abstract class AddMobadaratState {
  const AddMobadaratState();
  List<Object> get props => [];
}

class AddMobadaratInitial extends AddMobadaratState {}

class AddMobadaratLoading extends AddMobadaratState {
  const AddMobadaratLoading();
}

class AddMobadaratSuccessful extends AddMobadaratState {
  final String message;

  const AddMobadaratSuccessful(this.message);
}

class AddMobadaratFailed extends AddMobadaratState {
  final String message;
  const AddMobadaratFailed(this.message);
}
