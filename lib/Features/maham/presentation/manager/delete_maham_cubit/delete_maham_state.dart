part of 'delete_maham_cubit.dart';

@immutable
abstract class DeleteMahamState {
  const DeleteMahamState();
  List<Object> get props => [];
}

class DeleteMahamInitial extends DeleteMahamState {}

class DeleteMobadaratLoading extends DeleteMahamState {
  const DeleteMobadaratLoading();
}

class DeleteMahamSuccessful extends DeleteMahamState {
  final String message;
  const DeleteMahamSuccessful(this.message);
}

class DeleteMahamFailed extends DeleteMahamState {
  final String message;
  const DeleteMahamFailed(this.message);
}
