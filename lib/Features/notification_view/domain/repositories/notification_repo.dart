
import '../../data/data_sources/all_notification_remote_data_source.dart';

abstract class NotificationRepo {
  Future<AllNotificationResponse> fetchAllNotification(String userId);
  
}
