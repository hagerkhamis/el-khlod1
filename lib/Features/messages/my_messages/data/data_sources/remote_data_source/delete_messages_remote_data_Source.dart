// ignore_for_file: file_names

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:elkhlod/Features/messages/my_messages/data/models/delete_message_model.dart';
import 'package:elkhlod/Features/messages/my_messages/domain/entities/delete_message_entity.dart';
import 'package:elkhlod/core/utils/functions/setup_service_locator.dart';

import '../../../../../../core/utils/network/api/network_api.dart';
import '../../../../../../core/utils/network/network_request.dart';
import '../../../../../../core/utils/network/network_utils.dart';

typedef DeleteMessageResponse = Either<String, DeleteMessageEntity>;

abstract class DeleteMessageRemoteDataSource {
  Future<DeleteMessageResponse> deleteMessage(
      String messageId, String toUserId);
}

class DeleteMessageRemoteDataSourceImpl extends DeleteMessageRemoteDataSource {
  @override
  Future<DeleteMessageResponse> deleteMessage(
      String messageId, String toUserId) async {
    DeleteMessageResponse deleteMessageResponse = left("");
    var body = {
      "msg_id": messageId,
      "to_user_id": toUserId,
    };
    await getIt<NetworkRequest>().requestFutureData<DeleteMessageModel>(
      Method.post,
      params: body,
      options: Options(contentType: Headers.formUrlEncodedContentType),
      url: NewApi.doServerDeleteMessageApiCall,
      newBaseUrl: NewApi.baseUrl,
      onSuccess: (data) {
        if (data.status == 200) {
          deleteMessageResponse = right(data);
        } else {
          deleteMessageResponse = left(data.message!);
        }
      },
      onError: (code, msg) {
        deleteMessageResponse = left(code.toString());
      },
    );
    return deleteMessageResponse;
  }
}
