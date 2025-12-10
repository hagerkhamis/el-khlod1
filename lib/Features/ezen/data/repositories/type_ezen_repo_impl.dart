import 'package:elkhlod/Features/ezen/data/data_sources/remote_data_source/all_ezen_remote_data_source.dart';
import 'package:elkhlod/Features/ezen/data/data_sources/remote_data_source/delete_ezen_remote_data_Source.dart';
import 'package:elkhlod/Features/ezen/data/data_sources/remote_data_source/egraa_ezen_remote_data_source.dart';
import 'package:elkhlod/Features/ezen/data/data_sources/remote_data_source/add_and-edit_ezen_remote_data_source.dart';

import '../../domain/repositories/ezen_repo.dart';
import '../data_sources/remote_data_source/type_ezen_remote_data_source.dart';

class EzenRepositoryImp extends EzenRepo {
  final TypeEzenRemoteDataSource typeEzenRemoteDataSource;
  final AddAndEditEzenRemoteDataSource addAndEditEzenRemoteDataSource;
  final AllEzenRemoteDataSource allEzenRemoteDataSource;

  final DeleteEzenRemoteDataSource deleteEzenRemoteDataSource;
  final EgraaEzenRemoteDataSource egraaEzenRemoteDataSource;

  EzenRepositoryImp(
    this.addAndEditEzenRemoteDataSource,
    this.deleteEzenRemoteDataSource,
    this.typeEzenRemoteDataSource,
    this.allEzenRemoteDataSource,
    this.egraaEzenRemoteDataSource,
  );

  @override
  Future<TypeOzontaResponse> fetchTypesEzenMessages() async {
    var userData = await typeEzenRemoteDataSource.fetchTypesEzen();

    return userData;
  }

  @override
  Future<AddAndEditEzenResponse> addEzen(String empId, String typeId,
      String fromTime, String toTime, String reason, String ezenDate) async {
    var userData = await addAndEditEzenRemoteDataSource.addEzen(
        empId, typeId, fromTime, toTime, reason, ezenDate);

    return userData;
  }

  @override
  Future<AddAndEditEzenResponse> editEzen(String ezenId, String empId,
      String typeId, String fromTime, String toTime, String reason, String ezenDate) async {
    var userData = await addAndEditEzenRemoteDataSource.editEzen(
        ezenId, empId, typeId, fromTime, toTime, reason, ezenDate);

    return userData;
  }

  @override
  Future<DeleteEzenResponse> deleteEzen(String ezenId, String userId) async {
    var userData =
        await deleteEzenRemoteDataSource.deleteMessage(ezenId, userId);

    return userData;
  }

  @override
  Future<AllEzenResponse> fetchAllEzen(String userId, String status) async {
    var userData = await allEzenRemoteDataSource.fetchAllEzen(userId, status);

    return userData;
  }

  @override
  Future<AllEzenResponse> fetchWaredEzen(String userId) async {
    var userData = await allEzenRemoteDataSource.fetchWaredEzen(userId);

    return userData;
  }

  @override
  Future<EgraaEzenResponse> egraaEzen(
      String empId, String eznId, String action, String reason) async {
    var userData =
        await egraaEzenRemoteDataSource.egraaEzen(empId, eznId, action, reason);

    return userData;
  }
}
