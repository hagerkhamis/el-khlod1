import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:hive/hive.dart';
import 'package:elkhlod/Features/auth/login/domain/entities/employee_entity.dart';
import 'package:elkhlod/Features/visits/data/models/bnod_model.dart';
import 'package:elkhlod/core/utils/constants.dart';

import 'package:elkhlod/core/utils/functions/setup_service_locator.dart';

import '../../../../../../core/utils/network/api/network_api.dart';
import '../../../../../../core/utils/network/network_request.dart';
import '../../../../../../core/utils/network/network_utils.dart';

typedef AllBnodResponse = Either<String, BandsTList>;

abstract class AllBnodRemoteDataSource {
  Future<AllBnodResponse> fetchAllBnod(String teacherId);
}

class AllBnodRemoteDataSourceImpl extends AllBnodRemoteDataSource {
  @override
  Future<AllBnodResponse> fetchAllBnod(String teacherId) async {
    var box = Hive.box<EmployeeEntity>(kEmployeeDataBox);
    AllBnodResponse allBnodResponse = left("");

    var body = {
      "emp_id": box.get(kEmployeeDataBox)!.employeeId!,
      "teacher_id": teacherId
    };

    await getIt<NetworkRequest>().requestFutureData<BnodModel>(
      Method.post,
      params: body,
      options: Options(contentType: Headers.formUrlEncodedContentType),
      url: NewApi.doServerAllBnodApiCall,
      newBaseUrl: NewApi.baseUrl,
      onSuccess: (data) {
        if (data.status == 200 && data.data != null) {
          allBnodResponse = right(data.data!);
        } else if (data.status == 200 && data.data == null) {
          allBnodResponse = left(data.message!);
        } else {
          allBnodResponse = left(data.message!);
        }
      },
      onError: (code, msg) {
        allBnodResponse = left(code.toString());
      },
    );
    return allBnodResponse;
  }
}
