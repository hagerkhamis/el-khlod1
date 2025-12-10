import '../../data/data_sources/table_remote_data_source/maham_table_remote_data_source.dart';

abstract class MahamTableRepository {
  Future<MahamTableResponse> fetchTableData(
    String fromDate,
    String toDate,
    String empId,
  );
}
