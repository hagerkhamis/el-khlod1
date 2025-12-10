import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import 'package:elkhlod/Features/permission_edara/data/models/all_talabat_model.dart';
import 'package:elkhlod/core/utils/functions/setup_service_locator.dart';

import '../../../../../../core/utils/network/api/network_api.dart';
import '../../../../../../core/utils/network/network_request.dart';
import '../../../../../../core/utils/network/network_utils.dart';

typedef AllTalabatResponse = Either<String, TalabatTList>;

abstract class AllTalabatRemoteDataSource {
  Future<AllTalabatResponse> fetchAllTalabat(String userId, String status);
}

class AllTalabtRemoteDataSourceImpl extends AllTalabatRemoteDataSource {
  @override
  Future<AllTalabatResponse> fetchAllTalabat(String userId, String status) async {
    AllTalabatResponse allMessagesResponse = left("");
    var body = {
      "emp_id": userId,
      "status": status,
      "page": "1",
      "per_page": "100"
    };
    await getIt<NetworkRequest>().requestFutureData<TalabatListModel>(
      Method.post,
      params: body,
      options: Options(contentType: Headers.formUrlEncodedContentType),
      url: NewApi.doServerTalabatList,
      newBaseUrl: NewApi.baseUrl,
      onSuccess: (data) {
        if (data.status == 200 && data.data != null) {
          allMessagesResponse = right(data.data!);
        } else if (data.status == 200 && data.data == null) {
          allMessagesResponse = left(data.message!);
        } else {
          allMessagesResponse = left(data.message!);
        }
      },
      onError: (code, msg) {
        allMessagesResponse = left(code.toString());
      },
    );
    return allMessagesResponse;
  }
}
