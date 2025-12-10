// ignore_for_file: file_names

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:elkhlod/Features/vacation/data/models/delete_and_add_vacation_model.dart';
import 'package:elkhlod/core/utils/functions/setup_service_locator.dart';

import '../../../../../../core/utils/network/api/network_api.dart';
import '../../../../../../core/utils/network/network_request.dart';
import '../../../../../../core/utils/network/network_utils.dart';

typedef DeleteVacationResponse = Either<String, String>;

abstract class DeleteVacationRemoteDataSource {
  Future<DeleteVacationResponse> deleteVacation(
      String messageId, String toUserId);
}

class DeleteVacationRemoteDataSourceImpl
    extends DeleteVacationRemoteDataSource {
  @override
  Future<DeleteVacationResponse> deleteVacation(
      String ezenId, String userId) async {
    DeleteVacationResponse deleteMessageResponse = left("");
    var body = {
      "agaza_id": ezenId,
      //"to_user_id": toUserId,
    };
    await getIt<NetworkRequest>().requestFutureData<DeleteAndAddVacationModel>(
      Method.post,
      params: body,
      options: Options(contentType: Headers.formUrlEncodedContentType),
      url: NewApi.doServerDeleteVacationApiCall,
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
