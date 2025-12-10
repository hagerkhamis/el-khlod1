// ignore_for_file: file_names

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:elkhlod/Features/lwae7/data/models/seen_lwae7_model.dart';
import 'package:elkhlod/core/utils/functions/setup_service_locator.dart';

import '../../../../../../core/utils/network/api/network_api.dart';
import '../../../../../../core/utils/network/network_request.dart';
import '../../../../../../core/utils/network/network_utils.dart';
import '../../../domain/entities/seen_lwae7_entity.dart';

typedef SeenLwae7Response = Either<String, SeenLwae7Entity>;

abstract class SeenLwae7RemoteDataSource {
  Future<SeenLwae7Response> seenlwae7(String messageId, String toUserId);
}

class SeenLwae7RemoteDataSourceImpl extends SeenLwae7RemoteDataSource {
  @override
  Future<SeenLwae7Response> seenlwae7(String messageId, String toUserId) async {
    SeenLwae7Response deleteMessageResponse = left("");
    var body = {
      "layha_id": messageId,
      "emp_id": toUserId,
    };
    await getIt<NetworkRequest>().requestFutureData<SeenLwae7Model>(
      Method.post,
      params: body,
      options: Options(contentType: Headers.formUrlEncodedContentType),
      url: NewApi.doServerSeenLayha,
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
