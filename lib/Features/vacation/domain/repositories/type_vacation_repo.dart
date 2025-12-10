import 'package:elkhlod/Features/vacation/data/data_sources/remote_data_source/all_vacation_remote_data_source.dart';
import 'package:elkhlod/Features/vacation/data/data_sources/remote_data_source/delete_vacation_remote_data_Source.dart';
import 'package:elkhlod/Features/vacation/data/data_sources/remote_data_source/egraa_vacation_remote_data_source.dart';
import 'package:elkhlod/Features/vacation/data/data_sources/remote_data_source/sent_vacation_remote_data_source.dart';

import '../../data/data_sources/remote_data_source/type_vacation_remote_data_source.dart';

abstract class VacationRepo {
  Future<TypeVacationResponse> fetchTypesEzenMessages();

  Future<AddVacationResponse> addVaction(String empId, String typeId,
      String fromTime, String toTime, String reason, dynamic attachment);

  Future<AddVacationResponse> editVaction(String ezenId, String empId,
      String typeId, String fromTime, String toTime, String reason);

  Future<AllVacationResponse> fetchAllVaction(
    String userId,
    String status,
  );

  Future<DeleteVacationResponse> deleteVaction(String ezenId, String userId);

  Future<EgraaVacationResponse> egraaVaction(
      String empId, String eznId, String action, String reason,String numDays);


}
