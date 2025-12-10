import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:elkhlod/Features/visits/data/models/all_visits_model.dart';
import 'package:elkhlod/core/utils/functions/setup_service_locator.dart';
import '../../../../../../core/utils/network/api/network_api.dart';
import '../../../../../../core/utils/network/network_request.dart';
import '../../../../../../core/utils/network/network_utils.dart';

typedef AllVisitsResponse = Either<String, VisitsTList>;

abstract class AllVisitsRemoteDataSource {
  Future<AllVisitsResponse> fetchAllVisits(String userId, String status);
}

class AllVisitsRemoteDataSourceImpl extends AllVisitsRemoteDataSource {
  @override
  Future<AllVisitsResponse> fetchAllVisits(String userId, String status) async {
    AllVisitsResponse allMobadraResponse = left("");
    var body = {
      "emp_id": userId,
      "status": status,
      "page": "1",
      "per_page": "100"
    };
    await getIt<NetworkRequest>().requestFutureData<VisitsListModel>(
      Method.post,
      params: body,
      options: Options(contentType: Headers.formUrlEncodedContentType),
      url: NewApi.doServerAllVisitsApiCall,
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
