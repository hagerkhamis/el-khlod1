import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:elkhlod/Features/mobadarat/data/models/delete_and_add_mobadarat_model.dart';
import 'package:elkhlod/core/utils/functions/setup_service_locator.dart';

import '../../../../../../core/utils/network/api/network_api.dart';
import '../../../../../../core/utils/network/network_request.dart';
import '../../../../../../core/utils/network/network_utils.dart';

typedef AddMobadaratResponse = Either<String, String>;

abstract class AddMobadaratRemoteDataSource {
  Future<AddMobadaratResponse> addMobadarat(
      String empId, String title, String reason);
}

class AddMobadaratRemoteDataSourceImpl extends AddMobadaratRemoteDataSource {
  @override
  Future<AddMobadaratResponse> addMobadarat(
      String empId, String title, String reason) async {
    AddMobadaratResponse addMobadaratResponse = left("");
    var body = {
      "emp_id": empId,
      "title": title,
      "notes": reason,
    };
    await getIt<NetworkRequest>().requestFutureData<DeleteAndAddMobadaratModel>(
      Method.post,
      params: body,
      options: Options(contentType: Headers.formUrlEncodedContentType),
      url: NewApi.doServerAddMobadaratApiCall,
      newBaseUrl: NewApi.baseUrl,
      onSuccess: (data) {
        if (data.status == 200) {
          addMobadaratResponse = right(data.message!);
        } else {
          addMobadaratResponse = left(data.message.toString());
        }
      },
      onError: (code, msg) {
        addMobadaratResponse = left(code.toString());
      },
    );
    return addMobadaratResponse;
  }
}
