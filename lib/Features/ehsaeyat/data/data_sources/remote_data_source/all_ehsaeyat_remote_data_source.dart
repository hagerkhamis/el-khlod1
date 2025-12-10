import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:elkhlod/Features/ehsaeyat/data/models/my_messages_model/ehsaeyat_model.dart';
import 'package:elkhlod/core/utils/functions/setup_service_locator.dart';

import '../../../../../../core/utils/network/api/network_api.dart';
import '../../../../../../core/utils/network/network_request.dart';
import '../../../../../../core/utils/network/network_utils.dart';

typedef AllEhsaeyatResponse = Either<String, EhsaeyatList>;

abstract class AllEhsaeyatRemoteDataSource {
  Future<AllEhsaeyatResponse> fetchAllEhsaeyat(String userId);
}

class AllEhsaeyatRemoteDataSourceImpl extends AllEhsaeyatRemoteDataSource {
  @override
  Future<AllEhsaeyatResponse> fetchAllEhsaeyat(String userId) async {
    AllEhsaeyatResponse allEhsaeyatResponse = left("");
    var body = {"emp_id": userId};
    await getIt<NetworkRequest>().requestFutureData<EhsaeyatListModel>(
      Method.post,
      params: body,
      options: Options(contentType: Headers.formUrlEncodedContentType),
      url: NewApi.doServerEhsaeyatList,
      newBaseUrl: NewApi.baseUrl,
      onSuccess: (data) {
        if (data.status == 200 && data.data != null) {
          allEhsaeyatResponse = right(data.data!);
        } else if (data.status == 200 && data.data == null) {
          allEhsaeyatResponse = left(data.message!);
        } else {
          allEhsaeyatResponse = left(data.message!);
        }
      },
      onError: (code, msg) {
        allEhsaeyatResponse = left(code.toString());
      },
    );
    return allEhsaeyatResponse;
  }
}
