import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import 'package:elkhlod/Features/mobadarat/data/models/all_mobadarat_model.dart';
import 'package:elkhlod/core/utils/functions/setup_service_locator.dart';

import '../../../../../../core/utils/network/api/network_api.dart';
import '../../../../../../core/utils/network/network_request.dart';
import '../../../../../../core/utils/network/network_utils.dart';

typedef AllMobadaratResponse = Either<String, MobadaratTList>;

abstract class AllMobadaratRemoteDataSource {
  Future<AllMobadaratResponse> fetchAllMobadarat(String userId, String status);
}

class AllMobadaratRemoteDataSourceImpl extends AllMobadaratRemoteDataSource {
  @override
  Future<AllMobadaratResponse> fetchAllMobadarat(
      String userId, String status) async {
    AllMobadaratResponse allMobadraResponse = left("");
    var body = {
      "emp_id": userId,
      "status": status,
      "page": "1",
      "per_page": "100"
    };
    await getIt<NetworkRequest>().requestFutureData<MobadaratListModel>(
      Method.post,
      params: body,
      options: Options(contentType: Headers.formUrlEncodedContentType),
      url: NewApi.doServerAllMobadaratApiCall,
      newBaseUrl: NewApi.baseUrl,
      onSuccess: (data) {
        if (data.status == 200 && data.data != null) {
          allMobadraResponse = right(data.data!);
        } else if (data.status == 200 && data.data == null) {
          allMobadraResponse = left(data.message!);
        } else {
          allMobadraResponse = left(data.message!);
        }
      },
      onError: (code, msg) {
        allMobadraResponse = left(code.toString());
      },
    );
    return allMobadraResponse;
  }
}
