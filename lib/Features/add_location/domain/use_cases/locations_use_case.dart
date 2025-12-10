import 'package:elkhlod/Features/table/domain/entities/table_entity.dart';

import '../../data/data_sources/remote_data_source/all_locations_remote_data_source.dart';
import '../repositories/locations_repo.dart';

abstract class UseCase<type, Param> {
  Future<AllLocationsResponse> callAllLocations();
  Future<AddLocationtResponse> callAddLocations(String empId, dynamic image,
      String lat, String long, String siteId, String hodorId);

  Future<DeleteLocationtResponse> callDeleteLocations(String id);
  Future<AllSitesResponse> callAllSites();
}

class LocationsUseCase extends UseCase<TableEntity, void> {
  final LocationsRepo locationRepository;
  LocationsUseCase(this.locationRepository);

  @override
  Future<AllLocationsResponse> callAllLocations() async {
    return await locationRepository.fetchAllLocations();
  }

  @override
  Future<AddLocationtResponse> callAddLocations(String empId, image, String lat,
      String long, String siteId, String hodorId) async {
    return await locationRepository.addLocations(
        empId, image, lat, long, siteId, hodorId);
  }

  @override
  Future<DeleteLocationtResponse> callDeleteLocations(String id) {
    return locationRepository.deleteLocations(id);
  }

  @override
  Future<AllSitesResponse> callAllSites() {
    return locationRepository.fetchAllSites();
  }
}
