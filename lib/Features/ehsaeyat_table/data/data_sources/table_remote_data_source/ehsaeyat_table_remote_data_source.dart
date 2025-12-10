import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:hive/hive.dart';
import 'package:elkhlod/Features/ehsaeyat_table/data/models/table_header_model/ehsaeyat_table.dart';
import 'package:elkhlod/core/utils/constants.dart';

import '../../../../../core/utils/functions/setup_service_locator.dart';
import '../../../../../core/utils/network/api/network_api.dart';
import '../../../../../core/utils/network/network_request.dart';
import '../../../../../core/utils/network/network_utils.dart';
import '../../../../auth/login/domain/entities/employee_entity.dart';
import '../../models/table_header_model/ehsaeyat_table_model.dart';

typedef EhsaeyatTableResponse = Either<String, TableList>;

abstract class EhsaeyatTableRemoteDataSource {
  Future<EhsaeyatTableResponse> fetchEhsaeyatTableData();
}

class EhsaeyatTableRemoteDataSourceImpl extends EhsaeyatTableRemoteDataSource {
  @override
  Future<EhsaeyatTableResponse> fetchEhsaeyatTableData() async {
    EhsaeyatTableResponse tableResponse = left("");
    var box = Hive.box<EmployeeEntity>(kEmployeeDataBox);

    var body = {
      "emp_id": box.get(kEmployeeDataBox)!.employeeId!,
    };
    await getIt<NetworkRequest>().requestFutureData<EhsaeyatTableModel>(
      Method.post,
      params: body,
      options: Options(contentType: Headers.formUrlEncodedContentType),
      url: NewApi.doServerEhsaeyatTablesHorizontalApiCall,
      newBaseUrl: NewApi.baseUrl,
      onSuccess: (data) {
        if (data.status == 200) {
          tableResponse = right(data.data!);
        } else {
          tableResponse = left(data.message!);
        }
      },
      onError: (code, msg) {
        tableResponse = left(msg.toString());
      },
    );
    return tableResponse;
  }
}
