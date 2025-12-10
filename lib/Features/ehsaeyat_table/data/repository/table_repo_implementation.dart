import 'package:elkhlod/Features/ehsaeyat_table/data/data_sources/table_remote_data_source/ehsaeyat_table_data_remote_data_source.dart';

import '../../domain/repositories/table_repository.dart';
import '../data_sources/table_remote_data_source/ehsaeyat_table_remote_data_source.dart';

class EhsaeyatTableRepositoryImp extends EhsaeyatTableRepository {
  final EhsaeyatTableRemoteDataSource tableRemoteDataSource;
  final EhsaeyatTableDataRemoteDataSource tableDataRemoteDataSource;

  EhsaeyatTableRepositoryImp(
      this.tableRemoteDataSource, this.tableDataRemoteDataSource);

  @override
  Future<EhsaeyatTableResponse> fetchTableData() async {
    var userData = await tableRemoteDataSource.fetchEhsaeyatTableData();

    return userData;
  }

    @override
  Future<EhsaeyatTableDataResponse> fetchTableDataVertical() async {
    var userData = await tableDataRemoteDataSource.fetchEhsaeyatTableData();

    return userData;
  }
}
