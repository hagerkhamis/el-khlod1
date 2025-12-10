import '../../data/data_sources/table_remote_data_source/maham_table_remote_data_source.dart';
import '../entities/new_table_entity.dart';
import '../repositories/maham_table_repository.dart';

abstract class UseCase<type> {
  Future<MahamTableResponse> call(String fromDate, String toDate, String empId);
}

class MahamTableUseCase extends UseCase<MahamTableEntity> {
  final MahamTableRepository tableRepository;
  MahamTableUseCase(this.tableRepository);

  @override
  Future<MahamTableResponse> call(
      String fromDate, String toDate, String empId) async {
    return await tableRepository.fetchTableData(fromDate, toDate, empId);
  }
}
