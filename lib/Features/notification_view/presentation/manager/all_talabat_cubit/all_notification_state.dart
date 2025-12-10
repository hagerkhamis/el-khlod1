part of 'all_notification_cubit.dart';


abstract class AllNotificationState {
  const AllNotificationState();
  List<Object> get props => [];
}

class MyMessagesInitial extends AllNotificationState {}

class FetchLoading extends AllNotificationState {
  const FetchLoading();
}

class FetchSuccessful extends AllNotificationState {
  final NotificationTList? data;

  const FetchSuccessful(this.data);
}

class FetchFailed extends AllNotificationState {
  final String message;
  const FetchFailed(this.message);
}
