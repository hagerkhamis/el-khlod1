import '../../data/data_sources/table_remote_data_source/location_table_remote_data_source.dart';
import '../entities/new_table_entity.dart';
import '../repositories/location_table_repository.dart';

abstract class UseCase<type> {
  Future<LocationTableResponse> call(
      String fromDate, String toDate, String empId);
}

class LocationTableUseCase extends UseCase<LocationTableEntity> {
  final LocationTableRepository tableRepository;
  LocationTableUseCase(this.tableRepository);

  @override
  Future<LocationTableResponse> call(
      String fromDate, String toDate, String empId) async {
    return await tableRepository.fetchTableData(fromDate, toDate, empId);
  }
}
