import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:elkhlod/Features/maham/data/models/delete_and_add_mahamt_model.dart';
import 'package:elkhlod/core/utils/functions/setup_service_locator.dart';

import '../../../../../../core/utils/network/api/network_api.dart';
import '../../../../../../core/utils/network/network_request.dart';
import '../../../../../../core/utils/network/network_utils.dart';

typedef AddMahamResponse = Either<String, String>;

abstract class AddMahamRemoteDataSource {
  Future<AddMahamResponse> addMaham(
      String empId, String title, String reason, String status);
}

class AddMahamRemoteDataSourceImpl extends AddMahamRemoteDataSource {
  @override
  Future<AddMahamResponse> addMaham(
      String empId, String title, String reason, String status) async {
    AddMahamResponse addMahamResponse = left("");
    var body = {
      "emp_id": empId,
      "status": status,
      "title": title,
      "notes": reason,
    };
    await getIt<NetworkRequest>().requestFutureData<DeleteAndAddMahamtModel>(
      Method.post,
      params: body,
      options: Options(contentType: Headers.formUrlEncodedContentType),
      url: NewApi.doServerAddMahamApiCall,
      newBaseUrl: NewApi.baseUrl,
      onSuccess: (data) {
        if (data.status == 200) {
          addMahamResponse = right(data.message!);
        } else {
          addMahamResponse = left(data.message.toString());
        }
      },
      onError: (code, msg) {
        addMahamResponse = left(code.toString());
      },
    );
    return addMahamResponse;
  }
}
