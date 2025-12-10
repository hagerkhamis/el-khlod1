import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:hive/hive.dart';
import 'package:elkhlod/Features/auth/login/domain/entities/employee_entity.dart';

import 'package:elkhlod/Features/visits/data/models/teachers_model.dart';
import 'package:elkhlod/core/utils/constants.dart';
import 'package:elkhlod/core/utils/functions/setup_service_locator.dart';

import '../../../../../../core/utils/network/api/network_api.dart';
import '../../../../../../core/utils/network/network_request.dart';
import '../../../../../../core/utils/network/network_utils.dart';

typedef AllTeacherResponse = Either<String, TeachersTList>;

abstract class AllTeachersRemoteDataSource {
  Future<AllTeacherResponse> fetchAllTeacher(String userId);
}

class AllTeachersRemoteDataSourceImpl extends AllTeachersRemoteDataSource {
  @override
  Future<AllTeacherResponse> fetchAllTeacher(String userId) async {
    var box = Hive.box<EmployeeEntity>(kEmployeeDataBox);
    AllTeacherResponse allTeacherResponse = left("");
    var body = {
      "emp_id": box.get(kEmployeeDataBox)!.employeeId!,
    };
    await getIt<NetworkRequest>().requestFutureData<TeacherModel>(
      Method.post,
      params: body,
      options: Options(contentType: Headers.formUrlEncodedContentType),
      url: NewApi.doServerAllTeachersApiCall,
      newBaseUrl: NewApi.baseUrl,
      onSuccess: (data) {
        if (data.status == 200 && data.data != null) {
          allTeacherResponse = right(data.data!);
        } else if (data.status == 200 && data.data == null) {
          allTeacherResponse = left(data.message!);
        } else {
          allTeacherResponse = left(data.message!);
        }
      },
      onError: (code, msg) {
        allTeacherResponse = left(code.toString());
      },
    );
    return allTeacherResponse;
  }
}
