import '../../domain/repositories/location_table_repository.dart';
import '../data_sources/table_remote_data_source/location_table_remote_data_source.dart';

class LocationTableRepositoryImp extends LocationTableRepository {
  final LocationTableRemoteDataSource tableRemoteDataSource;

  LocationTableRepositoryImp(this.tableRemoteDataSource);

  @override
  Future<LocationTableResponse> fetchTableData(
      String fromDate, String toDate, String empId) async {
    var userData =
        await tableRemoteDataSource.fetchTableData(fromDate, toDate, empId);

    return userData;
  }
}
