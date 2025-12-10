import 'package:elkhlod/Features/ezen/data/data_sources/remote_data_source/egraa_ezen_remote_data_source.dart';
import 'package:elkhlod/Features/vacation/data/data_sources/remote_data_source/all_vacation_remote_data_source.dart';
import 'package:elkhlod/Features/vacation/data/data_sources/remote_data_source/delete_vacation_remote_data_Source.dart';
import 'package:elkhlod/Features/vacation/data/data_sources/remote_data_source/egraa_vacation_remote_data_source.dart';
import 'package:elkhlod/Features/vacation/data/data_sources/remote_data_source/sent_vacation_remote_data_source.dart';

import '../../domain/repositories/type_vacation_repo.dart';
import '../data_sources/remote_data_source/type_vacation_remote_data_source.dart';

class VacationRepositoryImp extends VacationRepo {
  final TypeVacationRemoteDataSource typeVacationRemoteDataSource;
  final AddVacationRemoteDataSource addVacationRemoteDataSource;
  final AllVacationRemoteDataSource allVacationRemoteDataSource;
  final DeleteVacationRemoteDataSource deleteVacationRemoteDataSource;
  final EgraaVacationRemoteDataSource egraaVactionRemoteDataSource;
  VacationRepositoryImp(
    this.addVacationRemoteDataSource,
    this.deleteVacationRemoteDataSource,
    this.typeVacationRemoteDataSource,
    this.allVacationRemoteDataSource,
    this.egraaVactionRemoteDataSource,
  );

  @override
  Future<TypeVacationResponse> fetchTypesEzenMessages() async {
    var userData = await typeVacationRemoteDataSource.fetchTypesEzen();

    return userData;
  }

  @override
  Future<AddVacationResponse> addVaction(String empId, String typeId,
      String fromTime, String toTime, String reason, dynamic attachment) async {
    var userData = await addVacationRemoteDataSource.addVacation(
        empId, typeId, fromTime, toTime, reason, attachment);

    return userData;
  }

  @override
  Future<AddVacationResponse> editVaction(String ezenId, String empId,
      String typeId, String fromTime, String toTime, String reason) async {
    var userData = await addVacationRemoteDataSource.editVacation(
        ezenId, empId, typeId, fromTime, toTime, reason);

    return userData;
  }

  @override
  Future<DeleteVacationResponse> deleteVaction(
      String ezenId, String userId) async {
    var userData =
        await deleteVacationRemoteDataSource.deleteVacation(ezenId, userId);

    return userData;
  }

  @override
  Future<AllVacationResponse> fetchAllVaction(
      String userId, String status) async {
    var userData =
        await allVacationRemoteDataSource.fetchAllVacation(userId, status);

    return userData;
  }

  @override
  Future<EgraaEzenResponse> egraaVaction(
      String empId, String eznId, String action, String reason,String numDays) async {
    var userData = await egraaVactionRemoteDataSource.egraaVaction(
        empId, eznId, action, reason, numDays);

    return userData;
  }



}
