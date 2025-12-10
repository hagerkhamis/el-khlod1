import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:elkhlod/core/utils/functions/setup_service_locator.dart';

import '../../../../../../core/utils/network/api/network_api.dart';
import '../../../../../../core/utils/network/network_request.dart';
import '../../../../../../core/utils/network/network_utils.dart';
import '../../models/enzarat_model/my_enzarat_model.dart';
import '../../models/enzarat_model/enzarat.dart';

typedef AllEnzaratResponse = Either<String, AllEnzaratList>;

abstract class AllEnzaratRemoteDataSource {
  Future<AllEnzaratResponse> fetchAllEnzarat(String userId, String seen);
}

class AllEnzaratRemoteDataSourceImpl extends AllEnzaratRemoteDataSource {
  @override
  Future<AllEnzaratResponse> fetchAllEnzarat(String userId, String seen) async {
    AllEnzaratResponse allEnzaratResponse = left("");
    var body = {"page": "1", "per_page": "100", "emp_id": userId, "seen": seen};
    await getIt<NetworkRequest>().requestFutureData<MyEnzaratModel>(
      Method.post,
      params: body,
      options: Options(contentType: Headers.formUrlEncodedContentType),
      url: NewApi.doServerGetEnzaratList,
      newBaseUrl: NewApi.baseUrl,
      onSuccess: (data) {
        if (data.status == 200 && data.data != null) {
          allEnzaratResponse = right(data.data!);
        } else if (data.status == 200 && data.data == null) {
          allEnzaratResponse = left(data.message!);
        } else {
          allEnzaratResponse = left(data.message!);
        }
      },
      onError: (code, msg) {
        allEnzaratResponse = left(code.toString());
      },
    );
    return allEnzaratResponse;
  }
}
