// ignore_for_file: file_names

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:elkhlod/core/utils/functions/setup_service_locator.dart';

import '../../../../../../core/utils/network/api/network_api.dart';
import '../../../../../../core/utils/network/network_request.dart';
import '../../../../../../core/utils/network/network_utils.dart';
import '../../models/delete_and_add_mahamt_model.dart';

typedef DeleteMohamResponse = Either<String, String>;

abstract class DeleteMahamRemoteDataSource {
  Future<DeleteMohamResponse> deleteMaham(String talabId, String userId);
} 


class DeleteMahamRemoteDataSourceImpl extends DeleteMahamRemoteDataSource {
  @override
  Future<DeleteMohamResponse> deleteMaham(String talabId, String userId) async {
    DeleteMohamResponse deleteMahamResponse = left("");
    var body = {
      "task_id": talabId,
      //"to_user_id": toUserId,
    };
    await getIt<NetworkRequest>().requestFutureData<DeleteAndAddMahamtModel>(
      Method.post,
      params: body,
      options: Options(contentType: Headers.formUrlEncodedContentType),
      url: NewApi.doServerDeleteMahamApiCall,
      newBaseUrl: NewApi.baseUrl,
      onSuccess: (data) {
        if (data.status == 200) {
          deleteMahamResponse = right(data.message!);
        } else {
          deleteMahamResponse = left(data.message!);
        }
      },
      onError: (code, msg) {
        deleteMahamResponse = left(code.toString());
      },
    );
    return deleteMahamResponse;
  }
}
