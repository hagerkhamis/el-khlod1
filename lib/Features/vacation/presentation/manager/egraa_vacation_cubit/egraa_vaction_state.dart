part of 'egraa_vaction_cubit.dart';

@immutable
abstract class EgraaVactionState {
  const EgraaVactionState();
  List<Object> get props => [];
}

class EgraaInitial extends EgraaVactionState {}

class EgraaLoading extends EgraaVactionState {
  const EgraaLoading();
}

class EgraaSuccessful extends EgraaVactionState {
  final String message;

  const EgraaSuccessful(this.message);
}

class EgraaFailed extends EgraaVactionState {
  final String message;
  const EgraaFailed(this.message);
}
