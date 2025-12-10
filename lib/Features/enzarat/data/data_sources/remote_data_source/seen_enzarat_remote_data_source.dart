// ignore_for_file: file_names

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:elkhlod/Features/enzarat/data/models/seen_enzarat_model.dart';
import 'package:elkhlod/Features/enzarat/domain/entities/seen_ta3mem_entity.dart';
import 'package:elkhlod/core/utils/functions/setup_service_locator.dart';

import '../../../../../../core/utils/network/api/network_api.dart';
import '../../../../../../core/utils/network/network_request.dart';
import '../../../../../../core/utils/network/network_utils.dart';

typedef SeenEnzaratResponse = Either<String, SeenEnzaratEntity>;

abstract class SeenEnzaratRemoteDataSource {
  Future<SeenEnzaratResponse> seenEnzarat(String messageId, String toUserId);
}

class SeenEnzaratRemoteDataSourceImpl extends SeenEnzaratRemoteDataSource {
  @override
  Future<SeenEnzaratResponse> seenEnzarat(
      String messageId, String toUserId) async {
    SeenEnzaratResponse seenEnzaratResponse = left("");
    var body = {
      "enzar_id_fk": messageId,
      "emp_id": toUserId,
    };
    await getIt<NetworkRequest>().requestFutureData<SeenEnzaratModel>(
      Method.post,
      params: body,
      options: Options(contentType: Headers.formUrlEncodedContentType),
      url: NewApi.doServerSeenEnzarat,
      newBaseUrl: NewApi.baseUrl,
      onSuccess: (data) {
        if (data.status == 200) {
          seenEnzaratResponse = right(data);
        } else {
          seenEnzaratResponse = left(data.message!);
        }
      },
      onError: (code, msg) {
        seenEnzaratResponse = left(code.toString());
      },
    );
    return seenEnzaratResponse;
  }
}
