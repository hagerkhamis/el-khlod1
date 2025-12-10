import 'package:elkhlod/Features/ezen/data/data_sources/remote_data_source/all_ezen_remote_data_source.dart';
import 'package:elkhlod/Features/ezen/data/data_sources/remote_data_source/delete_ezen_remote_data_Source.dart';
import 'package:elkhlod/Features/ezen/data/data_sources/remote_data_source/egraa_ezen_remote_data_source.dart';
import 'package:elkhlod/Features/ezen/data/data_sources/remote_data_source/add_and-edit_ezen_remote_data_source.dart';

import '../../data/data_sources/remote_data_source/type_ezen_remote_data_source.dart';
import '../repositories/ezen_repo.dart';

abstract class UseCase<type, Param> {
  Future<TypeOzontaResponse> callTypeEzen();
  Future<AllEzenResponse> allEzen(String userId, String status);
  Future<AllEzenResponse> waredEzen(String userId);
  Future<AddAndEditEzenResponse> addEzen(String empId, String typeId,
      String fromTime, String toTime, String reason, String ezenDate);
  Future<AddAndEditEzenResponse> editEzen(String ezenId, String empId,
      String typeId, String fromTime, String toTime, String reason, String ezenDate);
  Future<DeleteEzenResponse> deleteEzen(String ezenId, String userId);
  Future<EgraaEzenResponse> egraaEzen(
      String empId, String eznId, String action, String reason);
}

class EzenUseCase extends UseCase<dynamic, void> {
  final EzenRepo ezenRepo;
  EzenUseCase(this.ezenRepo);
  @override
  Future<TypeOzontaResponse> callTypeEzen() async {
    return await ezenRepo.fetchTypesEzenMessages();
  }

  @override
  Future<AddAndEditEzenResponse> addEzen(String empId, String typeId,
      String fromTime, String toTime, String reason, String ezenDate) async {
    return await ezenRepo.addEzen(
        empId, typeId, fromTime, toTime, reason, ezenDate);
  }

  @override
  Future<AddAndEditEzenResponse> editEzen(String ezenId, String empId,
      String typeId, String fromTime, String toTime, String reason, String ezenDate) async {
    return await ezenRepo.editEzen(
        ezenId, empId, typeId, fromTime, toTime, reason, ezenDate);
  }

  @override
  Future<DeleteEzenResponse> deleteEzen(String ezenId, String userId) async {
    return await ezenRepo.deleteEzen(ezenId, userId);
  }

  @override
  Future<AllEzenResponse> allEzen(String userId, String status) async {
    return await ezenRepo.fetchAllEzen(userId, status);
  }

  @override
  Future<AllEzenResponse> waredEzen(String userId) async {
    return await ezenRepo.fetchWaredEzen(userId);
  }

  @override
  Future<EgraaEzenResponse> egraaEzen(
      String empId, String eznId, String action, String reason) async {
    return await ezenRepo.egraaEzen(empId, eznId, action, reason);
  }
}
