part of 'alert_cubit.dart';

@immutable
abstract class AlertState {
  const AlertState();
  List<Object> get props => [];
}

class AlertInitial extends AlertState {}

class AlertLoading extends AlertState {
  const AlertLoading();
}

class AlertSuccessful extends AlertState {
  final AlertEntity data;

  const AlertSuccessful(this.data);
}

class AlertFailed extends AlertState {
  final String message;
  const AlertFailed(this.message);
}
