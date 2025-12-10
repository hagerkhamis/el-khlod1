part of 'egraa_ezen_cubit.dart';

@immutable
abstract class EgraaEzenState {
  const EgraaEzenState();
  List<Object> get props => [];
}

class EgraaInitial extends EgraaEzenState {}

class EgraaLoading extends EgraaEzenState {
  const EgraaLoading();
}

class EgraaSuccessful extends EgraaEzenState {
  final String message;

  const EgraaSuccessful(this.message);
}

class EgraaFailed extends EgraaEzenState {
  final String message;
  const EgraaFailed(this.message);
}
