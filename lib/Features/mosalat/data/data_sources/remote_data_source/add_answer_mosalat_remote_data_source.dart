// ignore_for_file: file_names

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:elkhlod/Features/vacation/data/models/delete_and_add_vacation_model.dart';
import 'package:elkhlod/core/utils/functions/setup_service_locator.dart';

import '../../../../../../core/utils/network/api/network_api.dart';
import '../../../../../../core/utils/network/network_request.dart';
import '../../../../../../core/utils/network/network_utils.dart';

typedef SeenMosalatResponse = Either<String, String>;

abstract class AddAnswerMosalatRemoteDataSource {
  Future<SeenMosalatResponse> seenMosalat(String messageId, String toUserId,
      String mobarer, String other, String reason, dynamic attachment);
}

class AddAnswerMosalatDataSourceImpl extends AddAnswerMosalatRemoteDataSource {
  @override
  Future<SeenMosalatResponse> seenMosalat(
    String messageId,
    String toUserId,
    String mobarer,
    String other,
    String reason,
    dynamic attachment,
  ) async {
    SeenMosalatResponse deleteMessageResponse = left("");

    var formData = FormData();
    formData.fields.add(MapEntry("emp_id", toUserId));
    formData.fields.add(MapEntry("mosala_id", messageId));
    formData.fields.add(MapEntry("answer_reasons", reason));
    formData.fields.add(MapEntry("answer_mobarer", mobarer));
    formData.fields.add(MapEntry("answer_other", other));

    if (attachment != null) {
      formData.files.add(MapEntry(
        "f_file",
        await MultipartFile.fromFile(attachment.path,
            filename: attachment.path.split('/').last),
      ));
    }

    await getIt<NetworkRequest>().requestFutureData<DeleteAndAddVacationModel>(
      Method.post,
      // params: body,
      formData: formData,
      isFormData: true,
      options: Options(contentType: Headers.formUrlEncodedContentType),
      url: NewApi.doServerAddAnswerMosalat,
      newBaseUrl: NewApi.baseUrl,
      onSuccess: (data) {
        if (data.status == 200) {
          deleteMessageResponse = right(data.message!);
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
