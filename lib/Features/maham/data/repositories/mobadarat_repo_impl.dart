import 'package:elkhlod/Features/maham/data/data_sources/remote_data_source/all_maham_remote_data_source.dart';
import 'package:elkhlod/Features/maham/data/data_sources/remote_data_source/delete_maham_remote_data_Source.dart';
import 'package:elkhlod/Features/maham/data/data_sources/remote_data_source/sent_maham_remote_data_source.dart';

import '../../domain/repositories/maham_repo.dart';

class MahamRepositoryImp extends MahamRepo {
  final AllMahamRemoteDataSource allMMahamRemoteDataSource;
  final AddMahamRemoteDataSource addMahamRemoteDataSource;
  final DeleteMahamRemoteDataSource deleteMahamRemoteDataSource;

  MahamRepositoryImp(
    this.addMahamRemoteDataSource,
    this.allMMahamRemoteDataSource,
    this.deleteMahamRemoteDataSource,
  );

  @override
  Future<AddMahamResponse> addMaham(
      String empId, String typeId, String reason, String status) async {
    var userData = await addMahamRemoteDataSource.addMaham(
        empId, typeId, reason, status);

    return userData;
  }

  @override
  Future<AllMahamResponse> fetchAllMaham(String userId, String status) async {
    var userData =
        await allMMahamRemoteDataSource.fetchAllMaham(userId, status);

    return userData;
  }

  @override
  Future<DeleteMohamResponse> deleteMaham(String talabId, String userId) async {
    var userData =
        await deleteMahamRemoteDataSource.deleteMaham(talabId, userId);

    return userData;
  }
}
