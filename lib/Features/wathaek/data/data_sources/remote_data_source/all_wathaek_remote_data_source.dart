import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import 'package:elkhlod/core/utils/functions/setup_service_locator.dart';

import '../../../../../../core/utils/network/api/network_api.dart';
import '../../../../../../core/utils/network/network_request.dart';
import '../../../../../../core/utils/network/network_utils.dart';
import '../../models/all_wathaek_model.dart';

typedef AllWathaekResponse = Either<String, WathaekList>;

abstract class AllWathaekRemoteDataSource {
  Future<AllWathaekResponse> fetchAllWathaek(String userId, String status);
}

class AllWathaekRemoteDataSourceImpl extends AllWathaekRemoteDataSource {
  @override
  Future<AllWathaekResponse> fetchAllWathaek(
      String userId, String status) async {
    AllWathaekResponse allWathaekResponse = left("");
    var body = {"emp_id": userId, "page": "1", "per_page": "100"};
    await getIt<NetworkRequest>().requestFutureData<WathaekListModel>(
      Method.post,
      params: body,
      options: Options(contentType: Headers.formUrlEncodedContentType),
      url: NewApi.doServerAllwathaekApiCall,
      newBaseUrl: NewApi.baseUrl,
      onSuccess: (data) {
        if (data.status == 200 && data.data != null) {
          allWathaekResponse = right(data.data!);
        } else if (data.status == 200 && data.data == null) {
          allWathaekResponse = left(data.message!);
        } else {
          allWathaekResponse = left(data.message!);
        }
      },
      onError: (code, msg) {
        allWathaekResponse = left(code.toString());
      },
    );
    return allWathaekResponse;
  }
}
