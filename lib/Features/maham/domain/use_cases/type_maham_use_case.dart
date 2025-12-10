import 'package:elkhlod/Features/maham/data/data_sources/remote_data_source/all_maham_remote_data_source.dart';
import 'package:elkhlod/Features/maham/data/data_sources/remote_data_source/delete_maham_remote_data_Source.dart';
import 'package:elkhlod/Features/maham/data/data_sources/remote_data_source/sent_maham_remote_data_source.dart';

import '../repositories/maham_repo.dart';

abstract class UseCase<type, Param> {
  Future<AllMahamResponse> fetchAllMaham(String userId, String status);
  Future<AddMahamResponse> addMaham(
      String empId, String typeId, String reason, String status);

  Future<DeleteMohamResponse> deleteMaham(String talabId, String userId);
}

class MahamUseCase extends UseCase<dynamic, void> {
  final MahamRepo ezenRepository;
  MahamUseCase(this.ezenRepository);

  @override
  Future<AllMahamResponse> fetchAllMaham(String userId, String status) async {
    return await ezenRepository.fetchAllMaham(userId, status);
  }

  @override
  Future<AddMahamResponse> addMaham(
      String empId, String typeId, String reason, String status) async {
    return await ezenRepository.addMaham(empId, typeId, reason, status);
  }

  @override
  Future<DeleteMohamResponse> deleteMaham(String talabId, String userId) async {
    return await ezenRepository.deleteMaham(talabId, userId);
  }
}
