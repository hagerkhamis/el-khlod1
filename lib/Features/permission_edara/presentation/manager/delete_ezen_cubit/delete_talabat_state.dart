part of 'delete_talabat_cubit.dart';

@immutable
abstract class DeleteTalabatState {
  const DeleteTalabatState();
  List<Object> get props => [];
}

class DeleteMessageInitial extends DeleteTalabatState {}

class DeleteLoading extends DeleteTalabatState {
  const DeleteLoading();
}

class DeleteSuccessful extends DeleteTalabatState {
  final String message;
  const DeleteSuccessful(this.message);
}

class DeleteFailed extends DeleteTalabatState {
  final String message;
  const DeleteFailed(this.message);
}
