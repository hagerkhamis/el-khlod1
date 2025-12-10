import 'package:elkhlod/Features/ezen/data/data_sources/remote_data_source/add_and-edit_ezen_remote_data_source.dart';
import 'package:elkhlod/Features/permission_edara/data/data_sources/remote_data_source/all_talabat_remote_data_source.dart';
import 'package:elkhlod/Features/permission_edara/data/data_sources/remote_data_source/delete_ezen_remote_data_Source.dart';
import 'package:elkhlod/Features/permission_edara/data/data_sources/remote_data_source/type_talabat_remote_data_source.dart';

abstract class TalabatRepo {
  Future<AllTalabatResponse> fetchAllTalabat(String userId, String status);
  Future<AddAndEditEzenResponse> addTalab(
      String empId, String typeId, String reason);
  Future<TalabatTypesResponse> fetchTypesTalabat();
  Future<DeleteTalabatResponse> deleteTalab(String talabId, String userId);
}
