// ignore_for_file: file_names

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:elkhlod/Features/ta3mem/data/models/seen_ta3mem_model.dart';
import 'package:elkhlod/core/utils/functions/setup_service_locator.dart';

import '../../../../../../core/utils/network/api/network_api.dart';
import '../../../../../../core/utils/network/network_request.dart';
import '../../../../../../core/utils/network/network_utils.dart';
import '../../../domain/entities/seen_ta3mem_entity.dart';

typedef SeenTa3memResponse = Either<String, SeenTa3memEntity>;

abstract class SeenTa3memRemoteDataSource {
  Future<SeenTa3memResponse> seenTa3mem(String messageId, String toUserId);
}

class SeenTa3memRemoteDataSourceImpl extends SeenTa3memRemoteDataSource {
  @override
  Future<SeenTa3memResponse> seenTa3mem(
      String messageId, String toUserId) async {
    SeenTa3memResponse deleteMessageResponse = left("");
    var body = {
      "ta3mem_id_fk": messageId,
      "emp_id": toUserId,
    };
    await getIt<NetworkRequest>().requestFutureData<SeenTa3memModel>(
      Method.post,
      params: body,
      options: Options(contentType: Headers.formUrlEncodedContentType),
      url: NewApi.doServerSeenTa3mem,
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
