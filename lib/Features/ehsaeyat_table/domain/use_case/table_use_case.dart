import 'package:elkhlod/Features/ehsaeyat_table/domain/entities/new_table_entity.dart';

import '../../data/data_sources/table_remote_data_source/ehsaeyat_table_data_remote_data_source.dart';
import '../../data/data_sources/table_remote_data_source/ehsaeyat_table_remote_data_source.dart';
import '../repositories/table_repository.dart';

abstract class UseCase<type> {
  Future<EhsaeyatTableResponse> call();

  Future<EhsaeyatTableDataResponse> callData();
}

class EhsaeyatTableUseCase extends UseCase<TableEntity> {
  final EhsaeyatTableRepository tableRepository;
  
  EhsaeyatTableUseCase(this.tableRepository);

  @override
  Future<EhsaeyatTableResponse> call() async {
    return await tableRepository.fetchTableData();
  }

    @override
  Future<EhsaeyatTableDataResponse> callData() async {
    return await tableRepository.fetchTableDataVertical();
  }
}
