part of 'add_ezen_cubit.dart';

@immutable
abstract class AddEzenState {
  const AddEzenState();
  List<Object> get props => [];
}

class AddEzenInitial extends AddEzenState {}

class AddEzenLoading extends AddEzenState {
  const AddEzenLoading();
}

class AddEzenSuccessful extends AddEzenState {
  final String message;

  const AddEzenSuccessful(this.message);
}

class AddEzenFailed extends AddEzenState {
  final String message;
  const AddEzenFailed(this.message);
}
