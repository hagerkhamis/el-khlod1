

import '../../data/data_sources/remote_data_source/add_wathaek_remote_data_source.dart';
import '../../data/data_sources/remote_data_source/all_wathaek_remote_data_source.dart';
import '../../data/data_sources/remote_data_source/delete_wathaek_remote_data_Source.dart';

abstract class WathaekRepo {
  Future<AllWathaekResponse> fetchAllWathaek(String userId, String status);
  Future<AddWathaekResponse> addWathaek(
      String empId, String typeId, String reason , dynamic listFiles);
  Future<DeleteWathaekResponse> deleteWathaek(
      String talabId, String userId);
}
