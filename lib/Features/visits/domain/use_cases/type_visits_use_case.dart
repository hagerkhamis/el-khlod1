import 'package:elkhlod/Features/visits/data/data_sources/remote_data_source/all_visits_remote_data_source.dart';
import 'package:elkhlod/Features/visits/data/data_sources/remote_data_source/delete_visits_remote_data_Source.dart';
import 'package:elkhlod/Features/visits/data/data_sources/remote_data_source/sent_visits_remote_data_source.dart';

import '../../data/data_sources/remote_data_source/bnod_remote_data_source.dart';
import '../../data/data_sources/remote_data_source/teachers_remote_data_source.dart';
import '../repositories/visits_repo.dart';

abstract class UseCase<type, Param> {
  Future<AllVisitsResponse> fetchAllVisits(String userId, String status);
  Future<AddVisitsResponse> addVisits(
      String empId,
    String techerId,
        String title,

    String reason,
    String hesa,
    String numStudent,
    String fasl,
    var listBnod,);

  Future<DeleteVisitsResponse> deleteVisits(
      String talabId, String userId);

  Future<AllBnodResponse> fetchAllBnod(String techerId);

  Future<AllTeacherResponse> fetchAllTeacher(String userId);
}

class VisitsUseCase extends UseCase<dynamic, void> {
  final VisitsRepo ezenRepository;
  VisitsUseCase(this.ezenRepository);

  @override
  Future<AllVisitsResponse> fetchAllVisits(
      String userId, String status) async {
    return await ezenRepository.fetchAllVisits(userId, status);
  }

  @override
  Future<AddVisitsResponse> addVisits(
       String empId,
    String techerId,
        String title,

    String reason,
    String hesa,
    String numStudent,
    String fasl,
    var listBnod,) async {
    return await ezenRepository.addVisits(empId, techerId,title, reason, hesa, numStudent, fasl, listBnod);
  }

  @override
  Future<DeleteVisitsResponse> deleteVisits(
      String talabId, String userId) async {
    return await ezenRepository.deleteVisits(talabId, userId);
  }
  
  @override
  Future<AllBnodResponse> fetchAllBnod(String userId) async{
     
    return await ezenRepository.fetchAllBnod(userId);
  }
  
  @override
  Future<AllTeacherResponse> fetchAllTeacher(String userId) async{

    return await ezenRepository.fetchAllTeacher(userId);
  }
}
