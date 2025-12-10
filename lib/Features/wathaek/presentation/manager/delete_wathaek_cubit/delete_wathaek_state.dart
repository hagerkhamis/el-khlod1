part of 'delete_wathaek_cubit.dart';

@immutable
abstract class DeleteWathaekState {
  const DeleteWathaekState();
  List<Object> get props => [];
}

class DeleteWathaekInitial extends DeleteWathaekState {}

class DeleteWathaekLoading extends DeleteWathaekState {
  const DeleteWathaekLoading();
}

class DeleteWathaekSuccessful extends DeleteWathaekState {
  final String message;
  const DeleteWathaekSuccessful(this.message);
}

class DeleteWathaekFailed extends DeleteWathaekState {
  final String message;
  const DeleteWathaekFailed(this.message);
}
