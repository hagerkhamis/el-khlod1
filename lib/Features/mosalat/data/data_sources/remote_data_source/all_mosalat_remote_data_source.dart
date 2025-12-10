import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:elkhlod/core/utils/functions/setup_service_locator.dart';

import '../../../../../../core/utils/network/api/network_api.dart';
import '../../../../../../core/utils/network/network_request.dart';
import '../../../../../../core/utils/network/network_utils.dart';
import '../../models/my_messages_model/mosalat.dart';
import '../../models/my_messages_model/my_mosalat_model.dart';

typedef AllMosalatResponse = Either<String, AllMosalatList>;

abstract class AllMosalatRemoteDataSource {
  Future<AllMosalatResponse> fetchAllMosalat(String userId, String seen);
}

class AllMosalatRemoteDataSourceImpl extends AllMosalatRemoteDataSource {
  @override
  Future<AllMosalatResponse> fetchAllMosalat(String userId, String seen) async {
    AllMosalatResponse allMosalatResponse = left("");
    var body = {"page": "1", "per_page": "100", "emp_id": userId};
    await getIt<NetworkRequest>().requestFutureData<MyMosalatModel>(
      Method.post,
      params: body,
      options: Options(contentType: Headers.formUrlEncodedContentType),
      url: NewApi.doServerGetMosalatList,
      newBaseUrl: NewApi.baseUrl,
      onSuccess: (data) {
        if (data.status == 200 && data.data != null) {
          allMosalatResponse = right(data.data!);
        } else if (data.status == 200 && data.data == null) {
          allMosalatResponse = left(data.message!);
        } else {
          allMosalatResponse = left(data.message!);
        }
      },
      onError: (code, msg) {
        allMosalatResponse = left(code.toString());
      },
    );
    return allMosalatResponse;
  }
}
