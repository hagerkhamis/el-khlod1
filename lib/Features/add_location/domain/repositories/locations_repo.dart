import '../../data/data_sources/remote_data_source/all_locations_remote_data_source.dart';

abstract class LocationsRepo {
  Future<AllLocationsResponse> fetchAllLocations();

  Future<AddLocationtResponse> addLocations(String empId, dynamic image,
      String lat, String long, String siteId, String hodorId);

  Future<DeleteLocationtResponse> deleteLocations(String id);

  Future<AllSitesResponse> fetchAllSites();
}
