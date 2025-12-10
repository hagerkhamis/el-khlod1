import '../../data/data_sources/table_remote_data_source/table_remote_data_source.dart';

abstract class TableRepository {
  Future<TableResponse> fetchTableData(
    String fromDate,
    String toDate,
    String empId,
  );
}
