// ignore_for_file: file_names

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:elkhlod/core/utils/functions/setup_service_locator.dart';

import '../../../../../../core/utils/network/api/network_api.dart';
import '../../../../../../core/utils/network/network_request.dart';
import '../../../../../../core/utils/network/network_utils.dart';
import '../../models/delete_and_add_wathaek_model.dart';

typedef DeleteWathaekResponse = Either<String, String>;

abstract class DeleteWathaekRemoteDataSource {
  Future<DeleteWathaekResponse> deleteWathaek(String talabId, String userId);
}

class DeleteWathaektRemoteDataSourceImpl extends DeleteWathaekRemoteDataSource {
  @override
  Future<DeleteWathaekResponse> deleteWathaek(
      String talabId, String userId) async {
    DeleteWathaekResponse deleteWathaekResponse = left("");
    var body = {
      "main_id": talabId,
      //"to_user_id": toUserId,
    };
    await getIt<NetworkRequest>().requestFutureData<DeleteAndAddWathaekModel>(
      Method.post,
      params: body,
      options: Options(contentType: Headers.formUrlEncodedContentType),
      url: NewApi.doServerDeletewathaekApiCall,
      newBaseUrl: NewApi.baseUrl,
      onSuccess: (data) {
        if (data.status == 200) {
          deleteWathaekResponse = right(data.message!);
        } else {
          deleteWathaekResponse = left(data.message!);
        }
      },
      onError: (code, msg) {
        deleteWathaekResponse = left(code.toString());
      },
    );
    return deleteWathaekResponse;
  }
}
