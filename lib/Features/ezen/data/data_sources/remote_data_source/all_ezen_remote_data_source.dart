import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:elkhlod/Features/ezen/data/models/all_ezn_model.dart';
import 'package:elkhlod/Features/ezen/data/models/ezen.dart';
import 'package:elkhlod/core/utils/functions/setup_service_locator.dart';

import '../../../../../../core/utils/network/api/network_api.dart';
import '../../../../../../core/utils/network/network_request.dart';
import '../../../../../../core/utils/network/network_utils.dart';

typedef AllEzenResponse = Either<String, AllEzenList>;

abstract class AllEzenRemoteDataSource {
  Future<AllEzenResponse> fetchAllEzen(String userId, String status);
  Future<AllEzenResponse> fetchWaredEzen(String userId);
}

class AllEzenRemoteDataSourceImpl extends AllEzenRemoteDataSource {
  @override
  Future<AllEzenResponse> fetchAllEzen(String userId, String status) async {
    AllEzenResponse allEzenResponse = left("");
    var body = {
      "emp_id": userId,
      "status": status,
    };
    await getIt<NetworkRequest>().requestFutureData<AllEznModel>(
      Method.post,
      params: body,
      options: Options(contentType: Headers.formUrlEncodedContentType),
      url: NewApi.doServerAllEznApiCall,
      newBaseUrl: NewApi.baseUrl,
      onSuccess: (data) {
        if (data.status == 200 && data.data != null) {
          allEzenResponse = right(data.data!);
        } else if (data.status == 200 && data.data == null) {
          allEzenResponse = left(data.message!);
        } else {
          allEzenResponse = left(data.message!);
        }
      },
      onError: (code, msg) {
        allEzenResponse = left(code.toString());
      },
    );
    return allEzenResponse;
  }

  @override
  Future<AllEzenResponse> fetchWaredEzen(String userId) async {
    AllEzenResponse allWaredEzenResponse = left("");
    var body = {
      "emp_id": userId,
    };
    await getIt<NetworkRequest>().requestFutureData<AllEznModel>(
      Method.post,
      params: body,
      options: Options(contentType: Headers.formUrlEncodedContentType),
      url: NewApi.doServerWaredEznApiCall,
      newBaseUrl: NewApi.baseUrl,
      onSuccess: (data) {
        if (data.status == 200 && data.data != null) {
          allWaredEzenResponse = right(data.data!);
        } else if (data.status == 200 && data.data == null) {
          allWaredEzenResponse = left(data.message!);
        } else {
          allWaredEzenResponse = left(data.message!);
        }
      },
      onError: (code, msg) {
        allWaredEzenResponse = left(code.toString());
      },
    );
    return allWaredEzenResponse;
  }
}
