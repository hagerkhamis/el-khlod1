import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:elkhlod/Features/ezen/data/models/delete_and_add_ezen_model.dart';
import 'package:elkhlod/core/utils/functions/setup_service_locator.dart';

import '../../../../../../core/utils/network/api/network_api.dart';
import '../../../../../../core/utils/network/network_request.dart';
import '../../../../../../core/utils/network/network_utils.dart';

typedef EgraaEzenResponse = Either<String, String>;

abstract class EgraaEzenRemoteDataSource {
  Future<EgraaEzenResponse> egraaEzen(
      String empId, String eznId, String action, String reason);
}

class EgraaEzenRemoteDataSourceImpl extends EgraaEzenRemoteDataSource {
  @override
  Future<EgraaEzenResponse> egraaEzen(
      String empId, String eznId, String action, String reason) async {
    EgraaEzenResponse egraaEzenResponse = left("");
    var body = {
      "from_emp_id": empId,
      "ezn_id": eznId,
      "action_option": action,
      "reason": reason,
    };
    await getIt<NetworkRequest>().requestFutureData<DeleteAndAddEzenModel>(
      Method.post,
      params: body,
      options: Options(contentType: Headers.formUrlEncodedContentType),
      url: NewApi.doServerEgraaEznApiCall,
      newBaseUrl: NewApi.baseUrl,
      // isList: false,
      onSuccess: (data) {
        if (data.status == 200) {
          egraaEzenResponse = right(data.message!);
        } else {
          egraaEzenResponse = left(data.message.toString());
        }
      },
      onError: (code, msg) {
        egraaEzenResponse = left(code.toString());
      },
    );
    return egraaEzenResponse;
  }
}
