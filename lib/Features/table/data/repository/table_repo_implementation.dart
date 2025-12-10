import '../../domain/repositories/table_repository.dart';
import '../data_sources/table_remote_data_source/table_remote_data_source.dart';

class TableRepositoryImp extends TableRepository {
  final TableRemoteDataSource tableRemoteDataSource;

  TableRepositoryImp(this.tableRemoteDataSource);

  @override
  Future<TableResponse> fetchTableData(
      String fromDate, String toDate, String empId) async {
    var userData =
        await tableRemoteDataSource.fetchTableData(fromDate, toDate, empId);

    return userData;
  }
}
