import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:elkhlod/Features/vacation/data/models/delete_and_add_vacation_model.dart';
import 'package:elkhlod/core/utils/functions/setup_service_locator.dart';

import '../../../../../../core/utils/network/api/network_api.dart';
import '../../../../../../core/utils/network/network_request.dart';
import '../../../../../../core/utils/network/network_utils.dart';

typedef EgraaVacationResponse = Either<String, String>;

abstract class EgraaVacationRemoteDataSource {
  Future<EgraaVacationResponse> egraaVaction(
      String empId, String eznId, String action, String reason,String numDays );
}

class EgraaVacationRemoteDataSourceImpl extends EgraaVacationRemoteDataSource {
  @override
  Future<EgraaVacationResponse> egraaVaction(
      String empId, String eznId, String action, String reason,String numDays ) async {
    EgraaVacationResponse addVacationResponse = left("");
    var body = {
      "from_emp_id": empId,
      "agaza_id": eznId,
      "action_option": action,
      "reason": reason,
      "num_days": numDays,
    };
    await getIt<NetworkRequest>().requestFutureData<DeleteAndAddVacationModel>(
      Method.post,
      params: body,
      options: Options(contentType: Headers.formUrlEncodedContentType),
      url: NewApi.doServerEgraaVacationApiCall,
      newBaseUrl: NewApi.baseUrl,
      // isList: false,
      onSuccess: (data) {
        if (data.status == 200) {
          addVacationResponse = right(data.message!);
        } else {
          addVacationResponse = left(data.message.toString());
        }
      },
      onError: (code, msg) {
        addVacationResponse = left(code.toString());
      },
    );
    return addVacationResponse;
  }
}
