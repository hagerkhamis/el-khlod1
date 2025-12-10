import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:elkhlod/Features/permission_edara/data/models/delete_and_add_talabat_model.dart';
import 'package:elkhlod/core/utils/functions/setup_service_locator.dart';

import '../../../../../../core/utils/network/api/network_api.dart';
import '../../../../../../core/utils/network/network_request.dart';
import '../../../../../../core/utils/network/network_utils.dart';

typedef AddTalabatResponse = Either<String, String>;

abstract class AddTalabatRemoteDataSource {
  Future<AddTalabatResponse> addTalab(
      String empId, String typeId, String reason);
}

class AddTalabatRemoteDataSourceImpl extends AddTalabatRemoteDataSource {
  @override
  Future<AddTalabatResponse> addTalab(
      String empId, String typeId, String reason) async {
    AddTalabatResponse addEzenResponse = left("");
    var body = {
      "emp_id": empId,
      "talab_type_id": typeId,
      "notes": reason,
    };
    await getIt<NetworkRequest>().requestFutureData<DeleteAndAddTalabatModel>(
      Method.post,
      params: body,
      options: Options(contentType: Headers.formUrlEncodedContentType),
      url: NewApi.doServerAddTalab,
      newBaseUrl: NewApi.baseUrl,

      // isList: false,
      onSuccess: (data) {
        if (data.status == 200) {
          addEzenResponse = right(data.message!);
        } else {
          addEzenResponse = left(data.message.toString());
        }
      },
      onError: (code, msg) {
        addEzenResponse = left(code.toString());
      },
    );
    return addEzenResponse;
  }
}
