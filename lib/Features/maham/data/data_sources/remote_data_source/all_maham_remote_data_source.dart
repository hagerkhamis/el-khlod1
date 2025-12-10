import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import 'package:elkhlod/Features/maham/data/models/maham_model.dart';
import 'package:elkhlod/core/utils/functions/setup_service_locator.dart';

import '../../../../../../core/utils/network/api/network_api.dart';
import '../../../../../../core/utils/network/network_request.dart';
import '../../../../../../core/utils/network/network_utils.dart';

typedef AllMahamResponse = Either<String, MahamTList>;

abstract class AllMahamRemoteDataSource {
  Future<AllMahamResponse> fetchAllMaham(String userId, String status);
}

class AllMahamRemoteDataSourceImpl extends AllMahamRemoteDataSource {
  @override
  Future<AllMahamResponse> fetchAllMaham(String userId, String status) async {
    AllMahamResponse allMahamResponse = left("");
    var body = {
      "emp_id": userId,
      "status": status,
      "page": "1",
      "per_page": "100"
    };
    await getIt<NetworkRequest>().requestFutureData<MahamModel>(
      Method.post,
      params: body,
      options: Options(contentType: Headers.formUrlEncodedContentType),
      url: NewApi.doServerAllMahamApiCall,
      newBaseUrl: NewApi.baseUrl,
      onSuccess: (data) {
        if (data.status == 200 && data.data != null) {
          allMahamResponse = right(data.data!);
        } else if (data.status == 200 && data.data == null) {
          allMahamResponse = left(data.message!);
        } else {
          allMahamResponse = left(data.message!);
        }
      },
      onError: (code, msg) {
        allMahamResponse = left(code.toString());
      },
    );
    return allMahamResponse;
  }
}
