import '../../domain/repositories/locations_repo.dart';
import '../data_sources/remote_data_source/all_locations_remote_data_source.dart';

class LocationsRepositoryImp extends LocationsRepo {
  final AllLocationsRemoteDataSource myLocationsRemoteDataSource;

  LocationsRepositoryImp(this.myLocationsRemoteDataSource);

  @override
  Future<AllLocationsResponse> fetchAllLocations() async {
    var userData = await myLocationsRemoteDataSource.fetchAllLocations();

    return userData;
  }

  @override
  Future<AddLocationtResponse> addLocations(String empId, image, String lat,
      String long, String siteId, String hodorId) {
    return myLocationsRemoteDataSource.addLocations(
        empId, image, lat, long, siteId, hodorId);
  }

  @override
  Future<DeleteLocationtResponse> deleteLocations(String id) {
    return myLocationsRemoteDataSource.deleteLocations(id);
  }

  @override
  Future<AllSitesResponse> fetchAllSites() {
    return myLocationsRemoteDataSource.fetchAllSites();
  }
}
