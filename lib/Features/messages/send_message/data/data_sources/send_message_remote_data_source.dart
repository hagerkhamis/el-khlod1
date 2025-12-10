import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import '../../../../../../core/utils/network/network_request.dart';
import '../../../../../core/utils/functions/setup_service_locator.dart';
import '../../../../../core/utils/network/api/network_api.dart';
import '../../../../../core/utils/network/network_utils.dart';
import '../../domain/entities/send_message_entity.dart';
import '../models/send_message_model.dart';

typedef SendMessageResponse = Either<String, SendMessageEntity>;

abstract class SendMessageRemoteDataSource {
  Future<SendMessageResponse> sendNewMessage(
    String fromEmpId,
    List<int> toEmpId,
    String messageTitle,
    String messageBody,
    dynamic attachment,
  );
}

class SendMessageRemoteDataSourceImpl extends SendMessageRemoteDataSource {
  @override
  Future<SendMessageResponse> sendNewMessage(
      String fromEmpId,
      List<int> toEmpId,
      String messageTitle,
      String messageBody,
      dynamic attachment) async {
    SendMessageResponse newMessageResponse = left("");

    var formData = FormData();
    formData.fields.add(MapEntry("from_user_id", fromEmpId));
    formData.fields.add(MapEntry("to_user_ids", toEmpId.toString()));

    formData.fields.add(MapEntry("subject", messageTitle));
    formData.fields.add(MapEntry("message", messageBody));

    if (attachment != null) {
      formData.files.add(MapEntry(
        "msg_image",
        await MultipartFile.fromFile(attachment.path,
            filename: attachment.path.split('/').last),
      ));
    }

    await getIt<NetworkRequest>().requestFutureData<SendMessageModel>(
      Method.post,
      formData: formData,
      isFormData: true,
      // params: params,
      options: Options(contentType: Headers.formUrlEncodedContentType),
      url: NewApi.doServerSendMessageApiCall,
      newBaseUrl: NewApi.baseUrl,

      onSuccess: (data) {
        if (data.status == 200) {
          newMessageResponse = right(data);
        } else {
          newMessageResponse = left(data.message!);
        }
      },
      onError: (code, msg) {
        newMessageResponse = left(code.toString());
      },
    );
    return newMessageResponse;
  }
}
