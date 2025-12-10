import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:elkhlod/Features/permission_edara/data/models/type_talab_model.dart';
import 'package:elkhlod/core/utils/functions/setup_service_locator.dart';

import '../../../../../../core/utils/network/api/network_api.dart';
import '../../../../../../core/utils/network/network_request.dart';
import '../../../../../../core/utils/network/network_utils.dart';

typedef TalabatTypesResponse = Either<String, TalabatTypesList>;

abstract class TypeTalabatRemoteDataSource {
  Future<TalabatTypesResponse> fetchTypesTalabat();
}

class TypeTalabatRemoteDataSourceImpl extends TypeTalabatRemoteDataSource {
  @override
  Future<TalabatTypesResponse> fetchTypesTalabat() async {
    TalabatTypesResponse typeEzenResponse = left("");

    await getIt<NetworkRequest>().requestFutureData<TalabatModel>(
      Method.post,
      options: Options(contentType: Headers.formUrlEncodedContentType),
      url: NewApi.doServerTalabatTypes,
      newBaseUrl: NewApi.baseUrl,
      onSuccess: (data) {
        if (data.status == 200 && data.data != null) {
          typeEzenResponse = right(data.data!);
        } else if (data.status == 200 && data.data == null) {
          typeEzenResponse = left(data.message!);
        } else {
          typeEzenResponse = left(data.message!);
        }
      },
      onError: (code, msg) {
        typeEzenResponse = left(code.toString());
      },
    );
    return typeEzenResponse;
  }
}
