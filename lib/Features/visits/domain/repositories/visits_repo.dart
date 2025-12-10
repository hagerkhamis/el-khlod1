import 'package:elkhlod/Features/visits/data/data_sources/remote_data_source/all_visits_remote_data_source.dart';
import 'package:elkhlod/Features/visits/data/data_sources/remote_data_source/bnod_remote_data_source.dart';
import 'package:elkhlod/Features/visits/data/data_sources/remote_data_source/delete_visits_remote_data_Source.dart';
import 'package:elkhlod/Features/visits/data/data_sources/remote_data_source/teachers_remote_data_source.dart';

import '../../data/data_sources/remote_data_source/sent_visits_remote_data_source.dart';

abstract class VisitsRepo {
  Future<AllVisitsResponse> fetchAllVisits(String userId, String status);
  Future<AddVisitsResponse> addVisits(
      String empId,
      String techerId,
      String title,
      String reason,
      String hesa,
      String numStudent,
      String fasl,
      var listBnod);
  Future<DeleteVisitsResponse> deleteVisits(String talabId, String userId);

  Future<AllTeacherResponse> fetchAllTeacher(String userId);
  Future<AllBnodResponse> fetchAllBnod(String techerId);
}
