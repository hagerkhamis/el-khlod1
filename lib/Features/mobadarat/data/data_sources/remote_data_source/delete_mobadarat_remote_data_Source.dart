// ignore_for_file: file_names

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:elkhlod/core/utils/functions/setup_service_locator.dart';

import '../../../../../../core/utils/network/api/network_api.dart';
import '../../../../../../core/utils/network/network_request.dart';
import '../../../../../../core/utils/network/network_utils.dart';
import '../../models/delete_and_add_mobadarat_model.dart';

typedef DeleteMobadaratResponse = Either<String, String>;

abstract class DeleteMobadaratRemoteDataSource {
  Future<DeleteMobadaratResponse> deleteMobadarat(
      String talabId, String userId);
}

class DeleteMobadaratRemoteDataSourceImpl
    extends DeleteMobadaratRemoteDataSource {
  @override
  Future<DeleteMobadaratResponse> deleteMobadarat(
      String talabId, String userId) async {
    DeleteMobadaratResponse deleteMobadaratResponse = left("");
    var body = {
      "mobadra_id": talabId,
      //"to_user_id": toUserId,
    };
    await getIt<NetworkRequest>().requestFutureData<DeleteAndAddMobadaratModel>(
      Method.post,
      params: body,
      options: Options(contentType: Headers.formUrlEncodedContentType),
      url: NewApi.doServerDeleteMobadaratApiCall,
      newBaseUrl: NewApi.baseUrl,
      onSuccess: (data) {
        if (data.status == 200) {
          deleteMobadaratResponse = right(data.message!);
        } else {
          deleteMobadaratResponse = left(data.message!);
        }
      },
      onError: (code, msg) {
        deleteMobadaratResponse = left(code.toString());
      },
    );
    return deleteMobadaratResponse;
  }
}
