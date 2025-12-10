import '../../domain/repositories/ehsaeyat_repo.dart';
import '../data_sources/remote_data_source/all_ehsaeyat_remote_data_source.dart';

class EhsaeyatRepositoryImp extends EhsaeyatRepo {
  final AllEhsaeyatRemoteDataSource myEhsaeyatRemoteDataSource;

  EhsaeyatRepositoryImp(this.myEhsaeyatRemoteDataSource);

  @override
  Future<AllEhsaeyatResponse> fetchAllEhsaeyat(String userId) async {
    var userData = await myEhsaeyatRemoteDataSource.fetchAllEhsaeyat(userId);

    return userData;
  }
}
