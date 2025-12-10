import 'package:elkhlod/Features/app_home/data/dat_source/finger_print/_remote_data_source/all_services_remote_data_source.dart';

import '../../domain/repository/finger_print_repo.dart';
import '../dat_source/finger_print/_remote_data_source/finger_print_remote_data_source.dart';

class FingerPrintRepoImpl extends FingerPrintRepository {
  final FingerPrintRemoteDataSource fingerPrintRemoteDataSource;
  final AllServicesRemoteDataSource allServicesRemoteDataSource;
  

  FingerPrintRepoImpl(
      this.fingerPrintRemoteDataSource, this.allServicesRemoteDataSource);
  @override
  Future<FingerPrintResponse> addFingerPrint(String empId) async {
    var fingerPrintData =
        await fingerPrintRemoteDataSource.addFingerPrint(empId);

    return fingerPrintData;
  }

  @override
  Future<AllServicesResponse> fetchAllServices() async {
    var services = await allServicesRemoteDataSource.fetchAllServices();

    return services;
  }
  
  @override
  Future<NtaqResponse> fetchNtaq(String empId) async{
   var ntaq = await allServicesRemoteDataSource.fetchNtaq( empId);

    return ntaq;
  }

  @override
  Future<NtaqTypesResponse> fetchNtaqTypes() async{
    var ntaqTypes = await allServicesRemoteDataSource.fetchNtaqTypes();
    return ntaqTypes;
  }
  
  @override
  Future<AllAdsResponse> fetchAllAds() {
    var ads = allServicesRemoteDataSource.fetchAllAds();
    return ads;
  }
}
