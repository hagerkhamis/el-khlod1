part of 'show_alert_cubit.dart';

@immutable
abstract class ShowAlertState {
  const ShowAlertState();
  List<Object> get props => [];
}

class ShowAlertInitial extends ShowAlertState {}

class ShowAlertLoading extends ShowAlertState {
  const ShowAlertLoading();
}

class ShowAlertSuccessful extends ShowAlertState {
  final ShowAlertEntity data;

  const ShowAlertSuccessful(this.data);
}

class ShowAlertFailed extends ShowAlertState {
  final String message;
  const ShowAlertFailed(this.message);
}
