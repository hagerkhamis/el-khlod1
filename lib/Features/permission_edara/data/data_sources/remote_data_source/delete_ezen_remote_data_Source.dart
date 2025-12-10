// ignore_for_file: file_names

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:elkhlod/core/utils/functions/setup_service_locator.dart';

import '../../../../../../core/utils/network/api/network_api.dart';
import '../../../../../../core/utils/network/network_request.dart';
import '../../../../../../core/utils/network/network_utils.dart';
import '../../models/delete_and_add_talabat_model.dart';

typedef DeleteTalabatResponse = Either<String, String>;

abstract class DeleteTalabatRemoteDataSource {
  Future<DeleteTalabatResponse> deleteTalab(String talabId, String userId);
}

class DeleteTalabatRemoteDataSourceImpl extends DeleteTalabatRemoteDataSource {
  @override
  Future<DeleteTalabatResponse> deleteTalab(String talabId, String userId) async {
    DeleteTalabatResponse deleteMessageResponse = left("");
    var body = {
      "order_id": talabId,
      //"to_user_id": toUserId,
    };
    await getIt<NetworkRequest>().requestFutureData<DeleteAndAddTalabatModel>(
      Method.post,
      params: body,
      options: Options(contentType: Headers.formUrlEncodedContentType),
      url: NewApi.doServerDeleteTalabatApiCall,
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
