import '../../data/data_sources/table_remote_data_source/location_table_remote_data_source.dart';

abstract class LocationTableRepository {
  Future<LocationTableResponse> fetchTableData(
    String fromDate,
    String toDate,
    String empId,
  );
}
