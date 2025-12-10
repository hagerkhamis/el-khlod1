import 'package:elkhlod/Features/permission_edara/data/data_sources/remote_data_source/all_talabat_remote_data_source.dart';
import 'package:elkhlod/Features/permission_edara/data/data_sources/remote_data_source/delete_ezen_remote_data_Source.dart';
import 'package:elkhlod/Features/permission_edara/data/data_sources/remote_data_source/sent_talabat_remote_data_source.dart';

import '../../domain/repositories/talab_repo.dart';
import '../data_sources/remote_data_source/type_talabat_remote_data_source.dart';

class TalabatRepositoryImp extends TalabatRepo {
  final TypeTalabatRemoteDataSource typeEzenRemoteDataSource;
  final AllTalabatRemoteDataSource allEzenRemoteDataSource;
  final AddTalabatRemoteDataSource addEzenRemoteDataSource;
  final DeleteTalabatRemoteDataSource deleteTalabatRemoteDataSource;

  TalabatRepositoryImp(
    this.addEzenRemoteDataSource,
    this.typeEzenRemoteDataSource,
    this.allEzenRemoteDataSource,
    this.deleteTalabatRemoteDataSource,
  );

  @override
  Future<TalabatTypesResponse> fetchTypesTalabat() async {
    var userData = await typeEzenRemoteDataSource.fetchTypesTalabat();

    return userData;
  }

  @override
  Future<AddTalabatResponse> addTalab(
      String empId, String typeId, String reason) async {
    var userData =
        await addEzenRemoteDataSource.addTalab(empId, typeId, reason);

    return userData;
  }

  @override
  Future<AllTalabatResponse> fetchAllTalabat(
      String userId, String status) async {
    var userData =
        await allEzenRemoteDataSource.fetchAllTalabat(userId, status);

    return userData;
  }

  @override
  Future<DeleteTalabatResponse> deleteTalab(
      String talabId, String userId) async {
    var userData =
        await deleteTalabatRemoteDataSource.deleteTalab(talabId, userId);

    return userData;
  }
}
