import '../../domain/repositories/notification_repo.dart';
import '../data_sources/all_notification_remote_data_source.dart';

class NotificationRepositoryImp extends NotificationRepo {
  final AllNotificationRemoteDataSource allNotificationRemoteDataSource;

  NotificationRepositoryImp(
    this.allNotificationRemoteDataSource,
  );

  @override
  Future<AllNotificationResponse> fetchAllNotification(String userId) async {
    var userData =
        await allNotificationRemoteDataSource.fetchAllNotification(userId);

    return userData;
  }
}
