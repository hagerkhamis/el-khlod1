
import '../../data/data_sources/all_notification_remote_data_source.dart';
import '../repositories/notification_repo.dart';

abstract class UseCase<type, Param> {
  Future<AllNotificationResponse> fetchAllNotification(String userId);

}

class NotificationUseCase extends UseCase<dynamic, void> {
  final NotificationRepo notificationRepository;
  NotificationUseCase(this.notificationRepository);

  @override
  Future<AllNotificationResponse> fetchAllNotification(
      String userId) async {
    return await notificationRepository.fetchAllNotification(userId);
  }

 
}
