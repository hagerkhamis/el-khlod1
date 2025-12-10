import '../../data/data_sources/remote_data_source/all_ehsaeyat_remote_data_source.dart';

abstract class EhsaeyatRepo {
  Future<AllEhsaeyatResponse> fetchAllEhsaeyat(
    String userId,
  );
}
