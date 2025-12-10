import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import 'package:elkhlod/core/utils/functions/setup_service_locator.dart';

import '../../../../../../core/utils/network/api/network_api.dart';
import '../../../../../../core/utils/network/network_request.dart';
import '../../../../../../core/utils/network/network_utils.dart';
import '../models/all_notification_model.dart';

typedef AllNotificationResponse = Either<String, NotificationTList>;

abstract class AllNotificationRemoteDataSource {
  Future<AllNotificationResponse> fetchAllNotification(String userId);
}

class AllNotificationRemoteDataSourceImp extends AllNotificationRemoteDataSource {
  @override
  Future<AllNotificationResponse> fetchAllNotification(String userId) async {
    AllNotificationResponse allMessagesResponse = left("");
    var body = {
      "emp_id": userId,
    
    };
    await getIt<NetworkRequest>().requestFutureData<NotificationListModel>(
      Method.post,
      params: body,
      options: Options(contentType: Headers.formUrlEncodedContentType),
      url: NewApi.doServerNotificationList,
      newBaseUrl: NewApi.baseUrl,
      onSuccess: (data) {
        if (data.status == 200 && data.data != null) {
          allMessagesResponse = right(data.data!);
        } else if (data.status == 200 && data.data == null) {
          allMessagesResponse = left(data.message!);
        } else {
          allMessagesResponse = left(data.message!);
        }
      },
      onError: (code, msg) {
        allMessagesResponse = left(code.toString());
      },
    );
    return allMessagesResponse;
  }
}
