import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import '../../../../../core/utils/functions/setup_service_locator.dart';
import '../../../../../core/utils/network/api/network_api.dart';
import '../../../../../core/utils/network/network_request.dart';
import '../../../../../core/utils/network/network_utils.dart';
import '../../models/table_model/location_table_hodoor.dart';
import '../../models/table_model/location_table_model.dart';

typedef LocationTableResponse = Either<String, LocationTableList>;

abstract class LocationTableRemoteDataSource {
  Future<LocationTableResponse> fetchTableData(
      String fromDate, String toDate, String empId);
}

class LocationTableRemoteDataSourceImpl extends LocationTableRemoteDataSource {
  @override
  Future<LocationTableResponse> fetchTableData(
      String fromDate, String toDate, String empId) async {
    LocationTableResponse tableResponse = left("");

    var body = {
      "from_date": fromDate.trim(),
      "to_date": toDate.trim(),
      "emp_id_fk": empId,
      "page": "1",
      "per_page": "100"
    };
    await getIt<NetworkRequest>().requestFutureData<LocationTableModel>(
      Method.post,
      params: body,
      options: Options(contentType: Headers.formUrlEncodedContentType),
      url: NewApi.doServerTablesLocationApiCall,
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
