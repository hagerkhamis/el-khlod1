// ignore_for_file: file_names

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:elkhlod/core/utils/functions/setup_service_locator.dart';

import '../../../../../../core/utils/network/api/network_api.dart';
import '../../../../../../core/utils/network/network_request.dart';
import '../../../../../../core/utils/network/network_utils.dart';
import '../../models/delete_and_add_visits_model.dart';

typedef DeleteVisitsResponse = Either<String, String>;

abstract class DeleteVisitsRemoteDataSource {
  Future<DeleteVisitsResponse> deleteVisits(
      String talabId, String userId);
}

class DeleteVisitsRemoteDataSourceImpl
    extends DeleteVisitsRemoteDataSource {
  @override
  Future<DeleteVisitsResponse> deleteVisits(
      String talabId, String userId) async {
    DeleteVisitsResponse deleteVisitsResponse = left("");
    var body = {
      "mobadra_id": talabId,
      //"to_user_id": toUserId,
    };
    await getIt<NetworkRequest>().requestFutureData<DeleteAndAddVisitsModel>(
      Method.post,
      params: body,
      options: Options(contentType: Headers.formUrlEncodedContentType),
      url: NewApi.doServerAddEzen,
      newBaseUrl: NewApi.baseUrl,
      onSuccess: (data) {
        if (data.status == 200) {
          deleteVisitsResponse = right(data.message!);
        } else {
          deleteVisitsResponse = left(data.message!);
        }
      },
      onError: (code, msg) {
        deleteVisitsResponse = left(code.toString());
      },
    );
    return deleteVisitsResponse;
  }
}
