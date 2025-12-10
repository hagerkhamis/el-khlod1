part of 'delete_mobadarat_cubit.dart';

@immutable
abstract class DeleteMobadaratState {
  const DeleteMobadaratState();
  List<Object> get props => [];
}

class DeleteMobadaratInitial extends DeleteMobadaratState {}

class DeleteMobadaratLoading extends DeleteMobadaratState {
  const DeleteMobadaratLoading();
}

class DeleteMobadaratSuccessful extends DeleteMobadaratState {
  final String message;
  const DeleteMobadaratSuccessful(this.message);
}

class DeleteMobadaratFailed extends DeleteMobadaratState {
  final String message;
  const DeleteMobadaratFailed(this.message);
}
