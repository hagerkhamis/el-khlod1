import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:elkhlod/Features/table/data/models/table_model/table_hodoor.dart';

import '../../../../../core/utils/functions/setup_service_locator.dart';
import '../../../../../core/utils/network/api/network_api.dart';
import '../../../../../core/utils/network/network_request.dart';
import '../../../../../core/utils/network/network_utils.dart';
import '../../models/table_model/table_model.dart';

typedef TableResponse = Either<String, TableList>;

abstract class TableRemoteDataSource {
  Future<TableResponse> fetchTableData(
      String fromDate, String toDate, String empId);
}

class TableRemoteDataSourceImpl extends TableRemoteDataSource {
  @override
  Future<TableResponse> fetchTableData(
      String fromDate, String toDate, String empId) async {
    TableResponse tableResponse = left("");

    var body = {
      "from_date": fromDate.trim(),
      "to_date": toDate.trim(),
      "emp_id_fk": empId,
      "page": "1",
      "per_page": "100"
    };
    await getIt<NetworkRequest>().requestFutureData<TableModel>(
      Method.post,
      params: body,
      options: Options(contentType: Headers.formUrlEncodedContentType),
      url: NewApi.doServerTablesApiCall,
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
