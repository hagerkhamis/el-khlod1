import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:elkhlod/Features/vacation/data/models/all_vacation_model.dart';
import 'package:elkhlod/Features/vacation/data/models/vacation.dart';
import 'package:elkhlod/core/utils/functions/setup_service_locator.dart';

import '../../../../../../core/utils/network/api/network_api.dart';
import '../../../../../../core/utils/network/network_request.dart';
import '../../../../../../core/utils/network/network_utils.dart';

typedef AllVacationResponse = Either<String, AllVacationList>;

abstract class AllVacationRemoteDataSource {
  Future<AllVacationResponse> fetchAllVacation(String userId, String status);
}

class AllVacationRemoteDataSourceImpl extends AllVacationRemoteDataSource {
  @override
  Future<AllVacationResponse> fetchAllVacation(
      String userId, String status) async {
    AllVacationResponse allMessagesResponse = left("");
    var body = {
      "emp_id": userId,
      "status": status,
    };
    await getIt<NetworkRequest>().requestFutureData<AllVacationModel>(
      Method.post,
      params: body,
      options: Options(contentType: Headers.formUrlEncodedContentType),
      url: NewApi.doServerAllVacationApiCall,
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
