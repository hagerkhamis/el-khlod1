import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:elkhlod/core/utils/functions/setup_service_locator.dart';
import '../../../../../../core/utils/network/api/network_api.dart';
import '../../../../../../core/utils/network/network_request.dart';
import '../../../../../../core/utils/network/network_utils.dart';
import '../../models/my_messages_model/datum.dart';
import '../../models/my_messages_model/my_messages_model.dart';

typedef AllMessagesResponse = Either<String, AllMessagesList>;

abstract class AllMessagesRemoteDataSource {
  Future<AllMessagesResponse> fetchAllMessages(String userId, String seen);
}

class AllMessagesRemoteDataSourceImpl extends AllMessagesRemoteDataSource {
  @override
  Future<AllMessagesResponse> fetchAllMessages(
      String userId, String seen) async {
    AllMessagesResponse allMessagesResponse = left("");
    var body = {
      "page": "1",
      "per_page": "100",
      "user_id": userId,
      "seen": seen
    };
    await getIt<NetworkRequest>().requestFutureData<MyMessagesModel>(
      Method.post,
      params: body,
      options: Options(contentType: Headers.formUrlEncodedContentType),
      url: NewApi.doServerAllMessageApiCall,
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
