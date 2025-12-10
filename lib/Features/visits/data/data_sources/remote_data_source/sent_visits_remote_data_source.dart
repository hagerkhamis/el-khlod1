import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:elkhlod/Features/visits/data/models/delete_and_add_visits_model.dart';
import 'package:elkhlod/core/utils/functions/setup_service_locator.dart';

import '../../../../../../core/utils/network/api/network_api.dart';
import '../../../../../../core/utils/network/network_request.dart';
import '../../../../../../core/utils/network/network_utils.dart';

typedef AddVisitsResponse = Either<String, String>;

abstract class AddVisitsRemoteDataSource {
  Future<AddVisitsResponse> addVisits(
      String empId,
      String techerId,
      String title,
      String reason,
      String hesa,
      String numStudent,
      String fasl,
      var listBnod);
}

class AddVisitsRemoteDataSourceImpl extends AddVisitsRemoteDataSource {
  @override
  Future<AddVisitsResponse> addVisits(
      String empId,
      String techerId,
      String title,
      String reason,
      String hesa,
      String numStudent,
      String fasl,
      var listBnod) async {
    AddVisitsResponse addVisitsResponse = left("");
    var body = {
      "emp_id": empId,
      "teacher_id_fk": techerId,
      "visit_title": title,
      "hesa": hesa,
      "fasl": fasl,
      "num_std": numStudent,
      "notes": reason,
      "bnodItemList": listBnod
    };
    await getIt<NetworkRequest>().requestFutureData<DeleteAndAddVisitsModel>(
      Method.post,
      params: body,
      options: Options(contentType: Headers.jsonContentType),
      url: NewApi.doServerAddVisitsApiCall,
      newBaseUrl: NewApi.baseUrl,
      onSuccess: (data) {
        if (data.status == 200) {
          addVisitsResponse = right(data.message!);
        } else {
          addVisitsResponse = left(data.message.toString());
        }
      },
      onError: (code, msg) {
        addVisitsResponse = left(code.toString());
      },
    );
    return addVisitsResponse;
  }
}
