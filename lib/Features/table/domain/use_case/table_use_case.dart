import '../../data/data_sources/table_remote_data_source/table_remote_data_source.dart';
import '../entities/table_entity.dart';
import '../repositories/table_repository.dart';

abstract class UseCase<type> {
  Future<TableResponse> call(String fromDate, String toDate, String empId);
}

class TableUseCase extends UseCase<TableEntity> {
  final TableRepository tableRepository;
  TableUseCase(this.tableRepository);

  @override
  Future<TableResponse> call(
      String fromDate, String toDate, String empId) async {
    return await tableRepository.fetchTableData(fromDate, toDate, empId);
  }
}
