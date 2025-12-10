import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:elkhlod/core/utils/functions/setup_service_locator.dart';

import '../../../../../../core/utils/network/api/network_api.dart';
import '../../../../../../core/utils/network/network_request.dart';
import '../../../../../../core/utils/network/network_utils.dart';
import '../../models/my_messages_model/lwae7.dart';
import '../../models/my_messages_model/my_lwae7_model.dart';

typedef AllLwae7Response = Either<String, AllLwae7List>;

abstract class AllLwae7RemoteDataSource {
  Future<AllLwae7Response> fetchAllTa3mem(String userId, String seen);
}

class AllLwae7RemoteDataSourceImpl extends AllLwae7RemoteDataSource {
  @override
  Future<AllLwae7Response> fetchAllTa3mem(String userId, String seen) async {
    AllLwae7Response allTa3memResponse = left("");
    var body = {"page": "1", "per_page": "100", "emp_id": userId};
    await getIt<NetworkRequest>().requestFutureData<MyLwae7Model>(
      Method.post,
      params: body,
      options: Options(contentType: Headers.formUrlEncodedContentType),
      url: NewApi.doServerGetLawa2hList,
      newBaseUrl: NewApi.baseUrl,
      onSuccess: (data) {
        if (data.status == 200 && data.data != null) {
          allTa3memResponse = right(data.data!);
        } else if (data.status == 200 && data.data == null) {
          allTa3memResponse = left(data.message!);
        } else {
          allTa3memResponse = left(data.message!);
        }
      },
      onError: (code, msg) {
        allTa3memResponse = left(code.toString());
      },
    );
    return allTa3memResponse;
  }
}
