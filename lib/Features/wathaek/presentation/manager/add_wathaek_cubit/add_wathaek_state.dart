part of 'add_wathaek_cubit.dart';

@immutable
abstract class AddWathaekState {
  const AddWathaekState();
  List<Object> get props => [];
}

class AddWathaekInitial extends AddWathaekState {}

class AddWathaekLoading extends AddWathaekState {
  const AddWathaekLoading();
}

class AddWathaekSuccessful extends AddWathaekState {
  final String message;

  const AddWathaekSuccessful(this.message);
}

class AddWathaekFailed extends AddWathaekState {
  final String message;
  const AddWathaekFailed(this.message);
}
