import 'package:elkhlod/Features/vacation/data/data_sources/remote_data_source/sent_vacation_remote_data_source.dart';

import '../../data/data_sources/remote_data_source/all_vacation_remote_data_source.dart';
import '../../data/data_sources/remote_data_source/delete_vacation_remote_data_Source.dart';
import '../../data/data_sources/remote_data_source/egraa_vacation_remote_data_source.dart';
import '../../data/data_sources/remote_data_source/type_vacation_remote_data_source.dart';
import '../repositories/type_vacation_repo.dart';

abstract class UseCase<type, Param> {
  Future<TypeVacationResponse> callTypeVacation();
  Future<AllVacationResponse> allVacation(String userId, String status);
  Future<DeleteVacationResponse> deleteVacation(String ezenId, String userId);
  Future<EgraaVacationResponse> egraaVacation(
      String empId, String eznId, String action, String reason,String numDays);

  
}

class VacationUseCase extends UseCase<dynamic, void> {
  final VacationRepo vacationRepository;
  VacationUseCase(this.vacationRepository);
  @override
  Future<TypeVacationResponse> callTypeVacation() async {
    return await vacationRepository.fetchTypesEzenMessages();
  }

  Future<AddVacationResponse> addEzen(String empId, String typeId,
      String fromTime, String toTime, String reason, dynamic attachment) async {
    return await vacationRepository.addVaction(
        empId, typeId, fromTime, toTime, reason,attachment);
  }

  Future<AddVacationResponse> editEzen(String ezenId, String empId,
      String typeId, String fromTime, String toTime, String reason) async {
    return await vacationRepository.editVaction(
        ezenId, empId, typeId, fromTime, toTime, reason);
  }

  @override
  Future<DeleteVacationResponse> deleteVacation(
      String ezenId, String userId) async {
    return await vacationRepository.deleteVaction(ezenId, userId);
  }

  @override
  Future<AllVacationResponse> allVacation(String userId, String status) async {
    return await vacationRepository.fetchAllVaction(userId, status);
  }

  @override
  Future<EgraaVacationResponse> egraaVacation(
      String empId, String eznId, String action, String reason,String numDays) async {
    return await vacationRepository.egraaVaction(empId, eznId, action, reason, numDays);
  }

 

}
