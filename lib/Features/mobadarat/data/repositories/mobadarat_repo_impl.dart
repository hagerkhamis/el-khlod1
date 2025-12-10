import 'package:elkhlod/Features/mobadarat/data/data_sources/remote_data_source/all_mobadarat_remote_data_source.dart';
import 'package:elkhlod/Features/mobadarat/data/data_sources/remote_data_source/delete_mobadarat_remote_data_Source.dart';
import 'package:elkhlod/Features/mobadarat/data/data_sources/remote_data_source/sent_mobadarat_remote_data_source.dart';

import '../../domain/repositories/mobadarat_repo.dart';

class MobadaratRepositoryImp extends MobadaratRepo {
  final AllMobadaratRemoteDataSource allMobadaratRemoteDataSource;
  final AddMobadaratRemoteDataSource addMobadartRemoteDataSource;
  final DeleteMobadaratRemoteDataSource deleteMobadaratRemoteDataSource;

  MobadaratRepositoryImp(
    this.addMobadartRemoteDataSource,
    this.allMobadaratRemoteDataSource,
    this.deleteMobadaratRemoteDataSource,
  );

  @override
  Future<AddMobadaratResponse> addMobadarat(
      String empId, String typeId, String reason) async {
    var userData =
        await addMobadartRemoteDataSource.addMobadarat(empId, typeId, reason);

    return userData;
  }

  @override
  Future<AllMobadaratResponse> fetchAllMobadarat(
      String userId, String status) async {
    var userData =
        await allMobadaratRemoteDataSource.fetchAllMobadarat(userId, status);

    return userData;
  }

  @override
  Future<DeleteMobadaratResponse> deleteMobadarat(
      String talabId, String userId) async {
    var userData =
        await deleteMobadaratRemoteDataSource.deleteMobadarat(talabId, userId);

    return userData;
  }
}
