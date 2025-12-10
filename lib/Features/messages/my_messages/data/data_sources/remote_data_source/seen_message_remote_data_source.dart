import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import '../../../../../../core/utils/functions/setup_service_locator.dart';
import '../../../../../../core/utils/network/api/network_api.dart';
import '../../../../../../core/utils/network/network_request.dart';
import '../../../../../../core/utils/network/network_utils.dart';
import '../../models/message_details_model/datum.dart';
import '../../models/message_details_model/message_details_model.dart';

typedef SeenMessageResponse = Either<String, MessageDetailsList>;

abstract class SeenMessageRemoteDataSource {
  Future<SeenMessageResponse> seeMessage(String messageId, String toUserId);
}

class SeenMessageRemoteDataSourceImpl extends SeenMessageRemoteDataSource {
  @override
  Future<SeenMessageResponse> seeMessage(
      String messageId, String toUserId) async {
    SeenMessageResponse messageDetailsResponse = left("");
    var body = {
      "msg_id": messageId,
      "to_user_id": toUserId,
    };
    await getIt<NetworkRequest>().requestFutureData<MessageDetailsModel>(
      Method.post,
      params: body,
      options: Options(contentType: Headers.formUrlEncodedContentType),
      url: NewApi.doServerSeenMessageApiCall,
      newBaseUrl: NewApi.baseUrl,
      onSuccess: (data) {
        if (data.status == 200) {
          messageDetailsResponse = right(data.data!);
        } else {
          messageDetailsResponse = left(data.message!);
        }
      },
      onError: (code, msg) {
        messageDetailsResponse = left(code.toString());
      },
    );
    return messageDetailsResponse;
  }
}
