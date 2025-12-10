

import '../../domain/repositories/Wathaek_repo.dart';
import '../data_sources/remote_data_source/add_wathaek_remote_data_source.dart';
import '../data_sources/remote_data_source/all_wathaek_remote_data_source.dart';
import '../data_sources/remote_data_source/delete_wathaek_remote_data_Source.dart';

class WathaekRepositoryImp extends WathaekRepo {
  final AllWathaekRemoteDataSource allWathaekRemoteDataSource;
  final AddWathaekRemoteDataSource addWathaekRemoteDataSource;
  final DeleteWathaekRemoteDataSource deleteWathaekRemoteDataSource;

  WathaekRepositoryImp(
    this.addWathaekRemoteDataSource,
    this.allWathaekRemoteDataSource,
    this.deleteWathaekRemoteDataSource,
  );

  @override
  Future<AddWathaekResponse> addWathaek(
      String empId, String typeId, String reason, dynamic  listFiles) async {
    var userData =
        await addWathaekRemoteDataSource.addWathaek(empId, typeId, reason ,listFiles  );

    return userData;
  }

  @override
  Future<AllWathaekResponse> fetchAllWathaek(
      String userId, String status) async {
    var userData =
        await allWathaekRemoteDataSource.fetchAllWathaek(userId, status);

    return userData;
  }

  @override
  Future<DeleteWathaekResponse> deleteWathaek(
      String talabId, String userId) async {
    var userData =
        await deleteWathaekRemoteDataSource.deleteWathaek(talabId, userId);

    return userData;
  }
}
