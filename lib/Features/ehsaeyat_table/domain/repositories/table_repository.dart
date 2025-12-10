import 'package:elkhlod/Features/ehsaeyat_table/data/data_sources/table_remote_data_source/ehsaeyat_table_data_remote_data_source.dart';

import '../../data/data_sources/table_remote_data_source/ehsaeyat_table_remote_data_source.dart';

abstract class EhsaeyatTableRepository {
  Future<EhsaeyatTableResponse> fetchTableData();

  Future<EhsaeyatTableDataResponse> fetchTableDataVertical();
}
