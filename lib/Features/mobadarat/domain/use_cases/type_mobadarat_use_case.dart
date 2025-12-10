import 'package:elkhlod/Features/mobadarat/data/data_sources/remote_data_source/all_mobadarat_remote_data_source.dart';
import 'package:elkhlod/Features/mobadarat/data/data_sources/remote_data_source/delete_mobadarat_remote_data_Source.dart';
import 'package:elkhlod/Features/mobadarat/data/data_sources/remote_data_source/sent_mobadarat_remote_data_source.dart';

import '../repositories/mobadarat_repo.dart';

abstract class UseCase<type, Param> {
  Future<AllMobadaratResponse> fetchAllMobadarat(String userId, String status);
  Future<AddMobadaratResponse> addMobadarat(
      String empId, String typeId, String reason);

  Future<DeleteMobadaratResponse> deleteMobadarat(
      String talabId, String userId);
}

class MobadaratUseCase extends UseCase<dynamic, void> {
  final MobadaratRepo ezenRepository;
  MobadaratUseCase(this.ezenRepository);

  @override
  Future<AllMobadaratResponse> fetchAllMobadarat(
      String userId, String status) async {
    return await ezenRepository.fetchAllMobadarat(userId, status);
  }

  @override
  Future<AddMobadaratResponse> addMobadarat(
      String empId, String typeId, String reason) async {
    return await ezenRepository.addMobadarat(empId, typeId, reason);
  }

  @override
  Future<DeleteMobadaratResponse> deleteMobadarat(
      String talabId, String userId) async {
    return await ezenRepository.deleteMobadarat(talabId, userId);
  }
}
