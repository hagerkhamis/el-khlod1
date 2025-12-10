import 'package:elkhlod/Features/permission_edara/data/data_sources/remote_data_source/all_talabat_remote_data_source.dart';
import 'package:elkhlod/Features/permission_edara/data/data_sources/remote_data_source/delete_ezen_remote_data_Source.dart';
import 'package:elkhlod/Features/permission_edara/data/data_sources/remote_data_source/sent_talabat_remote_data_source.dart';

import '../../data/data_sources/remote_data_source/type_talabat_remote_data_source.dart';
import '../repositories/talab_repo.dart';

abstract class UseCase<type, Param> {
  Future<AllTalabatResponse> fetchAllTalabat(String userId, String status);
  Future<AddTalabatResponse> addTalab(
      String empId, String typeId, String reason);
  Future<TalabatTypesResponse> fetchTypesTalabat();

  Future<DeleteTalabatResponse> deleteTalab(String talabId, String userId);
}

class TalabatUseCase extends UseCase<dynamic, void> {
  final TalabatRepo ezenRepository;
  TalabatUseCase(this.ezenRepository);

  @override
  Future<AllTalabatResponse> fetchAllTalabat(
      String userId, String status) async {
    return await ezenRepository.fetchAllTalabat(userId, status);
  }

  @override
  Future<AddTalabatResponse> addTalab(
      String empId, String typeId, String reason) async {
    return await ezenRepository.addTalab(empId, typeId, reason);
  }

  @override
  Future<TalabatTypesResponse> fetchTypesTalabat() async {
    return await ezenRepository.fetchTypesTalabat();
  }

  @override
  Future<DeleteTalabatResponse> deleteTalab(
      String talabId, String userId) async {
    return await ezenRepository.deleteTalab(talabId, userId);
  }
}
