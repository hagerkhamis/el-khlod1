// ignore_for_file: file_names

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:elkhlod/Features/ezen/data/models/delete_and_add_ezen_model.dart';
import 'package:elkhlod/core/utils/functions/setup_service_locator.dart';

import '../../../../../../core/utils/network/api/network_api.dart';
import '../../../../../../core/utils/network/network_request.dart';
import '../../../../../../core/utils/network/network_utils.dart';

typedef DeleteEzenResponse = Either<String, String>;

abstract class DeleteEzenRemoteDataSource {
  Future<DeleteEzenResponse> deleteMessage(String ezenId, String userId);
}

class DeleteEzenRemoteDataSourceImpl extends DeleteEzenRemoteDataSource {
  @override
  Future<DeleteEzenResponse> deleteMessage(String ezenId, String userId) async {
    DeleteEzenResponse deleteEzenResponse = left("");
    var body = {
      "ezn_id": ezenId,
      //"to_user_id": toUserId,
    };
    await getIt<NetworkRequest>().requestFutureData<DeleteAndAddEzenModel>(
      Method.post,
      params: body,
      options: Options(contentType: Headers.formUrlEncodedContentType),
      url: NewApi.doServerDeleteEznApiCall,
      newBaseUrl: NewApi.baseUrl,
      onSuccess: (data) {
        if (data.status == 200) {
          deleteEzenResponse = right(data.message!);
        } else {
          deleteEzenResponse = left(data.message!);
        }
      },
      onError: (code, msg) {
        deleteEzenResponse = left(code.toString());
      },
    );
    return deleteEzenResponse;
  }
}
