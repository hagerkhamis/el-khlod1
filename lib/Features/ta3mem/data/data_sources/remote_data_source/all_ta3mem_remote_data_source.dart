import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:elkhlod/core/utils/functions/setup_service_locator.dart';

import '../../../../../../core/utils/network/api/network_api.dart';
import '../../../../../../core/utils/network/network_request.dart';
import '../../../../../../core/utils/network/network_utils.dart';
import '../../models/my_messages_model/ta3mem.dart';
import '../../models/my_messages_model/my_ta3mem_model.dart';

typedef AllTa3memResponse = Either<String, AllTa3memList>;

abstract class AllTa3memRemoteDataSource {
  Future<AllTa3memResponse> fetchAllTa3mem(String userId, String seen);
}

class AllTa3memRemoteDataSourceImpl extends AllTa3memRemoteDataSource {
  @override
  Future<AllTa3memResponse> fetchAllTa3mem(String userId, String seen) async {
    AllTa3memResponse allTa3memResponse = left("");
    var body = {"page": "1", "per_page": "100", "emp_id": userId, "seen": seen};
    await getIt<NetworkRequest>().requestFutureData<MyTa3memModel>(
      Method.post,
      params: body,
      options: Options(contentType: Headers.formUrlEncodedContentType),
      url: NewApi.doServerGetTa3memList,
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
