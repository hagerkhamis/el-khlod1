
import 'package:dio/dio.dart';

import '../../data/data_sources/remote_data_source/add_wathaek_remote_data_source.dart';
import '../../data/data_sources/remote_data_source/all_wathaek_remote_data_source.dart';
import '../../data/data_sources/remote_data_source/delete_wathaek_remote_data_Source.dart';
import '../repositories/Wathaek_repo.dart';

abstract class UseCase<type, Param> {
  Future<AllWathaekResponse> fetchAllWathaek(String userId, String status);
  Future<AddWathaekResponse> addWathaek(
      String empId, String typeId, String reason, MultipartFile listFiles);

  Future<DeleteWathaekResponse> deleteWathaek(String talabId, String userId);
}

class WathaekUseCase extends UseCase<dynamic, void> {
  final WathaekRepo ezenRepository;
  WathaekUseCase(this.ezenRepository);

  @override
  Future<AllWathaekResponse> fetchAllWathaek(
      String userId, String status) async {
    return await ezenRepository.fetchAllWathaek(userId, status);
  }

  @override
  Future<AddWathaekResponse> addWathaek(String empId, String typeId,
      String reason, dynamic listFiles) async {
    return await ezenRepository.addWathaek(empId, typeId, reason, listFiles);
  }

  @override
  Future<DeleteWathaekResponse> deleteWathaek(
      String talabId, String userId) async {
    return await ezenRepository.deleteWathaek(talabId, userId);
  }
}
