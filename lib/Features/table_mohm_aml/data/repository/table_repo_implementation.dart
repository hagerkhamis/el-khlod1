import '../../domain/repositories/maham_table_repository.dart';
import '../data_sources/table_remote_data_source/maham_table_remote_data_source.dart';

class MahamTableRepositoryImp extends MahamTableRepository {
  final MahamTableRemoteDataSource tableRemoteDataSource;

  MahamTableRepositoryImp(this.tableRemoteDataSource);

  @override
  Future<MahamTableResponse> fetchTableData(
      String fromDate, String toDate, String empId) async {
    var userData =
        await tableRemoteDataSource.fetchTableData(fromDate, toDate, empId);

    return userData;
  }
}
