part of 'add_alert_cubit.dart';

@immutable
abstract class AddAlertState {
  const AddAlertState();
  List<Object> get props => [];
}

class AddAlertInitial extends AddAlertState {}

class AddAlertLoading extends AddAlertState {
  const AddAlertLoading();
}

class AddAlertSuccessful extends AddAlertState {
  final String data;

  const AddAlertSuccessful(this.data);
}

class AddAlertFailed extends AddAlertState {
  final String message;
  const AddAlertFailed(this.message);
}
