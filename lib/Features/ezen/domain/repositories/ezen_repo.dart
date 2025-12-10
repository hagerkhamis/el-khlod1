import 'package:elkhlod/Features/ezen/data/data_sources/remote_data_source/all_ezen_remote_data_source.dart';
import 'package:elkhlod/Features/ezen/data/data_sources/remote_data_source/delete_ezen_remote_data_Source.dart';
import 'package:elkhlod/Features/ezen/data/data_sources/remote_data_source/egraa_ezen_remote_data_source.dart';
import 'package:elkhlod/Features/ezen/data/data_sources/remote_data_source/add_and-edit_ezen_remote_data_source.dart';

import '../../data/data_sources/remote_data_source/type_ezen_remote_data_source.dart';

abstract class EzenRepo {
  Future<TypeOzontaResponse> fetchTypesEzenMessages();

  Future<AddAndEditEzenResponse> addEzen(String empId, String typeId,
      String fromTime, String toTime, String reason, String ezenDate);


  Future<AddAndEditEzenResponse> editEzen(String ezenId, String empId,
      String typeId, String fromTime, String toTime, String reason, String ezenDate);

  Future<AllEzenResponse> fetchAllEzen(
    String userId,
    String status,
  );
  Future<AllEzenResponse> fetchWaredEzen(
    String userId,
  );

  Future<DeleteEzenResponse> deleteEzen(String ezenId, String userId);

  Future<EgraaEzenResponse> egraaEzen(
      String empId, String eznId, String action, String reason);
}
