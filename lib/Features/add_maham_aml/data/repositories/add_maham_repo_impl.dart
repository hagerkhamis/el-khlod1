import '../../domain/repositories/add_maham_repo.dart';
import '../data_sources/remote_data_source/add_maham_aml_remote_data_source.dart';

class AddMahamAmlRepositoryImp extends AddMahamRepo {
  final AddMahamAmlRemoteDataSource myLocationsRemoteDataSource;

  AddMahamAmlRepositoryImp(this.myLocationsRemoteDataSource);

  @override
  Future<AddMahamResponse> addMaham(String empId, dynamic image, String lat,
      String long, String empNam, String mahamGeham, String mahamReason) {
    return myLocationsRemoteDataSource.addMaham(
        empId, image, lat, empNam, long, mahamGeham, mahamReason);
  }
}
