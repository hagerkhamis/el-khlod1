import 'package:elkhlod/Features/visits/data/data_sources/remote_data_source/all_visits_remote_data_source.dart';
import 'package:elkhlod/Features/visits/data/data_sources/remote_data_source/bnod_remote_data_source.dart';
import 'package:elkhlod/Features/visits/data/data_sources/remote_data_source/delete_visits_remote_data_Source.dart';
import 'package:elkhlod/Features/visits/data/data_sources/remote_data_source/sent_visits_remote_data_source.dart';
import 'package:elkhlod/Features/visits/data/data_sources/remote_data_source/teachers_remote_data_source.dart';

import '../../domain/repositories/visits_repo.dart';

class VisitsRepositoryImp extends VisitsRepo {
  final AllVisitsRemoteDataSource allVisitsRemoteDataSource;
  final AddVisitsRemoteDataSource addMobadartRemoteDataSource;
  final DeleteVisitsRemoteDataSource deleteVisitsRemoteDataSource;
  final AllTeachersRemoteDataSource allTeachersRemoteDataSource;
  final AllBnodRemoteDataSource allBnodRemoteDataSource;

  VisitsRepositoryImp(
    this.addMobadartRemoteDataSource,
    this.allVisitsRemoteDataSource,
    this.deleteVisitsRemoteDataSource,
    this.allTeachersRemoteDataSource,
    this.allBnodRemoteDataSource,
  );

  @override
  Future<AddVisitsResponse> addVisits(
      String empId,
      String techerId,
      String title,
      String reason,
      String hesa,
      String numStudent,
      String fasl,
      var listBnod) async {
    var userData = await addMobadartRemoteDataSource.addVisits(
        empId, techerId, title, reason, hesa, numStudent, fasl, listBnod);

    return userData;
  }

  @override
  Future<AllVisitsResponse> fetchAllVisits(String userId, String status) async {
    var userData =
        await allVisitsRemoteDataSource.fetchAllVisits(userId, status);

    return userData;
  }

  @override
  Future<DeleteVisitsResponse> deleteVisits(
      String talabId, String userId) async {
    var userData =
        await deleteVisitsRemoteDataSource.deleteVisits(talabId, userId);

    return userData;
  }

  @override
  Future<AllBnodResponse> fetchAllBnod(String techerId) async {
    var userData = await allBnodRemoteDataSource.fetchAllBnod(techerId);

    return userData;
  }

  @override
  Future<AllTeacherResponse> fetchAllTeacher(String userId) async {
    var userData = await allTeachersRemoteDataSource.fetchAllTeacher(userId);

    return userData;
  }
}
